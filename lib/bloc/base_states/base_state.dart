import 'package:freezed_annotation/freezed_annotation.dart';
part 'base_state.freezed.dart';

@freezed
class BaseState<T> with _$BaseState {
  const factory BaseState.initial() = BaseStateInitial<T>;

  const factory BaseState.progress() = BaseStateProgress<T>;

  const factory BaseState.dismissProgress() = BaseStateProgressDismiss<T>;

  const factory BaseState.noDataFound() = BaseStateNoDataFound<T>;

  const factory BaseState.noInternetConnection() =
      BaseStateNoInternetConnection<T>;

  const factory BaseState.internalServerError({required String error}) =
      BaseStateInternalServerError<T>;

  const factory BaseState.failure({required String error}) =
      BaseStateFailure<T>;

  const factory BaseState.notAuthorize({required String error}) =
      BaseStateNotAuthorize<T>;

  const factory BaseState.savedOrUpdatedSuccessfully({required T data}) =
      BaseStateSavedOrUpdatedSuccessfully<T>;

  const factory BaseState.loadedSuccessfully({required T data}) =
      BaseStateLoadedSuccessfully<T>;

  const factory BaseState.listLoadedSuccessfully({
    required List<T> data,
  }) = BaseStateListLoadedSuccessfully<T>;
}
