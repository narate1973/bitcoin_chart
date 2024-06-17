import 'dart:convert';
import 'dart:io';

import 'package:bitcoin_chart_assignment/data/bitcoin_price_response.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final appSharedPreferenceProvider = Provider<AppSharedPreference>((ref) {
  return AppSharedPreference();
});

class AppSharedPreference extends AppSharedPreferenceBase {
  AppSharedPreference() : super();

  List<BitCoinPriceResponse> getBitCoinPriceData() {
    final String? data = getString('bit_coin_price_data');
    if (data == null) {
      return [];
    }
    final List<dynamic> dataList = jsonDecode(data)['data'];
    return dataList.map((e) => BitCoinPriceResponse.fromJson(e)).toList();
  }

  Future<void> setBitCoinPriceData(List<BitCoinPriceResponse> data) async {
    return await setString('bit_coin_price_data', value: jsonEncode({
      'data': data.map((e) => e.toJson()).toList(),
    }));
  }
}

abstract class AppSharedPreferenceBase {
  static final _storage = Platform.isAndroid
      ? const FlutterSecureStorage(aOptions: AndroidOptions(encryptedSharedPreferences: true))
      : const FlutterSecureStorage();

  Map<String, String> _cachedPreference = {};

  Future<void> reload() async {
    _cachedPreference = await _storage.readAll();
  }

  AppSharedPreferenceBase();

  String? getString(String key, {String? defaultValue}) {
    return _cachedPreference[key] ?? defaultValue;
  }

  bool? getBool(String key, {bool? defaultValue}) {
    final String? value = _cachedPreference[key];
    if (value == null) {
      return defaultValue;
    }
    return value == 'true' ? true : false;
  }

  int? getInt(String key, {int? defaultValue}) {
    final value = _cachedPreference[key];
    return int.tryParse(value ?? '0') ?? defaultValue;
  }

  double? getDouble(String key, {double? defaultValue}) {
    final value = _cachedPreference[key];
    return double.tryParse(value ?? '0.0') ?? defaultValue;
  }

  Future<void> setString(String key, {required String? value}) async {
    if (value == null) {
      _cachedPreference.remove(key);
      return await _storage.delete(key: key);
    }
    _cachedPreference[key] = value;
    return await _storage.write(key: key, value: value);
  }

  Future<void> setInt(String key, {required int? value}) async {
    if (value == null) {
      _cachedPreference.remove(key);
      return await _storage.delete(key: key);
    }
    _cachedPreference[key] = value.toString();
    return await _storage.write(key: key, value: value.toString());
  }

  Future<void> setDouble(String key, {required double? value}) async {
    if (value == null) {
      _cachedPreference.remove(key);
      return await _storage.delete(key: key);
    }
    _cachedPreference[key] = value.toString();
    return await _storage.write(key: key, value: value.toString());
  }

  Future<void> setBool(String key, {required bool? value}) async {
    if (value == null) {
      _cachedPreference.remove(key);
      return await _storage.delete(key: key);
    }
    _cachedPreference[key] = value.toString();
    return await _storage.write(key: key, value: value.toString());
  }
}
