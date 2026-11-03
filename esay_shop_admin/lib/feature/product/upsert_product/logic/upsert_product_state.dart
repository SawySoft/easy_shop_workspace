part of 'upsert_product_cubit.dart';

@freezed
class UpsertProductState with _$UpsertProductState {
  const factory UpsertProductState.initial() = _Initial;
  const factory UpsertProductState.loading() = _Loading;
  const factory UpsertProductState.success() = _Success;
  const factory UpsertProductState.failure(String message) = _Failure;
  const factory UpsertProductState.visibilityChanged(bool isVisible) = _VisibilityChanged;
}

