import 'package:flutter/material.dart';
import 'package:preferences_app/Provider/preferences_provider.dart';
import 'package:preferences_app/shared_preferences/preferences.dart';
import 'package:provider/provider.dart';

import '../widgets/widgets.dart';

class SettingsScreen extends StatefulWidget {
  static String routerName = "Settings";

  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  // bool isDarkMode = false;
  // int gender = 1;
  // String name = 'Pablo';

  @override
  Widget build(BuildContext context) {
    final preferencesProvider = Provider.of<PreferencesProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
        ),
        drawer: const DrawerCustom(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Ajustes',
                  style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const Divider(),
                SwitchListTile(
                  value: Preferences.isDarkMode,
                  title: const Text('isDarkMode'),
                  onChanged: (value) {
                    Preferences.isDarkMode = value;

                    // if (value == true) {
                    //   preferencesProvider.setDarkMode();
                    //   print("dark");
                    // } else {
                    //   preferencesProvider.setLightMode();
                    //   print("light");
                    // }

                    value == true
                        ? preferencesProvider.setDarkMode()
                        : preferencesProvider.setLightMode();
                    setState(() {});
                  },
                ),
                const Divider(),
                RadioListTile<int>(
                  title: const Text('Masculino'),
                  value: 1,
                  groupValue: Preferences.gender,
                  onChanged: (value) {
                    Preferences.gender = value ?? 1;
                    setState(() {});
                  },
                ),
                RadioListTile<int>(
                  title: const Text('Femenino'),
                  value: 2,
                  groupValue: Preferences.gender,
                  onChanged: (value) {
                    Preferences.gender = value ?? 2;
                    setState(() {});
                  },
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    initialValue: Preferences.name,
                    decoration: const InputDecoration(
                      labelText: 'Nombre',
                      helperText: 'Nombre de usuario',
                    ),
                    onChanged: (value) {
                      Preferences.name = value;
                      setState(() {});
                    },
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
