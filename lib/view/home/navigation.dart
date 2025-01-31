import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});
  @override
  State<NavigationPage> createState() => _NavigationPage();
}

class _NavigationPage extends State<NavigationPage> {
  String _selectedLocation = "Home";
  Future<void> _logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('rememberMe');
    
    Navigator.pushReplacementNamed(context, '/');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Navigation"),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Navigation Page",
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            SizedBox(height: 10),
            Text("Current Location: $_selectedLocation",
                style: TextStyle(fontSize: 18)),
            DropdownButton<String>(
              value: _selectedLocation,
              items: ["Home", "Gym", "Park"].map((location) {
                return DropdownMenuItem<String>(
                  value: location,
                  child: Text(location),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedLocation = value!; // Update selected location
                });
              },
            ),
            SizedBox(height: 30), // Spacing for logout button
            ElevatedButton(
              onPressed: _logout, // Call the logout function
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // Red for logout button
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                "Logout",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
