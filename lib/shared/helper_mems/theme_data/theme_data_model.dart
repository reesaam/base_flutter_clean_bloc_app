class AppThemeData<T> {
  AppThemeData({required this.lightThemeData, required this.darkThemeData});

  final T lightThemeData;
  final T darkThemeData;
}

extension ThemeModeDetection on AppThemeData {
  T getMode<T>(bool isDark) => isDark ? darkThemeData : lightThemeData;
}
