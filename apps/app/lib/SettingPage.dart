import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool _notificationsEnabled = true;
  String _selectedLanguage = 'English'; // Default language selection

  void _changeLanguage(String language) {
    Navigator.pop(context); // Close the dialog
    setState(() {
      _selectedLanguage = language;
    });
  }

  void _showLanguageDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Padding(
            padding: EdgeInsets.all(8.0),
            child: const Text(
              'Language',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          children: <Widget>[
            SimpleDialogOption(
              onPressed: () => _changeLanguage('English'),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  'English',
                  style: TextStyle(
                    fontWeight: _selectedLanguage == 'English' ? FontWeight.bold : FontWeight.normal,
                    fontSize: 18.0,
                    color: _selectedLanguage == 'English' ? Color(0xFF00D161) : Colors.black,
                  ),
                ),
              ),
            ),
            SimpleDialogOption(
              onPressed: () => _changeLanguage('Bahasa Melayu'),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  'Bahasa Melayu',
                  style: TextStyle(
                    fontWeight: _selectedLanguage == 'Bahasa Melayu' ? FontWeight.bold : FontWeight.normal,
                    fontSize: 18.0,
                    color: _selectedLanguage == 'Bahasa Melayu' ? Color(0xFF00D161) : Colors.black,
                  ),
                ),
              ),
            ),
            SimpleDialogOption(
              onPressed: () => _changeLanguage('한국어'),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  '한국어',
                  style: TextStyle(
                    fontWeight: _selectedLanguage == '한국어' ? FontWeight.bold : FontWeight.normal,
                    fontSize: 18.0,
                    color: _selectedLanguage == '한국어' ? Color(0xFF00D161) : Colors.black,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                  },
                  child: Text(
                    'Cancel',
                    style: TextStyle(color: Colors.grey[850], fontSize: 18.0, fontWeight: FontWeight.normal), // Thinner font for the cancel button
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0.0,
        centerTitle: false,
        title: Text(
          'Settings',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.left,
        ),
        backgroundColor: Color(0xFF00D161),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: ListView(
        children: <Widget>[
          SwitchListTile(
            title: Text('Push Notifications'),
            value: _notificationsEnabled,
            onChanged: (bool value) {
              setState(() {
                _notificationsEnabled = value;
              });
            },
            activeColor: Color(0xFF00D161),
          ),
          Divider(color: Color(0xFFF0F0F0), thickness: 6.0),
          ListTile(
            title: Text('Language'),
            subtitle: Text(_selectedLanguage),
            trailing: Icon(Icons.arrow_forward_ios, size: 16.0),
            onTap: _showLanguageDialog,
          ),
          Divider(color: Color(0xFFF0F0F0), thickness: 6.0),
          ListTile(
            title: Text('Terms of Use & Policies'),
            trailing: Icon(Icons.arrow_forward_ios, size: 16.0),
            onTap: () {
              // Implement navigation to Terms of Use & Policies
            },
          ),
          Divider(color: Color(0xFFF0F0F0), thickness: 6.0),
          ListTile(
            title: Text('Version'),
            subtitle: Text('1.0.0'),
            trailing: Icon(Icons.arrow_forward_ios, size: 16.0),
          ),
        ],
      ),
    );
  }
}
