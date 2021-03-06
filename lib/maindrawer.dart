import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_attendance/pages/jadwal/jadwal.dart';
import 'package:flutter_attendance/pages/presensi/presensi.dart';
import 'package:flutter_attendance/pages/profile/bloc/profile_bloc.dart';
import 'package:flutter_attendance/pages/riwayat/riwayat.dart';
import 'package:flutter_attendance/pages/profile/profile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_attendance/pages/login/blocs/Auth_bloc.dart';
import 'package:flutter_attendance/pages/login/blocs/auth_event.dart';
import 'package:flutter_attendance/pages/login/blocs/auth_repository.dart';
import '/login and home/HomePage.dart';

class MainDrawer extends StatefulWidget {
  final AuthBloc authBloc;
  final ProfileBloc profileBloc;
  const MainDrawer(
      {Key? key, required this.authBloc, required this.profileBloc})
      : super(key: key);
  @override
  _MaindrawState createState() => _MaindrawState();
}

class _MaindrawState extends State<MainDrawer> {
  @override
  void initState() {
    super.initState();
  }

  final AuthRepository authRepository = AuthRepository();
  AuthBloc get _authBloc => widget.authBloc;
  ProfileBloc get _profileBloc => widget.profileBloc;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                " Main Menu ",
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(
                height: 5.0,
              ),
            ],
          ),
        ),
      ),
      const SizedBox(
        height: 20.0,
      ),
      ListTile(
        onTap: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => HomePage(
                  authBloc: _authBloc,
                  profileBloc: _profileBloc,
                ))),
        leading: Icon(
          Icons.home,
          color: Colors.indigo[400],
        ),
        title: const Text("Home"),
      ),
      ListTile(
        onTap: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ProfilePage(
                  profileBloc: _profileBloc,
                  authBloc: _authBloc,
                ))),
        leading: Icon(
          Icons.person,
          color: Colors.indigo[400],
        ),
        title: Text("Profile Account"),
      ),
      ListTile(
        onTap: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                Presensi(authBloc: _authBloc, profileBloc: _profileBloc))),
        leading: Icon(
          Icons.camera_enhance_rounded,
          color: Colors.indigo[400],
        ),
        title: Text("Presensi"),
      ),
      ListTile(
        onTap: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                JadwalPages(authBloc: _authBloc, profileBloc: _profileBloc))),
        leading: Icon(
          Icons.access_time_filled_outlined,
          color: Colors.indigo[400],
        ),
        title: Text("Jadwal Presensi"),
      ),
      ListTile(
        onTap: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => RiwayatWidget(
                  authBloc: _authBloc,
                  profileBloc: _profileBloc,
                ))),
        leading: Icon(
          Icons.history,
          color: Colors.indigo[400],
        ),
        title: Text("Riwayat Presensi"),
      ),
      ListTile(
        onTap: () {
          _authBloc.add(LoggedOut());
        },
        leading: Icon(
          Icons.logout,
          color: Colors.indigo[400],
        ),
        title: Text("Sign Out"),
      ),
    ]);
  }
}
