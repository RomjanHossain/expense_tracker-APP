import 'dart:math';

import 'package:expense_tracker/app/ui/src/colors.dart';
import 'package:expense_tracker/core/helper/helper_.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:random_avatar/random_avatar.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({required this.name, super.key});
  final String name;

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  late TextEditingController _nameController;
  late String initString;
  @override
  void initState() {
    _nameController = TextEditingController(text: widget.name);
    initString = widget.name;
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  String randomString(int length) {
    const chars = 'abcdefghijklmnopqrstuvwxyz';
    final random = Random();
    final result = List.generate(length, (index) {
      return chars[random.nextInt(chars.length)];
    });
    return result.join();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Center(
              child: InkWell(
                borderRadius: BorderRadius.circular(100),
                onTap: () {
                  debugPrint('Change Profile Picture');
                  setState(() {
                    initString = randomString(16);
                  });
                },
                child: CircleAvatar(
                  radius: 80.r,
                  backgroundColor: ExpenseTrackerColors.violet80,
                  // child: const Icon(
                  //   Icons.person,
                  //   size: 60,
                  //   color: Colors.white,
                  // ),
                  child: RandomAvatar(
                    initString,
                    trBackground: true,
                    width: 120,
                    height: 120,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 20.h,
                bottom: 10.h,
              ),
              child: TextFormField(
                controller: _nameController,
                onChanged: (value) {
                  setState(() {
                    initString = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Name',
                  border: const OutlineInputBorder(),
                  focusedBorder: const OutlineInputBorder(
                    borderSide:
                        BorderSide(color: ExpenseTrackerColors.violet60),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: ExpenseTrackerColors.light40),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 12.h,
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                if (_nameController.text.isEmpty) {
                  showFailureToast(context, 'Name Field is required!');
                  return;
                }
                debugPrint('Name: ${_nameController.text}');
              },
              child: const Text('Update'),
            ),
          ],
        ),
      ),
    );
  }
}
