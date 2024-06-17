// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coin_store.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CoinViewState {
  List<BitCoinPriceResponse> get bitCoinPriceData =>
      throw _privateConstructorUsedError;
  List<BitCoinPriceResponse> get historicalPriceData =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CoinViewStateCopyWith<CoinViewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoinViewStateCopyWith<$Res> {
  factory $CoinViewStateCopyWith(
          CoinViewState value, $Res Function(CoinViewState) then) =
      _$CoinViewStateCopyWithImpl<$Res, CoinViewState>;
  @useResult
  $Res call(
      {List<BitCoinPriceResponse> bitCoinPriceData,
      List<BitCoinPriceResponse> historicalPriceData});
}

/// @nodoc
class _$CoinViewStateCopyWithImpl<$Res, $Val extends CoinViewState>
    implements $CoinViewStateCopyWith<$Res> {
  _$CoinViewStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bitCoinPriceData = null,
    Object? historicalPriceData = null,
  }) {
    return _then(_value.copyWith(
      bitCoinPriceData: null == bitCoinPriceData
          ? _value.bitCoinPriceData
          : bitCoinPriceData // ignore: cast_nullable_to_non_nullable
              as List<BitCoinPriceResponse>,
      historicalPriceData: null == historicalPriceData
          ? _value.historicalPriceData
          : historicalPriceData // ignore: cast_nullable_to_non_nullable
              as List<BitCoinPriceResponse>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CoinViewStateImplCopyWith<$Res>
    implements $CoinViewStateCopyWith<$Res> {
  factory _$$CoinViewStateImplCopyWith(
          _$CoinViewStateImpl value, $Res Function(_$CoinViewStateImpl) then) =
      __$$CoinViewStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<BitCoinPriceResponse> bitCoinPriceData,
      List<BitCoinPriceResponse> historicalPriceData});
}

/// @nodoc
class __$$CoinViewStateImplCopyWithImpl<$Res>
    extends _$CoinViewStateCopyWithImpl<$Res, _$CoinViewStateImpl>
    implements _$$CoinViewStateImplCopyWith<$Res> {
  __$$CoinViewStateImplCopyWithImpl(
      _$CoinViewStateImpl _value, $Res Function(_$CoinViewStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bitCoinPriceData = null,
    Object? historicalPriceData = null,
  }) {
    return _then(_$CoinViewStateImpl(
      bitCoinPriceData: null == bitCoinPriceData
          ? _value._bitCoinPriceData
          : bitCoinPriceData // ignore: cast_nullable_to_non_nullable
              as List<BitCoinPriceResponse>,
      historicalPriceData: null == historicalPriceData
          ? _value._historicalPriceData
          : historicalPriceData // ignore: cast_nullable_to_non_nullable
              as List<BitCoinPriceResponse>,
    ));
  }
}

/// @nodoc

class _$CoinViewStateImpl extends _CoinViewState {
  const _$CoinViewStateImpl(
      {final List<BitCoinPriceResponse> bitCoinPriceData = const [],
      final List<BitCoinPriceResponse> historicalPriceData = const []})
      : _bitCoinPriceData = bitCoinPriceData,
        _historicalPriceData = historicalPriceData,
        super._();

  final List<BitCoinPriceResponse> _bitCoinPriceData;
  @override
  @JsonKey()
  List<BitCoinPriceResponse> get bitCoinPriceData {
    if (_bitCoinPriceData is EqualUnmodifiableListView)
      return _bitCoinPriceData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bitCoinPriceData);
  }

  final List<BitCoinPriceResponse> _historicalPriceData;
  @override
  @JsonKey()
  List<BitCoinPriceResponse> get historicalPriceData {
    if (_historicalPriceData is EqualUnmodifiableListView)
      return _historicalPriceData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_historicalPriceData);
  }

  @override
  String toString() {
    return 'CoinViewState(bitCoinPriceData: $bitCoinPriceData, historicalPriceData: $historicalPriceData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CoinViewStateImpl &&
            const DeepCollectionEquality()
                .equals(other._bitCoinPriceData, _bitCoinPriceData) &&
            const DeepCollectionEquality()
                .equals(other._historicalPriceData, _historicalPriceData));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_bitCoinPriceData),
      const DeepCollectionEquality().hash(_historicalPriceData));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CoinViewStateImplCopyWith<_$CoinViewStateImpl> get copyWith =>
      __$$CoinViewStateImplCopyWithImpl<_$CoinViewStateImpl>(this, _$identity);
}

abstract class _CoinViewState extends CoinViewState {
  const factory _CoinViewState(
          {final List<BitCoinPriceResponse> bitCoinPriceData,
          final List<BitCoinPriceResponse> historicalPriceData}) =
      _$CoinViewStateImpl;
  const _CoinViewState._() : super._();

  @override
  List<BitCoinPriceResponse> get bitCoinPriceData;
  @override
  List<BitCoinPriceResponse> get historicalPriceData;
  @override
  @JsonKey(ignore: true)
  _$$CoinViewStateImplCopyWith<_$CoinViewStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
