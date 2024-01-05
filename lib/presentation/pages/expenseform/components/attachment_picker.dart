import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
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

  //show popup dialog
  void myAlert() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          title: const Text('Select Attachment Image'),
          content: SizedBox(
            height: MediaQuery.of(context).size.height / 6,
            width: MediaQuery.of(context).size.width / 2,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: ElevatedButton(
                    //if user click this button, user can upload image from gallery
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.gallery);
                    },
                    style: ButtonStyle(
                      // backgroundColor:
                      //     const MaterialStatePropertyAll(priceBoxColor),
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.image,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        const Text(
                          'From Gallery',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      // backgroundColor:
                      //     const MaterialStatePropertyAll(priceBoxColor),
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                    //if user click this button. user can upload image from camera
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.camera);
                    },
                    child: Row(
                      children: [
                        const Icon(
                          Icons.camera,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        const Text(
                          'From Camera',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  ///* Upload picture GONE
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: myAlert,
      child: image != null
          ? ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.file(
                File(
                  image!.path,
                ),
                fit: BoxFit.cover,
                height: 250.h,
              ),
            )
          : DottedBorder(
              radius: const Radius.circular(15),
              borderType: BorderType.RRect,
              dashPattern: const [8, 4],
              // borderPadding: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.attach_file,
                    color: Colors.black,
                    size: 30,
                  ),
                  SizedBox(
                    width: 10.h,
                  ),
                  const Text(
                    'Add Attachment',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
