import 'package:dice_bear/dice_bear.dart';
import 'package:expense_tracker/app/ui/src/colors.dart';
import 'package:expense_tracker/core/helper/helper_.dart';
import 'package:expense_tracker/presentation/pages/onboarding/page/onboarding_profile_setup/cubit/cubit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

/// {@template onboarding_profile_setup_body}
/// Body of the OnboardingProfileSetupPage.
///
/// Add what it does
/// {@endtemplate}
class OnboardingProfileSetupBody extends StatefulWidget {
  /// {@macro onboarding_profile_setup_body}
  const OnboardingProfileSetupBody({super.key});

  @override
  State<OnboardingProfileSetupBody> createState() =>
      _OnboardingProfileSetupBodyState();
}

class _OnboardingProfileSetupBodyState
    extends State<OnboardingProfileSetupBody> {
  final _nameController = TextEditingController();
  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OnboardingProfileSetupCubit,
        OnboardingProfileSetupState>(
      builder: (context, statex) {
        // return Center(child: Text(state.customProperty));
        final avatar = _nameController.text.isNotEmpty
            ? DiceBearBuilder(seed: _nameController.text).build()
            : null;
        debugPrint('Avatar: $avatar');
        return Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Center(
                child: CircleAvatar(
                  radius: 80.r,
                  backgroundColor: ExpenseTrackerColors.violet80,
                  child: avatar != null
                      ? FutureBuilder<Uint8List?>(
                          future: avatar.asRawSvgBytes(),
                          builder: (context, snapshot) {
                            // return SvgPicture.network(
                            //   avatar.svgUri.toString(),
                            // );
                            if (snapshot.connectionState !=
                                ConnectionState.done) {
                              return const CircularProgressIndicator();
                            }
                            if (snapshot.hasError) {
                              return const Icon(Icons.error);
                            }
                            if (snapshot.data == null) {
                              return const Icon(Icons.error);
                            }
                            return SvgPicture.memory(
                              snapshot.data!,
                              fit: BoxFit.cover,
                              width: double.infinity,
                            );
                          },
                        )
                      : null,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 20.h,
                ),
                child: TextFormField(
                  controller: _nameController,
                  onChanged: (value) {
                    context
                        .read<OnboardingProfileSetupCubit>()
                        .changeName(value);
                  },
                  decoration: InputDecoration(
                    hintText: 'Name',
                    border: const OutlineInputBorder(),
                    disabledBorder: const OutlineInputBorder(
                      borderSide:
                          BorderSide(color: ExpenseTrackerColors.violet),
                    ),
                    errorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: ExpenseTrackerColors.red),
                    ),
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
              if (statex is OnboardingProfileSetupLoading)
                const CircularProgressIndicator()
              else
                ElevatedButton(
                  onPressed: () async {
                    if (_nameController.text.isEmpty) {
                      showFailureToast(context, 'Name Field is required!');
                      return;
                    }
                    debugPrint('Name: ${_nameController.text}');
                    debugPrint('Avater url :${avatar?.svgUri}');
                    context.read<OnboardingProfileSetupCubit>().saveProfile(
                        _nameController.text,
                        avatar?.svgUri.toString() ?? _nameController.text);
                  },
                  child: const Text('Create a Profile'),
                ),
            ],
          ),
        );
      },
      listener: (BuildContext context, OnboardingProfileSetupState state) {
        if (state is OnboardingProfileSetupSuccess) {
          context.pushNamed('setup-pin');
        }
      },
    );
  }
}
