import 'package:expense_tracker/app/ui/src/colors.dart';
import 'package:expense_tracker/core/helper/helper_.dart';
import 'package:expense_tracker/presentation/pages/onboarding/page/onboarding_profile_setup/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class OnboardingProfileSetupBody extends StatefulWidget {
  const OnboardingProfileSetupBody({super.key});

  @override
  State<OnboardingProfileSetupBody> createState() =>
      _OnboardingProfileSetupBodyState();
}

class _OnboardingProfileSetupBodyState
    extends State<OnboardingProfileSetupBody> {
  final _nameController = TextEditingController();
  final _pinController = TextEditingController();

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
                child: CircleAvatar(
                  radius: 80.r,
                  backgroundColor: ExpenseTrackerColors.violet80,
                  child: const Icon(
                    Icons.person,
                    size: 60,
                    color: Colors.white,
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
                    debugPrint('Name: ${_nameController.text}');
                    // try {
                    //   debugPrint(
                    //       'image: ${await _avatarBuilder?.build().asRawSvgBytes()}');
                    //   debugPrint('Pin: ${_pinController.text}');
                    // } catch (e) {
                    //   debugPrint('Error Image: $e');
                    //   debugPrint('SHITTTTTTTTTTTTTTTTTtt');
                    // }
                    // debugPrint('DONE IMAGENENENEN');
                    // // final image = await _avatarBuilder?.build().asRawSvgBytes();
                    if (!context.mounted) return;
                    await context
                        .read<OnboardingProfileSetupCubit>()
                        .saveProfile(
                          _nameController.text,
                          // image,
                          _pinController.text,
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
