import 'package:flutter/material.dart';
import 'package:preferences_app/Provider/preferences_provider.dart';
import 'package:preferences_app/screens/screens.dart';
import 'package:preferences_app/shared_preferences/preferences.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) =>
              PreferencesProvider(isDarkMode: Preferences.isDarkMode),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final preferencesProvider = Provider.of<PreferencesProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: HomeScreen.routerName,
      routes: {
        HomeScreen.routerName: (context) => const HomeScreen(),
        SettingsScreen.routerName: (context) => const SettingsScreen(),
      },
      theme: preferencesProvider.currentTheme,
    );
  }
}
