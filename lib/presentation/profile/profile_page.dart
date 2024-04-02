
import 'package:clean_arc/presentation/profile/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends GetResponsiveView<ProfileController> {
  ProfilePage({super.key, super.alwaysUseBuilder = true});

  @override
  Widget? desktop() {
    // TODO: implement desktop
    return super.desktop();
  }

  @override
  Widget? tablet() {
    // TODO: implement tablet
    return super.tablet();
  }

  @override
  Widget? phone() {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: SingleChildScrollView(
        child: Container(),
      ),
    );
  }

  @override
  Widget? watch() {
    // TODO: implement watch
    return super.watch();
  }
}
