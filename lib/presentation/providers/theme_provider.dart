import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

// Listado de colores inmutable
final colorListProvider = Provider((ref) => colorList);
// Dark mode
final isDarkModeProvider = StateProvider<bool>((ref) => false);
// Theme provider int
final selectedColorProvider = StateProvider<int>((ref) => 0);
// Object ot Theme provider
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>((ref) => ThemeNotifier());

// Controller or Notifier
class ThemeNotifier extends StateNotifier<AppTheme> {
  // State = new Apptheme()
  ThemeNotifier() : super(AppTheme());

  // void changeTheme({required int selectedColor, required bool isDarkMode}) {
  //   state = AppTheme(selectedColor: selectedColor, isDarkMode: isDarkMode);
  // }

  void toggleDarkMode(){
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  void changeColor(int selectedColor){
    state = state.copyWith(selectedColor: selectedColor);
  }
}