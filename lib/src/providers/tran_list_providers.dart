import 'package:simple_money_tracker/src/core/core.dart';
import 'package:simple_money_tracker/src/data/repositories/i_tran_repo.dart';

import '../../exports.dart';
import '../data/models/tran_model.dart';

part "tran_list_providers.freezed.dart";

enum ViewRange { daily, weekly, monthly, quarter, yearly, all, custom }

class TranListProvider {
  const TranListProvider._();

  static final viewRange = StateProvider<ViewRange>((ref) {
    return ViewRange.weekly;
  });

  static final selectedDate = StateProvider<DateTime>((ref) {
    return DateTime.now();
  });

  static final filter = Provider<TranFilterState>((ref) {
    final range = ref.watch(viewRange);
    final date = ref.watch(selectedDate);

    return TranFilterState(
      startedDate: date.firstDayOfWeek,
      endedDate: date.lastDayOfWeek,
    );
  });

  static final streamAll = StreamProvider.autoDispose<IList<TranModel>>((ref) {
    final tranFilter = ref.watch(filter);
    return ref
        .watch(tranRepoProvider)
        .streamByDate(
          startedDate: tranFilter.startedDate.dateOnly(),
          endedDate: tranFilter.endedDate.lastMinuteOfDay(),
        )
        .map((event) => event.fold((l) => throw l, id));
  });

  static final allDate = Provider.autoDispose<AsyncValue<IList<DateTime>>>((ref) {
    return ref.watch(streamAll).whenData((value) {
      return value.map((e) => e.date).toIList().removeDuplicates();
    });
  });

  static final dateByIndex = Provider.autoDispose.family<DateTime, int>((ref, index) {
    final list = ref.watch(allDate).valueOrNull ?? const IListConst([]);
    return list.getOrNull(index) ?? DateTime.now();
  });

  static final allDateCount = Provider.autoDispose<AsyncValue<int>>((ref) {
    return ref.watch(allDate).whenData((value) => value.length);
  });

  static final expenseIncome = Provider.autoDispose<AsyncValue<ExpanseIncome>>((ref) {
    return ref.watch(streamAll).whenData(
      (trans) {
        var incomeAmount = 0.0;
        var expenseAmount = 0.0;
        for (final tran in trans) {
          tran.map(
            income: (income) => incomeAmount += income.amount,
            expenses: (expense) => expenseAmount += expense.amount,
          );
        }
        return ExpanseIncome(expense: expenseAmount, income: incomeAmount);
      },
    );
  });

  static final dailyTrans =
      Provider.autoDispose.family<AsyncValue<IList<TranModel>>, DateTime>((ref, date) {
    return ref.watch(streamAll).whenData((list) => list
        .where((e) => e.date.between(date.dateOnly(), date.lastMinuteOfDay()))
        .toIList());
  });
  static final totalDailyAmount =
      Provider.autoDispose.family<AsyncValue<double>, DateTime>((ref, date) {
    return ref.watch(dailyTrans(date)).whenData(
      (trans) {
        var balance = 0.0;
        for (final tran in trans) {
          tran.map(
            income: (income) => balance += income.amount,
            expenses: (expense) => balance -= expense.amount,
          );
        }
        return balance;
      },
    );
  });

  static final tranDetail =
      Provider.autoDispose.family<TranModel, TranDateAndIndex>((ref, dateIndex) {
    final baseList = ref.watch(dailyTrans(dateIndex.date)).value!;
    return baseList.get(dateIndex.index);
  });

  static final dailyTranCount =
      Provider.autoDispose.family<AsyncValue<int>, DateTime>((ref, date) {
    return ref.watch(dailyTrans(date)).whenData((value) => value.length);
  });
}

@freezed
class TranDateAndIndex with _$TranDateAndIndex {
  factory TranDateAndIndex({
    required DateTime date,
    required int index,
  }) = _TranDateAndIndex;
}

@freezed
class ExpanseIncome with _$ExpanseIncome {
  factory ExpanseIncome({
    required double expense,
    required double income,
  }) = _ExpanseIncome;
}

@freezed
class TranFilterState with _$TranFilterState {
  factory TranFilterState({
    required DateTime startedDate,
    required DateTime endedDate,
  }) = _TranFilterState;
}
