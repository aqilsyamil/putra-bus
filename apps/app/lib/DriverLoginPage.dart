import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'mainDriver.dart';
import 'main.dart';

// Driver model
class Driver {
  final int id;
  final String fullName;
  final String phoneNo;
  final String password;
  final String photoPath;

  Driver({required this.id, required this.fullName, required this.phoneNo, required this.password, required this.photoPath});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'fullName': fullName,
      'phoneNo': phoneNo,
      'password': password,
      'photoPath': photoPath,
    };
  }

  static Driver fromMap(Map<String, dynamic> map) {
    return Driver(
      id: map['id'],
      fullName: map['fullName'],
      phoneNo: map['phoneNo'],
      password: map['password'],
      photoPath: map['photoPath'],
    );
  }
}

// Database helper
class DatabaseHelper {
  static Future<Database> getDatabase() async {
    final dbPath = await getDatabasesPath();
    return openDatabase(
      join(dbPath, 'driver_database.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE drivers(id INTEGER PRIMARY KEY, fullName TEXT, phoneNo TEXT, password TEXT, photoPath TEXT)',
        );
      },
      version: 1,
    );
  }

  static Future<void> insertDriver(Driver driver) async {
    final db = await getDatabase();
    await db.insert(
      'drivers',
      driver.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<void> initializeDatabaseWithDummyData() async {
    final db = await getDatabase();
    List<Driver> drivers = [
      Driver(id: 1000,
          fullName: 'Mohd Harris bin Mohd Ali',
          phoneNo: '+603-9769 1334',
          password: 'harris1000',
          photoPath: 'driver-1000.png'),
      Driver(id: 1010,
          fullName: 'Ayub bin Somudi',
          phoneNo: '+603-9769 1334',
          password: 'ayub1010',
          photoPath: 'driver-1010.png'),
      Driver(id: 1020,
          fullName: 'Sharifful Azizi bin Musa',
          phoneNo: '+603-9769 1334',
          password: 'azizi1020',
          photoPath: 'driver-1020.png'),
      Driver(id: 1030,
          fullName: 'Jumasnizam bin Jumin',
          phoneNo: '+603-9769 1334',
          password: 'nizam1030',
          photoPath: 'driver-1030.png'),
      Driver(id: 1040,
          fullName: 'Muhd Al-Qawiy bin Tumesi',
          phoneNo: '+603-9769 1334',
          password: 'qawiy1040',
          photoPath: 'driver-1040.png'),
      Driver(id: 1050,
          fullName: 'Ahmad Shafarin bin Abdul Mortalip',
          phoneNo: '+603-9769 1334',
          password: 'ahmad1050',
          photoPath: 'driver-1050.png'),
      Driver(id: 1060,
          fullName: 'Mohd Norafrizan bin Mohd Normazi',
          phoneNo: '+603-9769 1334',
          password: 'afrizan1060',
          photoPath: 'driver-1060.png'),
    ];

    for (var driver in drivers) {
      await insertDriver(driver);
    }
  }

  // Method to validate driver credentials
  static Future<bool> validateDriver(String driverId, String password) async {
    final db = await getDatabase();
    final List<Map<String, dynamic>> maps = await db.query(
      'drivers',
      where: 'id = ? AND password = ?',
      whereArgs: [int.tryParse(driverId) ?? 0, password],
    );
    return maps.isNotEmpty;
  }

  static Future<String> getDriverFullName(String driverId,
      String password) async {
    final db = await getDatabase();
    final List<Map<String, dynamic>> maps = await db.query(
      'drivers',
      columns: ['fullName'],
      where: 'id = ? AND password = ?',
      whereArgs: [int.tryParse(driverId) ?? 0, password],
    );
    if (maps.isNotEmpty) {
      return maps.first['fullName'] as String;
    } else {
      return '';
    }
  }
}


// DriverLoginPage widget
class DriverLoginPage extends StatefulWidget {
  String? mainStatus;

  DriverLoginPage({this.mainStatus});

  @override
  _DriverLoginPageState createState() => _DriverLoginPageState();
}

class _DriverLoginPageState extends State<DriverLoginPage> {
  final TextEditingController driverIdController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isButtonEnabled = false;
  bool isPasswordVisible = false;

  @override
  void initState() {
    super.initState();
    driverIdController.addListener(updateButtonState);
    passwordController.addListener(updateButtonState);
    DatabaseHelper.initializeDatabaseWithDummyData();
  }

  void updateButtonState() {
    setState(() {
      isButtonEnabled = driverIdController.text.isNotEmpty &&
          passwordController.text.length >= 8;
    });
  }

  @override
  void dispose() {
    driverIdController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void login(BuildContext context) async {

    bool loginSuccess = await DatabaseHelper.validateDriver(
        driverIdController.text, passwordController.text);
    if (loginSuccess) {
      String fullName = await DatabaseHelper.getDriverFullName(
          driverIdController.text, passwordController.text);
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => MyHomePageDriver(
            initialIndex: 1, // Navigate to DutyPage on successful login
            mainStatus:  'driver',
            fullName: fullName,
          ),
        ),
            (Route<dynamic> route) => false,
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Login Failed'),
          content: Text('Incorrect Driver ID or Password.'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      );
    }
  }

  void switchToUserMode(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => MyHomePage(
          mainStatus: 'user',
        ),
      ),
          (Route<dynamic> route) => false,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        titleSpacing: 0.0,
        centerTitle: false,
        title: Text(
          'Driver Login',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.left,
        ),
        backgroundColor: Color(0xFF00D161),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 40),
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Driver Login",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Welcome Back Captain!",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF00D161),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
            _buildTextField("Driver ID", controller: driverIdController),
            SizedBox(height: 15),
            _buildTextField(
                "Password", isPassword: true, controller: passwordController),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: isButtonEnabled ? () => login(context) : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: isButtonEnabled ? Color(0xFF00D161) : null,
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                minimumSize: Size(334, 65), // Set the size of the button
              ),
              child: Text(
                'Continue',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildTextField(String label,
      {bool isPassword = false, TextEditingController? controller}) {
    return Container(
      width: 334,
      height: 52, // Adjust height as needed
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        // Adjust border radius as needed
        color: Colors.white,
        border: Border.all(
          color: Color.fromRGBO(165, 165, 165, 1),
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: TextField(
          controller: controller,
          obscureText: isPassword ? !isPasswordVisible : false,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: label,
            hintStyle: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 17,
              color: Color.fromRGBO(165, 165, 165, 1),
            ),
            suffixIcon: isPassword ? IconButton(
              icon: Icon(
                isPasswordVisible ? Icons.visibility : Icons.visibility_off,
              ),
              onPressed: () {
                setState(() {
                  isPasswordVisible = !isPasswordVisible;
                });
              },
            ) : null,
          ),
        ),
      ),
    );
  }
}