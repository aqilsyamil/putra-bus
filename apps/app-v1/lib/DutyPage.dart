import 'package:flutter/material.dart';
import 'SidebarPageDriver.dart';
import 'DutyPageRoute1.dart';
import 'DutyPageRoute2.dart';
import 'DutyPageRoute3.dart';
import 'DutyPageRoute4.dart';
import 'DutyPageRoute5.dart';

class DutyPage extends StatefulWidget {
  final String mainStatus;
  final String? fullName;

  DutyPage({required this.mainStatus, this.fullName});

  @override
  _DutyPageState createState() => _DutyPageState();
}

class _DutyPageState extends State<DutyPage> {
  final List<String> busRoutes = ['Route 1', 'Route 2', 'Route 3', 'Route 4', 'Route 5'];
  final List<String> busPlateNumbers = ['BPR 6030', 'BPR 6021', 'BPR 6025', 'BPR 6027', 'BPG 7474'];
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final TextEditingController dutyFieldOneController = TextEditingController();
  String? selectedRoute;
  String? selectedPlateNo;

  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    dutyFieldOneController.text = widget.fullName ?? '';
    dutyFieldOneController.addListener(checkIfAllFieldsFilled);
    checkIfAllFieldsFilled();
  }

  void checkIfAllFieldsFilled() {
    setState(() {
      isButtonEnabled = dutyFieldOneController.text.isNotEmpty &&
          selectedRoute != null &&
          selectedPlateNo != null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          icon: Image.asset('assets/images/p_logo.png'),
          iconSize: 40,
          onPressed: () {},
        ),
        titleSpacing: 0.0,
        centerTitle: false,
        title: Text(
          'Duty',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.left,
        ),
        backgroundColor: Color(0xFF00D161),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.menu, color: Colors.white),
            onPressed: () => _scaffoldKey.currentState?.openDrawer(),
          ),
        ],
      ),
      drawer: SidebarPageDriver(mainStatus: widget.mainStatus),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 50.0),
              Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Details",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 0),
                    Text(
                      "Fill up your duty details",
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
              SizedBox(height: 50.0),
              _buildCustomTextField(dutyFieldOneController, 'Full Name'),
              SizedBox(height: 10.0),
              _buildCustomDropdownField('Bus Route', busRoutes, selectedRoute),
              SizedBox(height: 10.0),
              _buildCustomDropdownField('Bus Plate No.', busPlateNumbers, selectedPlateNo),
              SizedBox(height: 30),
              _buildContinueButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCustomTextField(TextEditingController controller, String hintText) {
    bool isEditable = hintText != 'Full Name';

    return Container(
      width: 334,
      height: 52,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
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
          enabled: isEditable,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 17,
              color: Color.fromRGBO(165, 165, 165, 1),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCustomDropdownField(String label, List<String> items, String? selectedValue) {
    return Container(
      width: 334,
      height: 52,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        border: Border.all(
          color: Color.fromRGBO(165, 165, 165, 1),
          width: 1,
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: DropdownButtonHideUnderline(
        child: DropdownButtonFormField<String>(
          value: selectedValue,
          onChanged: (newValue) {
            setState(() {
              if (label == 'Bus Route') {
                selectedRoute = newValue;
              } else {
                selectedPlateNo = newValue;
              }
              checkIfAllFieldsFilled();
            });
          },
          items: items.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: label,
            hintStyle: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 17,
              color: Color.fromRGBO(165, 165, 165, 1),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContinueButton() {
    return Container(
      width: 334,
      height: 65,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: isButtonEnabled ? Color(0xFF00D161) : Colors.grey.withOpacity(0.3),
      ),
      child: TextButton(
        onPressed: isButtonEnabled ? () {
          switch (selectedRoute) {
            case 'Route 1':
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => DutyPageRoute1(
                  driverFullName: widget.fullName,
                  busPlateNumber: selectedPlateNo, // Pass the selected plate number
                ),
              ));
              break;
            case 'Route 2':
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => DutyPageRoute2(
                  driverFullName: widget.fullName,
                  busPlateNumber: selectedPlateNo, // Pass the selected plate number
                ),
              ));
              break;
            case 'Route 3':
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => DutyPageRoute3(
                  driverFullName: widget.fullName,
                  busPlateNumber: selectedPlateNo, // Pass the selected plate number
                ),
              ));
              break;
            case 'Route 4':
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => DutyPageRoute4(
                  driverFullName: widget.fullName,
                  busPlateNumber: selectedPlateNo, // Pass the selected plate number
                ),
              ));
              break;
            case 'Route 5':
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => DutyPageRoute5(
                  driverFullName: widget.fullName,
                  busPlateNumber: selectedPlateNo, // Pass the selected plate number
                ),
              ));
          }
        } : null,
        child: Text(
          'Start',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    dutyFieldOneController.dispose();
    super.dispose();
  }
}
