import 'package:shared_preferences/shared_preferences.dart';

Future<void> complateOnboarding() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool("hasCompleteOnboard", true);
}
