import 'package:flutter/material.dart';
import 'package:flutter_learn_bipul/models/profile/profile_view_model.dart';
import 'package:flutter_learn_bipul/views/utils/colors.dart';
import 'package:flutter_learn_bipul/views/utils/constants/images.dart';
import 'package:flutter_learn_bipul/views/utils/shapes/app_shapes.dart';
import 'package:flutter_learn_bipul/views/utils/sizes.dart';
import 'package:flutter_learn_bipul/views/utils/styles/text_styles.dart';

class ProfileWidgets {
  BuildContext context;

  ProfileWidgets({required this.context});

  double _getHeight() => AppSizes(context: context).getHeight;

  double _getWidth() => AppSizes(context: context).getWidth;

  Widget profilePictureView() {
    return SizedBox(
      height: _getHeight() / 5,
      width: _getWidth() / 5,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(_getHeight() / 2.5),
        child: Image.network(
          profilePicUrl,
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget aboutView() {
    return Column(
      children: [
        SizedBox(
          height: 30,
        ),
        Center(child: profilePictureView()),
        SizedBox(
          height: 20,
        ),
        Text(
          "Anais Fourati",
          style: TextStyle(
              fontSize: boldFontSize,
              fontWeight: FontWeight.bold,
              color: boldTextColor),
        ),
        SizedBox(
          height: 2,
        ),
        Text(
          "Gold Member",
          style: TextStyle(
              fontSize: semiBoldFontSize,
              fontWeight: FontWeight.bold,
              color: specialColor),
        ),
        // Text("Name",style: AppTextStyles().normalTextStyle(),),
      ],
    );
  }

  Widget personalDetailView(List<ProfileViewModel> items) {
    return SizedBox(
      // height: 370,
      child: ListView(
        shrinkWrap: true,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Personal Details",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: normalTextColor),
          ),
          SizedBox(height: 10,),
          Container(
            decoration: AppShapes().rectangularShape(bgColor: secondaryColor,radius: 12.0),
            child: ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
                      itemCount: items.length,
                      itemBuilder: (_, index) {
            return tileItemView(items[index]);
                      },
                      separatorBuilder: (BuildContext context, int index) {
            return Divider(
              thickness: 1,
              height: 1,
            );
                      },
                    ),
          )
        ],
      ),
    );
  }

  Widget tileItemView(ProfileViewModel data) => ListTile(
        tileColor: secondaryColor,
        leading: Icon(
          data.leadingIcon,
          color: iconColor,
        ),
        title: Text(
          data.title,
          style: TextStyle(color: boldTextColor),
        ),
        trailing: Icon(
          data.trillingIcon,
          color: iconColor,
        ),
      );
}
