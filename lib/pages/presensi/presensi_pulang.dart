import 'package:flutter/material.dart';
import 'package:flutter_attendance/constants.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_attendance/maindrawer.dart';

class PresensiPulang extends StatefulWidget {
  @override
  State<PresensiPulang> createState() => _PresensiPulangState();
}

class _PresensiPulangState extends State<PresensiPulang> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Presensi Hadir"),
        backgroundColor: kPrimaryColor,
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.all(20),
            child: Row(
              children: [
                Column(
                  children: const <Widget>[
                    Image(
                      image: AssetImage("assets/images/doc.png"),
                      height: 60,
                    )
                  ],
                ),
                Column(
                  children: const <Widget>[
                    Text(
                      "Presensi Pulang",
                      style: TextStyle(fontSize: 18),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      "18.10 PM",
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 470),
          FlatButton(
            onPressed: () async {
              PermissionStatus cameraStatus =
                  await Permission.camera.request();
                  PermissionStatus locationStatus =
                  await Permission.location.request();

              if (cameraStatus == PermissionStatus.granted) {
                if (locationStatus == PermissionStatus.granted) {
                  //open camera, ambil latitude longtitude

                }
                if (locationStatus == PermissionStatus.denied) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("You need to provide location permission")));
                }
                
              }

              if (cameraStatus == PermissionStatus.denied) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("You need to provide camera permission")));
              }
            },
            child: const Text(
              "Presensi",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            color: kPrimaryColor,
            minWidth: 200,
            height: 50,
          ),
        ],
      ),
    );
  }
}
