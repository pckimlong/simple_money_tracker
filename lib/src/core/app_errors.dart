import 'dart:async';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

import '../../exports.dart';

part "app_errors.freezed.dart";

@freezed
class Failure with _$Failure implements Exception {
  const factory Failure.noRecord([String? message]) = _NoRecord;
  const factory Failure.restrictedTask([String? message]) = _RestrictedTask;
  const factory Failure.exeption([String? message]) = _Exeption;
  const factory Failure.authExeption([String? message]) = _AuthExeption;
  const factory Failure.invalidValue([String? message]) = _InvalidValue;
  const factory Failure.uniqueConstrant([String? message, Object? duplicatedObject]) =
      _UniqueConstrant;

  factory Failure.fromException(Object? error) {
    if (error is FirebaseAuthException) {
      return Failure.authExeption(error.message);
    }
    if (error is FirebaseException) {
      if (error.code == "not-found") {
        return Failure.noRecord(error.message);
      }
    }

    return Failure.exeption(error?.toString());
  }
}

@freezed
class AuthFailure with _$AuthFailure implements Exception {
  factory AuthFailure() = _AuthFailure;
}

Future<Either<Failure, T>> errorHandler<T extends Object>(
    FutureOr<Either<Failure, T>> Function() callback) async {
  try {
    return await callback();
  } on Exception catch (e, stack) {
    log(e.toString(), error: e);
    FirebaseCrashlytics.instance.recordError(e, stack);

    if (e is Failure) {
      return left(e);
    }

    return left(Failure.fromException(e));
  }
}

extension StreamError<T> on Stream<Either<Failure, T>> {
  Stream<Either<Failure, T>> onErrorReturnWithFailure() {
    return onErrorReturnWith((error, stackTrace) {
      return left<Failure, T>(Failure.fromException(error));
    });
  }
}

class OptionIsNoneError extends Error {}
