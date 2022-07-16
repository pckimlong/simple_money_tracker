import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:simple_money_tracker/exports.dart';
import 'package:simple_money_tracker/src/data/models/category_model.dart';
import 'package:simple_money_tracker/src/data/models/tran_model.dart';
import 'package:simple_money_tracker/src/data/repositories/repositories.dart';
import 'package:simple_money_tracker/src/providers/tran_providers.dart';

import '../../utils.dart';
import '../../utils.mocks.dart';

void main() {
  late MockITranRepo repo;

  setUp(() {
    repo = MockITranRepo();
  });

  group('tran providers ...', () {
    ProviderContainer _createContainer({
      List<Override> overrides = const [],
    }) {
      return createContainer(overrides: [
        tranRepoProvider.overrideWithValue(repo),
        ...overrides,
      ]);
    }

    final mockExpense = TranModel.expenses(
      id: 'id',
      categoryId: 'categoryId',
      amount: 10,
      date: DateTime.now(),
      note: '',
      createdAt: DateTime.now(),
    );
    final mockIncome = TranModel.income(
      id: 'id',
      categoryId: 'categoryId',
      amount: 10,
      date: DateTime.now(),
      note: '',
      createdAt: DateTime.now(),
    );

    group('Save provider', () {
      ProviderContainer _containerWithAddState(AddTranState addTranState) {
        return _createContainer(overrides: [
          TranProvider.addStateData.overrideWithValue(AddTranNotifier(addTranState))
        ]);
      }

      test('should not call to save transaction if amount is zero', () async {
        //Arrange
        final container = _containerWithAddState(
          AddTranState(
            category: some(CategoryModel.empty()),
            onDate: DateTime.now(),
          ),
        );

        //Act
        await container.read(TranProvider.save.notifier).create();

        //Assert
        expect(container.read(TranProvider.save).hasError, isTrue);
        verifyNever(repo.create(any));
      });
      test('should not call to save transaction if category is none()', () async {
        //Arrange
        final container = _containerWithAddState(
          AddTranState(
            category: none(),
            amount: 10,
            onDate: DateTime.now(),
          ),
        );

        //Act
        await container.read(TranProvider.save.notifier).create();

        //Assert
        expect(container.read(TranProvider.save).hasError, isTrue);
        verifyNever(repo.create(any));
      });
      test(
          'should not call to save transaction if saveState currenly saving or already save',
          () async {
        //Arrange
        when(repo.create(any)).thenAnswer((_) async => right(mockIncome));
        final container = _createContainer(overrides: [
          TranProvider.addStateData.overrideWithValue(
            AddTranNotifier(AddTranState(
              category: some(CategoryModel.empty()),
              amount: 10,
              onDate: DateTime.now(),
            )),
          )
        ]);

        //Act
        container.read(TranProvider.save.notifier).create();
        await container.read(TranProvider.save.notifier).create();

        //Assert
        verify(repo.create(any)).called(1);
      });
      test('should save expense tran if category.type is expense', () async {
        //Arrange
        when(repo.create(any)).thenAnswer((_) async => right(mockExpense));
        final container = _containerWithAddState(
          AddTranState(
            onDate: DateTime.now(),
            amount: 10,
            category: some(CategoryModel.empty(tranType: TranType.expense)),
          ),
        );

        //Act
        await container.read(TranProvider.save.notifier).create();

        //Assert
      });
      test('should save expense tran if category.type is expense', () async {
        //Arrange
        when(repo.create(any)).thenAnswer((_) async => right(mockExpense));
        final container = _containerWithAddState(
          AddTranState(
            onDate: DateTime.now(),
            amount: 10,
            category: some(CategoryModel.empty(tranType: TranType.expense)),
          ),
        );

        //Act
        await container.read(TranProvider.save.notifier).create();

        //Assert
      });
      test('should create tran having date with dateOnly', () async {
        //Arrange
        when(repo.create(any)).thenAnswer((_) async => right(mockIncome));
        final container = _createContainer(overrides: [
          TranProvider.addStateData.overrideWithValue(
            AddTranNotifier(AddTranState(
              category: some(CategoryModel.empty()),
              amount: 10,
              onDate: DateTime.now(),
            )),
          )
        ]);

        //Act
        container.read(TranProvider.save.notifier).create();
        await container.read(TranProvider.save.notifier).create();

        //Assert
        verify(repo.create(any)).called(1);
      });
    });
  });
}
