import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

List<String> _dropdownItems = ['Option 1', 'Option 2', 'Option 3'];
String? _selectedValue; // To hold the currently selected value

class _DashboardState extends State<Dashboard> {
  @override
  void initState() {
    super.initState();
    _selectedValue = _dropdownItems.first; // Set initial value
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        drawer: Drawer(
          child: DrawerHeader(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(child: Text('Administrator')),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Settings'),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 0, 140, 255),
          title: Text(
            'SHAMSI MERCANTILE CO-OPERATIVE HOUSING SOCIETY LTD',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: DropdownButton<String>(
                value: _selectedValue,
                items: _dropdownItems.map<DropdownMenuItem<String>>((
                  String value,
                ) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedValue = newValue;
                  });
                },
                icon: Icon(Icons.arrow_drop_down, color: Colors.white),
                underline: Container(),
                dropdownColor: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
