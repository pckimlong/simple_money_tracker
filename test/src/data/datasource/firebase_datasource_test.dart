import 'package:currency_picker/currency_picker.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:simple_money_tracker/src/core/core.dart';
import 'package:simple_money_tracker/src/data/datasource/firebase_datasource.dart';
import 'package:simple_money_tracker/src/data/datasource/firebase_helpers.dart';
import 'package:simple_money_tracker/src/data/models/currency_model.dart';
import 'package:uuid/uuid.dart';

void main() {
  late FakeFirebaseFirestore fakeFirestore;
  late FirebaseDataSource dataSource;
  setUp(() {
    fakeFirestore = FakeFirebaseFirestore();
    dataSource = FirebaseDataSource(fakeFirestore);
  });

  group(
    'firebase datasource ...',
    () {
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
    },
  );
}
