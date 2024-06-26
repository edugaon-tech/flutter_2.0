import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileViewModel {
  IconData leadingIcon;
  String title;
  IconData trillingIcon;

  ProfileViewModel(
      {required this.leadingIcon,
      required this.title,
      required this.trillingIcon});

  static personalDetailsItems() => [
        ProfileViewModel(
            leadingIcon: CupertinoIcons.person,
            title: "Personal Information",
            trillingIcon: Icons.arrow_forward_ios_sharp),ProfileViewModel(
            leadingIcon: CupertinoIcons.doc,
            title: "Passport Details",
            trillingIcon: Icons.arrow_forward_ios_sharp),ProfileViewModel(
            leadingIcon: Icons.payment,
            title: "Payment Methods",
            trillingIcon: Icons.arrow_forward_ios_sharp),ProfileViewModel(
            leadingIcon: Icons.flight_takeoff,
            title: "Personal Information",
            trillingIcon: Icons.arrow_forward_ios_sharp),
      ];
  static generalDetailsItems() => [
    ProfileViewModel(
        leadingIcon: CupertinoIcons.settings,
        title: "Account Settings",
        trillingIcon: Icons.arrow_forward_ios_sharp),ProfileViewModel(
        leadingIcon: CupertinoIcons.doc,
        title: "Passport Details",
        trillingIcon: Icons.arrow_forward_ios_sharp),ProfileViewModel(
        leadingIcon: Icons.payment,
        title: "Payment Methods",
        trillingIcon: Icons.arrow_forward_ios_sharp),ProfileViewModel(
        leadingIcon: Icons.flight_takeoff,
        title: "Personal Information",
        trillingIcon: Icons.arrow_forward_ios_sharp),ProfileViewModel(
        leadingIcon: CupertinoIcons.person,
        title: "Personal Information",
        trillingIcon: Icons.arrow_forward_ios_sharp),ProfileViewModel(
        leadingIcon: CupertinoIcons.person,
        title: "Personal Information",
        trillingIcon: Icons.arrow_forward_ios_sharp),
  ];
}
