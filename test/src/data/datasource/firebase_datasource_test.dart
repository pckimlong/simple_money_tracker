import 'package:currency_picker/currency_picker.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:simple_money_tracker/src/core/core.dart';
import 'package:simple_money_tracker/src/data/datasource/firebase_datasource.dart';
import 'package:simple_money_tracker/src/data/datasource/firebase_helpers.dart';
import 'package:simple_money_tracker/src/data/models/account_model.dart';
import 'package:simple_money_tracker/src/data/models/category_model.dart';
import 'package:simple_money_tracker/src/data/models/currency_model.dart';
import 'package:simple_money_tracker/src/data/models/tran_model.dart';
import 'package:uuid/uuid.dart';

void main() {
  late FakeFirebaseFirestore fakeFirestore;
  late FirebaseDataSource dataSource;
  setUp(() {
    fakeFirestore = FakeFirebaseFirestore();
    dataSource = FirebaseDataSource(fakeFirestore);
  });

  group('firebase datasource ...', () {
    group(
      'Currency',
      () {
        final c1 = Currency(
          code: 'code',
          name: 'df',
          symbol: 'symbol',
          flag: 'flag',
          number: 2,
          decimalDigits: 2,
          namePlural: 'namePlural',
          symbolOnLeft: true,
          decimalSeparator: 'decimalSeparator',
          thousandsSeparator: 'thousandsSeparator',
          spaceBetweenAmountAndSymbol: false,
        );
        final c2 = Currency(
          code: 'code',
          name: 'df',
          symbol: 'symbol',
          flag: 'flag',
          number: 2,
          decimalDigits: 2,
          namePlural: 'namePlural',
          symbolOnLeft: true,
          decimalSeparator: 'decimalSeparator',
          thousandsSeparator: 'thousandsSeparator',
          spaceBetweenAmountAndSymbol: false,
        );
        group(
          'CreateCurrency method',
          () {
            final id = const Uuid().v1();
            final mockData = CurrencyModel(
              id: id,
              currency: c1,
              isDefault: false,
              exchangedRate: null,
            );

            test(
              'should create currency',
              () async {
                //Arrange
                final id = const Uuid().v1();
                final toCreate = mockData.copyWith(id: id);

                //Act
                await dataSource.createCurrency(toCreate);
                final doc = await fakeFirestore.currenciesDoc.get();

                //Assert
                expect(doc.data()?.length, 1);
                expect(doc.data(), {id: toCreate.toJson()});

                // Add another
                final id2 = const Uuid().v1();
                final toCreate2 = mockData.copyWith(id: id2, currency: c2);
                await dataSource.createCurrency(toCreate2);
                final doc2 = await fakeFirestore.currenciesDoc.get();

                expect(doc2.data()!.length, 2);
                expect(doc2.data(), {
                  id: toCreate.toJson(),
                  id2: toCreate2.toJson(),
                });
              },
            );
            test(
              'should throw Failure.uniqueConstrant if currency is already existed',
              () async {
                //Arrange
                final id = const Uuid().v1();
                final toCreate = mockData.copyWith(id: id);
                await fakeFirestore.currenciesDoc.set({id: toCreate.toJson()});

                //Act
                expect(() async {
                  await dataSource.createCurrency(toCreate);
                }, throwsException);
                try {
                  await dataSource.createCurrency(toCreate);
                } catch (e) {
                  final failure = e as Failure;
                  expect(
                    failure.maybeWhen(
                      orElse: () => false,
                      uniqueConstrant: (_, __) => true,
                    ),
                    isTrue,
                  );
                }
              },
            );
          },
        );

        group(
          'Update Currency method',
          () {
            final toUpdateId = const Uuid().v1();
            final toUpdate = CurrencyModel(
              id: toUpdateId,
              currency: c1,
              isDefault: false,
              exchangedRate: null,
            );

            test(
              'should update currency model without effect other field',
              () async {
                //Arrange
                final id = const Uuid().v1();
                final toCreate = toUpdate.copyWith(id: id);
                await fakeFirestore.currenciesDoc.set({
                  id: toCreate.toJson(),
                  toUpdateId: toUpdate.toJson(),
                });

                //Act
                await dataSource.updateCurrency(toUpdate.copyWith(currency: c2));
                final doc = await fakeFirestore.currenciesDoc.get();
                //Assert
                expect(doc.data(), {
                  id: toCreate.toJson(),
                  toUpdateId: toUpdate.copyWith(currency: c2).toJson(),
                });
              },
            );

            test(
              /// This won't happened because when user set up account, user required to create a default currency
              /// at that moment currency doc will be created as well
              'should throw not-found exception if try to update currency on a doc which have not created yet.',
              () async {
                //Act
                final emptyDoc = await fakeFirestore.currenciesDoc.get();
                expect(emptyDoc.data(), isNull);

                //Assert
                expect(() async {
                  await dataSource.updateCurrency(toUpdate);
                }, throwsException);
              },
            );
          },
        );

        group(
          'WatchAllCurrencies method',
          () {
            final model = CurrencyModel(
              id: "id1",
              currency: c1,
              isDefault: false,
              exchangedRate: null,
            );
            test(
              'should return stream of currencies',
              () async {
                //Act
                dataSource.createCurrency(model);
                dataSource.createCurrency(
                  model.copyWith(currency: c2, id: 'id2'),
                );
                //Assert
                /// Cannot compare because currency is not equaltable. So i need to
                /// compare id instead
                expect(
                  dataSource.watchAllCurrencies().map(
                        (event) => event.fold(
                          (l) => <String>[],
                          (r) => r.map((e) => e.id).toList(),
                        ),
                      ),
                  emitsInOrder([
                    [],
                    ["id1"],
                    ["id1", "id2"],
                  ]),
                );
              },
            );
          },
        );

        group(
          'DeleteCurrency method',
          () {
            final toDelete = CurrencyModel(
              id: 'id',
              currency: c1,
              isDefault: false,
              exchangedRate: null,
            );
            test(
              // To avoid error when no default currency for convert
              'should throw Failure.restricted task exception if trying to delete a default currency which currency.isDefault is true',
              () async {
                //Arrange
                await fakeFirestore.currenciesDoc.set(
                  {"id": toDelete.copyWith(isDefault: true).toJson()},
                );

                //Assert
                expect(
                  () async => await dataSource.deleteCurrency('id'),
                  throwsException,
                );
                try {
                  await dataSource.deleteCurrency('id');
                } catch (e) {
                  final failure = e as Failure;
                  expect(failure.whenOrNull(restrictedTask: (_) => true), isTrue);
                }
              },
            );

            test(
              'should throw Failure.noRecord if trying to delete non existed currency',
              () async {
                //Arrange
                await fakeFirestore.currenciesDoc.set(
                  {"id": toDelete.copyWith(isDefault: true).toJson()},
                );

                //Assert
                expect(
                  () async => await dataSource.deleteCurrency('not-existed-id'),
                  throwsException,
                );
                try {
                  await dataSource.deleteCurrency('not-existed-id');
                } catch (e) {
                  final failure = e as Failure;
                  expect(failure.whenOrNull(noRecord: (_) => true), isTrue);
                }
              },
            );

            test('should delete currency', () async {
              //Arrange
              await dataSource.createCurrency(
                toDelete.copyWith(id: 'id1', currency: c1),
              );
              await dataSource.createCurrency(
                toDelete.copyWith(id: 'id2', currency: c2),
              );
              final initialDoc = await fakeFirestore.currenciesDoc.get();

              //Act
              expect(initialDoc.data(), {
                'id1': toDelete.copyWith(id: 'id1', currency: c1).toJson(),
                'id2': toDelete.copyWith(id: 'id2', currency: c2).toJson(),
              });
              await dataSource.deleteCurrency('id2');

              final doc = await fakeFirestore.currenciesDoc.get();
              //Assert
              expect(doc.data(), {
                'id1': toDelete.copyWith(id: 'id1', currency: c2).toJson(),
              });
            });
          },
        );
      },
    );

    group('Transaction', () {
      Future<void> _createAccountForTransaction() async {
        await fakeFirestore.accountDoc.set(
          AccountModel(
            balance: 1000,
            totalIncome: 500,
            defaultCurrencyId: 'fdf',
            selectedCurrencyId: null,
          ),
        );
      }

      group('Expense', () {
        group('create method', () {
          test('should create expense and update total ', () async {
            //Arrange

            //Act

            //Assert
          });
        });
        group('update method', () {
          test('', () async {
            //Arrange

            //Act

            //Assert
          });
        });
        group('delete method', () {
          test('', () async {
            //Arrange

            //Act

            //Assert
          });
        });
        group('stream method', () {
          test('', () async {
            //Arrange

            //Act

            //Assert
          });
        });
      });
      group('Income', () {
        final mockData = Income(
          id: null,
          categoryId: "categoryId",
          amount: 2000,
          date: DateTime.now(),
          note: "",
          createdAt: DateTime.now(),
        );

        group('create method', () {
          test('should throw assert error if toCreate.type is not TranType.income',
              () async {
            //Arrange
            final model = mockData.copyWith(type: TranType.expense);

            expect(() async {
              await dataSource.createIncomeTran(model);
            }, throwsAssertionError);
          });

          test('should increment account balance and totalIncome', () async {
            await _createAccountForTransaction();
            await dataSource.createIncomeTran(mockData);
            final accountDoc = await fakeFirestore.accountDoc.get();

            expect(accountDoc.data()?.balance, equals(3000));
            expect(accountDoc.data()?.totalIncome, equals(2500));
          });

          test(
              'should create income and make sure cloud database model.id is not null return created income model with id',
              () async {
            await _createAccountForTransaction();
            final result = await dataSource.createIncomeTran(mockData);
            final doc = await fakeFirestore.tranColl.doc(result!.id).get();
            expect(doc.data()!.id, isNotNull);
            expect(result, mockData.copyWith(id: result.id));
          });
        });
        group('update method', () {
          test('should throw assert error if toUpdate.id is null', () async {
            //Arrange
            final model = mockData.copyWith(id: null);

            expect(() async {
              await dataSource.updateIncomeTran(model);
            }, throwsAssertionError);
          });
          test('should throw assert error if toUpdate.type is not TranType.income',
              () async {
            //Arrange
            final model = mockData.copyWith(type: TranType.expense, id: 'id');

            expect(() async {
              await dataSource.updateIncomeTran(model);
            }, throwsAssertionError);
          });
          test('should update balance and totalIncome of account', () async {
            //Arrange
            await _createAccountForTransaction();
            final result =
                await dataSource.createIncomeTran(mockData.copyWith(amount: 2000));

            final accBefore = await fakeFirestore.accountDoc.get();
            expect(accBefore.data()?.balance, equals(3000));
            expect(accBefore.data()?.totalIncome, equals(2500));

            //Act
            await dataSource.updateIncomeTran(mockData.copyWith(
              amount: 1000,
              id: result!.id,
            ));

            //Assert
            final accAfter = await fakeFirestore.accountDoc.get();
            expect(accAfter.data()?.balance, equals(2000));
            expect(accAfter.data()?.totalIncome, equals(1500));
          });
        });
        group('delete method', () {
          test('', () async {
            //Arrange

            //Act

            //Assert
          });
        });
        group('stream method', () {
          test('', () async {
            //Arrange

            //Act

            //Assert
          });
        });
      });
    });

    group(
      'Category',
      () {
        const id = "id";
        final mockData = CategoryModel(
          id: id,
          name: "name",
          tranType: TranType.income,
        );
        group(
          'Create method',
          () {
            test(
              'should create currency',
              () async {
                //Act
                await dataSource.createCategory(mockData);
                final doc = await fakeFirestore.categoriesDoc.get();

                //Assert
                expect(doc.data()?.length, 1);
                expect(doc.data(), {id: mockData.toJson()});

                // Add another
                final id2 = const Uuid().v1();
                final toCreate2 = mockData.copyWith(id: id2);
                await dataSource.createCategory(toCreate2);
                final doc2 = await fakeFirestore.currenciesDoc.get();

                expect(doc2.data()!.length, 2);
                expect(doc2.data(), {
                  id: mockData.toJson(),
                  id2: toCreate2.toJson(),
                });
              },
            );

            test(
                'should throw Failure.uniqueConstrant if category name is alreay existed',
                () async {
              //Arrange
              await fakeFirestore.categoriesDoc.set({id: mockData.toJson()});

              expect(() async {
                await dataSource.createCategory(mockData.copyWith(id: 'id2'));
              }, throwsException);
              try {
                await dataSource.createCategory(mockData.copyWith(id: 'id2'));
              } catch (e) {
                final failure = e as Failure;
                expect(failure.mapOrNull(uniqueConstrant: (_) => true), isTrue);
              }
            });
          },
        );

        group(
          'Update method',
          () {
            test(
              'should update category model without effect other field',
              () async {
                //Arrange
                await fakeFirestore.categoriesDoc.set({
                  id: mockData.toJson(),
                  "id2": mockData.copyWith(id: 'id2').toJson(),
                });

                //Act
                await dataSource.updateCategory(mockData.copyWith(name: 'newName'));
                final doc = await fakeFirestore.categoriesDoc.get();
                //Assert
                expect(doc.data(), {
                  id: mockData.copyWith(name: 'newName').toJson(),
                  "id2": mockData.copyWith(id: 'id2').toJson(),
                });
              },
            );

            test(
              'should set doc if there is a not-found exception when trying to updata on empty doc',
              () async {
                //Act
                final emptyDoc = await fakeFirestore.categoriesDoc.get();
                expect(emptyDoc.data(), isNull);

                await dataSource.updateCategory(mockData.copyWith(name: 'u'));

                final docAfter = await fakeFirestore.categoriesDoc.get();
                expect(docAfter.data(), {id: mockData.copyWith(name: 'u').toJson()});
              },
            );
          },
        );

        // group(
        //   'WatchAll method',
        //   () {
        //     test(
        //       'should return stream of categories',
        //       () async {
        //         //Act
        //         dataSource.createCategory(mockData);
        //         dataSource.createCategory(mockData.copyWith(id: 'id2'));
        //         expect(
        //           dataSource.watchAllCategories().map(
        //                 (event) => event.fold(
        //                   (l) => <String>[],
        //                   (r) => r.map((e) => e.id).toList(),
        //                 ),
        //               ),
        //           emitsInAnyOrder([
        //             [],
        //             [id],
        //             [id, "id2"],
        //           ]),
        //         );
        //       },
        //     );
        //   },
        // );

        group(
          'DeleteCurrency method',
          () {
            test('should delete currency', () async {
              //Arrange
              await dataSource.createCategory(mockData);
              await dataSource.createCategory(
                mockData.copyWith(id: 'id2'),
              );
              final initialDoc = await fakeFirestore.categoriesDoc.get();

              //Act
              expect(initialDoc.data(), {
                'id': mockData.copyWith(id: 'id').toJson(),
                'id2': mockData.copyWith(id: 'id2').toJson(),
              });
              await dataSource.deleteCategory('id2');

              final doc = await fakeFirestore.categoriesDoc.get();
              //Assert
              expect(doc.data(), {id: mockData.toJson()});
            });
          },
        );
      },
    );
  });
}
