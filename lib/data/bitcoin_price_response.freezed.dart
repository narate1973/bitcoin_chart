// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bitcoin_price_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BitCoinPriceResponse _$BitCoinPriceResponseFromJson(Map<String, dynamic> json) {
  return _BitCoinPriceResponse.fromJson(json);
}

/// @nodoc
mixin _$BitCoinPriceResponse {
  Time get time => throw _privateConstructorUsedError;
  String get disclaimer => throw _privateConstructorUsedError;
  String get chartName => throw _privateConstructorUsedError;
  Map<String, BitCoinPriceIndexDetail> get bpi =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BitCoinPriceResponseCopyWith<BitCoinPriceResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BitCoinPriceResponseCopyWith<$Res> {
  factory $BitCoinPriceResponseCopyWith(BitCoinPriceResponse value,
          $Res Function(BitCoinPriceResponse) then) =
      _$BitCoinPriceResponseCopyWithImpl<$Res, BitCoinPriceResponse>;
  @useResult
  $Res call(
      {Time time,
      String disclaimer,
      String chartName,
      Map<String, BitCoinPriceIndexDetail> bpi});

  $TimeCopyWith<$Res> get time;
}

/// @nodoc
class _$BitCoinPriceResponseCopyWithImpl<$Res,
        $Val extends BitCoinPriceResponse>
    implements $BitCoinPriceResponseCopyWith<$Res> {
  _$BitCoinPriceResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
    Object? disclaimer = null,
    Object? chartName = null,
    Object? bpi = null,
  }) {
    return _then(_value.copyWith(
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as Time,
      disclaimer: null == disclaimer
          ? _value.disclaimer
          : disclaimer // ignore: cast_nullable_to_non_nullable
              as String,
      chartName: null == chartName
          ? _value.chartName
          : chartName // ignore: cast_nullable_to_non_nullable
              as String,
      bpi: null == bpi
          ? _value.bpi
          : bpi // ignore: cast_nullable_to_non_nullable
              as Map<String, BitCoinPriceIndexDetail>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TimeCopyWith<$Res> get time {
    return $TimeCopyWith<$Res>(_value.time, (value) {
      return _then(_value.copyWith(time: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BitCoinPriceResponseImplCopyWith<$Res>
    implements $BitCoinPriceResponseCopyWith<$Res> {
  factory _$$BitCoinPriceResponseImplCopyWith(_$BitCoinPriceResponseImpl value,
          $Res Function(_$BitCoinPriceResponseImpl) then) =
      __$$BitCoinPriceResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Time time,
      String disclaimer,
      String chartName,
      Map<String, BitCoinPriceIndexDetail> bpi});

  @override
  $TimeCopyWith<$Res> get time;
}

/// @nodoc
class __$$BitCoinPriceResponseImplCopyWithImpl<$Res>
    extends _$BitCoinPriceResponseCopyWithImpl<$Res, _$BitCoinPriceResponseImpl>
    implements _$$BitCoinPriceResponseImplCopyWith<$Res> {
  __$$BitCoinPriceResponseImplCopyWithImpl(_$BitCoinPriceResponseImpl _value,
      $Res Function(_$BitCoinPriceResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
    Object? disclaimer = null,
    Object? chartName = null,
    Object? bpi = null,
  }) {
    return _then(_$BitCoinPriceResponseImpl(
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as Time,
      disclaimer: null == disclaimer
          ? _value.disclaimer
          : disclaimer // ignore: cast_nullable_to_non_nullable
              as String,
      chartName: null == chartName
          ? _value.chartName
          : chartName // ignore: cast_nullable_to_non_nullable
              as String,
      bpi: null == bpi
          ? _value._bpi
          : bpi // ignore: cast_nullable_to_non_nullable
              as Map<String, BitCoinPriceIndexDetail>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BitCoinPriceResponseImpl implements _BitCoinPriceResponse {
  const _$BitCoinPriceResponseImpl(
      {required this.time,
      required this.disclaimer,
      required this.chartName,
      required final Map<String, BitCoinPriceIndexDetail> bpi})
      : _bpi = bpi;

  factory _$BitCoinPriceResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$BitCoinPriceResponseImplFromJson(json);

  @override
  final Time time;
  @override
  final String disclaimer;
  @override
  final String chartName;
  final Map<String, BitCoinPriceIndexDetail> _bpi;
  @override
  Map<String, BitCoinPriceIndexDetail> get bpi {
    if (_bpi is EqualUnmodifiableMapView) return _bpi;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_bpi);
  }

  @override
  String toString() {
    return 'BitCoinPriceResponse(time: $time, disclaimer: $disclaimer, chartName: $chartName, bpi: $bpi)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BitCoinPriceResponseImpl &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.disclaimer, disclaimer) ||
                other.disclaimer == disclaimer) &&
            (identical(other.chartName, chartName) ||
                other.chartName == chartName) &&
            const DeepCollectionEquality().equals(other._bpi, _bpi));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, time, disclaimer, chartName,
      const DeepCollectionEquality().hash(_bpi));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BitCoinPriceResponseImplCopyWith<_$BitCoinPriceResponseImpl>
      get copyWith =>
          __$$BitCoinPriceResponseImplCopyWithImpl<_$BitCoinPriceResponseImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BitCoinPriceResponseImplToJson(
      this,
    );
  }
}

abstract class _BitCoinPriceResponse implements BitCoinPriceResponse {
  const factory _BitCoinPriceResponse(
          {required final Time time,
          required final String disclaimer,
          required final String chartName,
          required final Map<String, BitCoinPriceIndexDetail> bpi}) =
      _$BitCoinPriceResponseImpl;

  factory _BitCoinPriceResponse.fromJson(Map<String, dynamic> json) =
      _$BitCoinPriceResponseImpl.fromJson;

  @override
  Time get time;
  @override
  String get disclaimer;
  @override
  String get chartName;
  @override
  Map<String, BitCoinPriceIndexDetail> get bpi;
  @override
  @JsonKey(ignore: true)
  _$$BitCoinPriceResponseImplCopyWith<_$BitCoinPriceResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

BitCoinPriceIndexDetail _$BitCoinPriceIndexDetailFromJson(
    Map<String, dynamic> json) {
  return _BitCoinPriceIndexDetail.fromJson(json);
}

/// @nodoc
mixin _$BitCoinPriceIndexDetail {
  String get code => throw _privateConstructorUsedError;
  String get symbol => throw _privateConstructorUsedError;
  String get rate => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  double get rateFloat => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BitCoinPriceIndexDetailCopyWith<BitCoinPriceIndexDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BitCoinPriceIndexDetailCopyWith<$Res> {
  factory $BitCoinPriceIndexDetailCopyWith(BitCoinPriceIndexDetail value,
          $Res Function(BitCoinPriceIndexDetail) then) =
      _$BitCoinPriceIndexDetailCopyWithImpl<$Res, BitCoinPriceIndexDetail>;
  @useResult
  $Res call(
      {String code,
      String symbol,
      String rate,
      String description,
      double rateFloat});
}

/// @nodoc
class _$BitCoinPriceIndexDetailCopyWithImpl<$Res,
        $Val extends BitCoinPriceIndexDetail>
    implements $BitCoinPriceIndexDetailCopyWith<$Res> {
  _$BitCoinPriceIndexDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? symbol = null,
    Object? rate = null,
    Object? description = null,
    Object? rateFloat = null,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      rateFloat: null == rateFloat
          ? _value.rateFloat
          : rateFloat // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BitCoinPriceIndexDetailImplCopyWith<$Res>
    implements $BitCoinPriceIndexDetailCopyWith<$Res> {
  factory _$$BitCoinPriceIndexDetailImplCopyWith(
          _$BitCoinPriceIndexDetailImpl value,
          $Res Function(_$BitCoinPriceIndexDetailImpl) then) =
      __$$BitCoinPriceIndexDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String code,
      String symbol,
      String rate,
      String description,
      double rateFloat});
}

/// @nodoc
class __$$BitCoinPriceIndexDetailImplCopyWithImpl<$Res>
    extends _$BitCoinPriceIndexDetailCopyWithImpl<$Res,
        _$BitCoinPriceIndexDetailImpl>
    implements _$$BitCoinPriceIndexDetailImplCopyWith<$Res> {
  __$$BitCoinPriceIndexDetailImplCopyWithImpl(
      _$BitCoinPriceIndexDetailImpl _value,
      $Res Function(_$BitCoinPriceIndexDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? symbol = null,
    Object? rate = null,
    Object? description = null,
    Object? rateFloat = null,
  }) {
    return _then(_$BitCoinPriceIndexDetailImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      rateFloat: null == rateFloat
          ? _value.rateFloat
          : rateFloat // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$BitCoinPriceIndexDetailImpl implements _BitCoinPriceIndexDetail {
  const _$BitCoinPriceIndexDetailImpl(
      {required this.code,
      required this.symbol,
      required this.rate,
      required this.description,
      required this.rateFloat});

  factory _$BitCoinPriceIndexDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$BitCoinPriceIndexDetailImplFromJson(json);

  @override
  final String code;
  @override
  final String symbol;
  @override
  final String rate;
  @override
  final String description;
  @override
  final double rateFloat;

  @override
  String toString() {
    return 'BitCoinPriceIndexDetail(code: $code, symbol: $symbol, rate: $rate, description: $description, rateFloat: $rateFloat)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BitCoinPriceIndexDetailImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.symbol, symbol) || other.symbol == symbol) &&
            (identical(other.rate, rate) || other.rate == rate) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.rateFloat, rateFloat) ||
                other.rateFloat == rateFloat));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, code, symbol, rate, description, rateFloat);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BitCoinPriceIndexDetailImplCopyWith<_$BitCoinPriceIndexDetailImpl>
      get copyWith => __$$BitCoinPriceIndexDetailImplCopyWithImpl<
          _$BitCoinPriceIndexDetailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BitCoinPriceIndexDetailImplToJson(
      this,
    );
  }
}

abstract class _BitCoinPriceIndexDetail implements BitCoinPriceIndexDetail {
  const factory _BitCoinPriceIndexDetail(
      {required final String code,
      required final String symbol,
      required final String rate,
      required final String description,
      required final double rateFloat}) = _$BitCoinPriceIndexDetailImpl;

  factory _BitCoinPriceIndexDetail.fromJson(Map<String, dynamic> json) =
      _$BitCoinPriceIndexDetailImpl.fromJson;

  @override
  String get code;
  @override
  String get symbol;
  @override
  String get rate;
  @override
  String get description;
  @override
  double get rateFloat;
  @override
  @JsonKey(ignore: true)
  _$$BitCoinPriceIndexDetailImplCopyWith<_$BitCoinPriceIndexDetailImpl>
      get copyWith => throw _privateConstructorUsedError;
}

Time _$TimeFromJson(Map<String, dynamic> json) {
  return _Time.fromJson(json);
}

/// @nodoc
mixin _$Time {
  String get updated => throw _privateConstructorUsedError;
  DateTime get updatedISO => throw _privateConstructorUsedError;
  String get updateduk => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TimeCopyWith<Time> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimeCopyWith<$Res> {
  factory $TimeCopyWith(Time value, $Res Function(Time) then) =
      _$TimeCopyWithImpl<$Res, Time>;
  @useResult
  $Res call({String updated, DateTime updatedISO, String updateduk});
}

/// @nodoc
class _$TimeCopyWithImpl<$Res, $Val extends Time>
    implements $TimeCopyWith<$Res> {
  _$TimeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? updated = null,
    Object? updatedISO = null,
    Object? updateduk = null,
  }) {
    return _then(_value.copyWith(
      updated: null == updated
          ? _value.updated
          : updated // ignore: cast_nullable_to_non_nullable
              as String,
      updatedISO: null == updatedISO
          ? _value.updatedISO
          : updatedISO // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updateduk: null == updateduk
          ? _value.updateduk
          : updateduk // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TimeImplCopyWith<$Res> implements $TimeCopyWith<$Res> {
  factory _$$TimeImplCopyWith(
          _$TimeImpl value, $Res Function(_$TimeImpl) then) =
      __$$TimeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String updated, DateTime updatedISO, String updateduk});
}

/// @nodoc
class __$$TimeImplCopyWithImpl<$Res>
    extends _$TimeCopyWithImpl<$Res, _$TimeImpl>
    implements _$$TimeImplCopyWith<$Res> {
  __$$TimeImplCopyWithImpl(_$TimeImpl _value, $Res Function(_$TimeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? updated = null,
    Object? updatedISO = null,
    Object? updateduk = null,
  }) {
    return _then(_$TimeImpl(
      updated: null == updated
          ? _value.updated
          : updated // ignore: cast_nullable_to_non_nullable
              as String,
      updatedISO: null == updatedISO
          ? _value.updatedISO
          : updatedISO // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updateduk: null == updateduk
          ? _value.updateduk
          : updateduk // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TimeImpl implements _Time {
  const _$TimeImpl(
      {required this.updated,
      required this.updatedISO,
      required this.updateduk});

  factory _$TimeImpl.fromJson(Map<String, dynamic> json) =>
      _$$TimeImplFromJson(json);

  @override
  final String updated;
  @override
  final DateTime updatedISO;
  @override
  final String updateduk;

  @override
  String toString() {
    return 'Time(updated: $updated, updatedISO: $updatedISO, updateduk: $updateduk)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimeImpl &&
            (identical(other.updated, updated) || other.updated == updated) &&
            (identical(other.updatedISO, updatedISO) ||
                other.updatedISO == updatedISO) &&
            (identical(other.updateduk, updateduk) ||
                other.updateduk == updateduk));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, updated, updatedISO, updateduk);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TimeImplCopyWith<_$TimeImpl> get copyWith =>
      __$$TimeImplCopyWithImpl<_$TimeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TimeImplToJson(
      this,
    );
  }
}

abstract class _Time implements Time {
  const factory _Time(
      {required final String updated,
      required final DateTime updatedISO,
      required final String updateduk}) = _$TimeImpl;

  factory _Time.fromJson(Map<String, dynamic> json) = _$TimeImpl.fromJson;

  @override
  String get updated;
  @override
  DateTime get updatedISO;
  @override
  String get updateduk;
  @override
  @JsonKey(ignore: true)
  _$$TimeImplCopyWith<_$TimeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
