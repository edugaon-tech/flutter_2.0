import 'package:flutter/material.dart';
import 'package:flutter_learn_bipul/models/profile/profile_view_model.dart';
import 'package:flutter_learn_bipul/views/screens/profile/profile_widgets.dart';
import 'package:flutter_learn_bipul/views/utils/colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var personalDetails = ProfileViewModel.personalDetailsItems();
    var generalDetails = ProfileViewModel.generalDetailsItems();
    var view = ProfileWidgets(context: context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryColor,
        body: ListView(
          shrinkWrap: true,
          children: [
            view.aboutView(),
            view.personalDetailView(personalDetails),
            SizedBox(height: 10,),
            view.personalDetailView(generalDetails),
            SizedBox(height: 10,),
            view.personalDetailView(generalDetails),
            SizedBox(height: 10,),
            // view.personalDetailView(items),
            // SizedBox(height: 10,),
            // view.personalDetailView(items),
            // SizedBox(height: 10,),
            // view.personalDetailView(items),
            // Expanded(child: view.personalDetailView(items)),
            // Expanded(child: view.personalDetailView(items)),
          ],
        ),
      ),
    );
  }
}
