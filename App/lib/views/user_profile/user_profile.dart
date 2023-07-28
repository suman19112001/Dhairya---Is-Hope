import 'package:dhairya/common/custom_text.dart';
import 'package:dhairya/services/auth_services.dart';
import 'package:dhairya/utils/app_color.dart';
import 'package:dhairya/utils/assets_data.dart';
import 'package:dhairya/views/user_profile/widgets/customTile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  String email = "";
  void getMail() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    email = sharedPreferences.getString('getMail').toString();
  }

  @override
  void initState() {
    super.initState();
    getMail();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.lightGreen,
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "Profile",
          style: TextStyle(
            color: Colors.black87,
            letterSpacing: 1,
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: AppColors.lightGreen,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Row(
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.transparent,
                  maxRadius: 45,
                  minRadius: 40,
                  backgroundImage: NetworkImage(
                      "https://images.unsplash.com/photo-1534080108966-0e6fda4c80b2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fHNtb2tlcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60"),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        customText("Mukesh",
                            size: 22.sp,
                            color: AppColors.textColor1,
                            isBold: true),
                        customText(email,
                            size: 14.sp, color: AppColors.textColor1)
                      ],
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    splashRadius: 10,
                    icon: const Icon(
                      Icons.edit_note_rounded,
                      color: AppColors.textColor1,
                      size: 28,
                    ))
              ],
            ),
          ),
          const SizedBox(height: 15),
          const CustomTile(assetIcon: AssetIcons.address, title: "Address"),
          const Divider(
            thickness: 0.5,
            // color: AppColors.textColor1,
          ),
          const CustomTile(
              assetIcon: AssetIcons.collection, title: "Collection"),
          const Divider(
            thickness: 0.5,
          ),
          const CustomTile(assetIcon: AssetIcons.coupons, title: "Coupons"),
          const Divider(
            thickness: 0.5,
          ),
          const CustomTile(assetIcon: AssetIcons.support, title: "Support"),
          const Divider(
            thickness: 0.5,
          ),
          const CustomTile(
              assetIcon: AssetIcons.privacyPolicy, title: "Privacy Policy"),
          const Divider(
            thickness: 0.5,
          ),
          GestureDetector(
              onTap: () {
                Provider.of<AuthServies>(context, listen: false)
                    .signOut(context);
              },
              child: const CustomTile(
                  assetIcon: AssetIcons.logout, title: "Logout")),
        ],
      ),
    );
  }
}
