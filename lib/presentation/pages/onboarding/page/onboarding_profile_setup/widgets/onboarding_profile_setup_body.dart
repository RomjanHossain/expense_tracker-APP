import 'dart:math';
import 'package:expense_tracker/app/ui/src/colors.dart';
import 'package:expense_tracker/core/helper/helper_.dart';
import 'package:expense_tracker/presentation/pages/onboarding/page/onboarding_profile_setup/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:random_avatar/random_avatar.dart';

class OnboardingProfileSetupBody extends StatefulWidget {
  const OnboardingProfileSetupBody({super.key});

  @override
  State<OnboardingProfileSetupBody> createState() =>
      _OnboardingProfileSetupBodyState();
}

class _OnboardingProfileSetupBodyState
    extends State<OnboardingProfileSetupBody> {
  late TextEditingController _nameController;
  late TextEditingController _pinController;
  late String profileString;
  @override
  void initState() {
    _nameController = TextEditingController();
    _pinController = TextEditingController();
    profileString = randomString(26);
    super.initState();
  }

  // DiceBearBuilder? _avatarBuilder;

  @override
  void dispose() {
    _nameController.dispose();
    _pinController.dispose();
    super.dispose();
  }

  // void _updateAvatarBuilder(String name) {
  //   if (name.isNotEmpty) {
  //     _avatarBuilder = DiceBearBuilder(seed: name);
  //   } else {
  //     _avatarBuilder = null;
  //   }
  //   setState(() {}); // Trigger UI update
  // }

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
    return BlocConsumer<OnboardingProfileSetupCubit,
        OnboardingProfileSetupState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Center(
                child: InkWell(
                  borderRadius: BorderRadius.circular(100),
                  onTap: () {
                    debugPrint('Change Profile Picture');
                    setState(() {
                      profileString = randomString(26);
                    });
                  },
                  child: CircleAvatar(
                    radius: 80.r,
                    backgroundColor: ExpenseTrackerColors.violet80,
                    child: RandomAvatar(
                      profileString,
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
                    // _updateAvatarBuilder(
                    //     value); // Update avatar when name changes
                    context
                        .read<OnboardingProfileSetupCubit>()
                        .changeName(value);
                  },
                  decoration: InputDecoration(
                    hintText: 'Name',
                    border: const OutlineInputBorder(),
                    focusedBorder: const OutlineInputBorder(
                      borderSide:
                          BorderSide(color: ExpenseTrackerColors.violet60),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide:
                          BorderSide(color: ExpenseTrackerColors.light40),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 12.h,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  bottom: 20.h,
                ),
                child: TextFormField(
                  controller: _pinController,
                  maxLength: 4,
                  onChanged: (value) {
                    context
                        .read<OnboardingProfileSetupCubit>()
                        .changePin(value);
                  },
                  keyboardType: TextInputType.number,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Pin',
                    border: const OutlineInputBorder(),
                    focusedBorder: const OutlineInputBorder(
                      borderSide:
                          BorderSide(color: ExpenseTrackerColors.violet60),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide:
                          BorderSide(color: ExpenseTrackerColors.light40),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 12.h,
                    ),
                  ),
                ),
              ),
              if (state is OnboardingProfileSetupLoading)
                const CircularProgressIndicator()
              else
                ElevatedButton(
                  onPressed: () async {
                    if (_nameController.text.isEmpty) {
                      showFailureToast(context, 'Name Field is required!');
                      return;
                    }

                    if (_pinController.text.isEmpty) {
                      showFailureToast(context, 'Pin Field is required!');
                      return;
                    }

                    if (_pinController.text.length != 4) {
                      showFailureToast(context, 'Pin should be 4 digit!');
                      return;
                    }
                    final image = RandomAvatarString(
                      profileString,
                      trBackground: true,
                    );
                    debugPrint('Name: ${_nameController.text}');
                    if (!context.mounted) return;
                    await context
                        .read<OnboardingProfileSetupCubit>()
                        .saveProfile(
                          _nameController.text,
                          _pinController.text,
                          image,
                        );
                  },
                  child: const Text('Create a Profile'),
                ),
            ],
          ),
        );
      },
      listener: (context, state) {
        if (state is OnboardingProfileSetupSuccess) {
          context.pushNamed('setup-pin');
        }
      },
    );
  }
}
