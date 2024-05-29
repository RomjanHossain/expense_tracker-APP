import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:expense_tracker/app/ui/app_ui.dart';
import 'package:expense_tracker/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class AttachmentPicker extends StatefulWidget {
  const AttachmentPicker({
    required this.selectIMGController,
    super.key,
  });

  final TextEditingController? selectIMGController;

  @override
  State<AttachmentPicker> createState() => _AttachmentPickerState();
}

class _AttachmentPickerState extends State<AttachmentPicker> {
  ///* upload picture

  XFile? image;

  final ImagePicker picker = ImagePicker();

  //we can upload image from camera or from gallery based on parameter
  Future<void> getImage(ImageSource media) async {
    final img = await picker.pickImage(
      source: media,
      imageQuality: 80,
      maxHeight: 500,
      maxWidth: 500,
    );

    setState(() {
      image = img;
    });
    if (image != null) {
      debugPrint(
        'image size is -> ${await image!.length()} and path -> ${image!.path}',
      );
      widget.selectIMGController?.text = image!.path;
      debugPrint(
        'image path from controller -> ${widget.selectIMGController?.text}',
      );
    } else {
      widget.selectIMGController?.text = '';
    }
  }

  ///* Upload picture GONE
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // show a bottom sheet
        showModalBottomSheet<void>(
          context: context,
          backgroundColor: isDarkMode(context)
              ? ExpenseTrackerColors.dark
              : ExpenseTrackerColors.light,
          builder: (context) => SizedBox(
            height: 200.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    getImage(ImageSource.camera);
                  },
                  child: const AttachmentCard(
                    icon: Icons.camera_alt_rounded,
                    text: 'Camera',
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    getImage(ImageSource.gallery);
                  },
                  child: const AttachmentCard(
                    icon: Icons.image_rounded,
                    text: 'Image',
                  ),
                ),
                const AttachmentCard(
                  icon: Icons.document_scanner_rounded,
                  text: 'Document',
                ),
              ],
            ),
          ),
        );
      },
      child: image != null
          ? Stack(
              children: [
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.file(
                      File(
                        image!.path,
                      ),
                      fit: BoxFit.cover,
                      height: 40.h,
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        image = null;
                        widget.selectIMGController?.text = '';
                      });
                    },
                    child: Container(
                      height: 20.h,
                      width: 20.w,
                      decoration: BoxDecoration(
                        color: ExpenseTrackerColors.light20,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Icon(
                        Icons.close,
                        color: ExpenseTrackerColors.light60,
                        size: 15,
                      ),
                    ),
                  ),
                ),
              ],
            )
          : DottedBorder(
              radius: const Radius.circular(15),
              borderType: BorderType.RRect,
              dashPattern: const [8, 4],
              color: ExpenseTrackerColors.light60,
              // borderPadding: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.attach_file,
                    color: ExpenseTrackerColors.light20,
                    size: 30,
                  ),
                  SizedBox(
                    width: 10.h,
                  ),
                  const Text(
                    'Add Attachment',
                    style: TextStyle(
                      color: ExpenseTrackerColors.light20,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

class AttachmentCard extends StatelessWidget {
  const AttachmentCard({
    required this.icon,
    required this.text,
    super.key,
  });
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 75.h,
      width: 90.w,
      decoration: BoxDecoration(
        color: ExpenseTrackerColors.violet20,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: ExpenseTrackerColors.violet,
          ),
          Text(
            text,
            style: ExpenseTrackerTextStyle.body3.copyWith(
              color: ExpenseTrackerColors.violet,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
