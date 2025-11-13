import 'package:shared_preferences/shared_preferences.dart';

class PassportService {
  static const _stampedKey = 'passport_stamped_ids';
  static const _stampedDatePrefix = 'passport_date_'; // key per id

  Future<Set<String>> getStampedIds() async {
    final prefs = await SharedPreferences.getInstance();
    final list = prefs.getStringList(_stampedKey) ?? [];
    return list.toSet();
  }

  Future<bool> isStamped(String placeId) async {
    final stamped = await getStampedIds();
    return stamped.contains(placeId);
  }

  Future<void> stamp(String placeId) async {
    final prefs = await SharedPreferences.getInstance();
    final stamped = await getStampedIds();
    stamped.add(placeId);
    await prefs.setStringList(_stampedKey, stamped.toList());

    // simpan tanggal stamp (optional)
    final now = DateTime.now().toIso8601String();
    await prefs.setString('$_stampedDatePrefix$placeId', now);
  }

  Future<void> unstamp(String placeId) async {
    final prefs = await SharedPreferences.getInstance();
    final stamped = await getStampedIds();
    stamped.remove(placeId);
    await prefs.setStringList(_stampedKey, stamped.toList());
    await prefs.remove('$_stampedDatePrefix$placeId');
  }

  Future<DateTime?> getStampDate(String placeId) async {
    final prefs = await SharedPreferences.getInstance();
    final s = prefs.getString('$_stampedDatePrefix$placeId');
    if (s == null) return null;
    return DateTime.tryParse(s);
  }
}
