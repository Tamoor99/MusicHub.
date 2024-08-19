import 'package:flutter/material.dart';
import 'package:musichub/screens/login.dart';
import 'package:musichub/screens/changepassword.dart';

class SettingsScreen extends StatefulWidget {
  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notificationsEnabled = true;
  bool _isDarkTheme = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: Colors.black,
      ),
      body: Stack(
        children: [
          // Amber background
          Container(
            color: Colors.amber,
          ),
          Opacity(
            opacity: 0.2,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('resources/images/appbg2.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 20),
                  _buildProfileInfo(),
                  _buildNotificationToggle(),
                  _buildThemeToggle(),
                  _buildChangePasswordButton(context),
                  _buildLogoutButton(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileInfo() {
    return ListTile(
      leading: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.black,
        ),
        child: Icon(Icons.person, color: Colors.white, size: 30),
      ),
      title: Text('Profile', style: TextStyle(color: Colors.black, fontSize: 20)),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Username: user123', style: TextStyle(color: Colors.black,fontSize:18)),
          Text('Email: user@example.com', style: TextStyle(color: Colors.black,fontSize:18)),
        ],
      ),
    );
  }

  Widget _buildNotificationToggle() {
    return SwitchListTile(
      activeColor: Colors.black,
      title: Text('Enable Notifications', style: TextStyle(color: Colors.black,fontSize: 18,)),
      value: _notificationsEnabled,
      onChanged: (bool value) {
        setState(() {
          _notificationsEnabled = value;
        });
      },
    );
  }

  
  Widget _buildThemeToggle() {
    return SwitchListTile(
      activeColor: Colors.black,
      title: Text('Dark Theme', style: TextStyle(color: Colors.black,fontSize:18)),
      value: _isDarkTheme,
      onChanged: (bool value) {
        setState(() {
          _isDarkTheme = value;
        });
        // Implement theme change logic here
      },
    );
  }

  Widget _buildChangePasswordButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: ListTile(
          leading: Icon(Icons.lock, color: Colors.white),
          title: Text('Change Password', style: TextStyle(color: Colors.white)),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NewPasswordScreen()),
            );
          },
        ),
      ),
    );
  }

  Widget _buildLogoutButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: ListTile(
          leading: Icon(Icons.exit_to_app, color: Colors.white),
          title: Text('Logout', style: TextStyle(color: Colors.white)),
          onTap: () {
            // Implement logout logic here
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => Login()),
                  (Route<dynamic> route) => false,
            );
          },
        ),
      ),
    );
  }
}
