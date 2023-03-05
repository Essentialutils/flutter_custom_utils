import 'dart:typed_data';
import 'package:crop_image/crop_image.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

///
/// pick file and crop if you want
///
cPickAndCropImage(
  BuildContext context, {
  cropDisable = false,
  Widget? title,
  aspectRatio = 1.7,
  allowedExtensions = const ['png', 'jpg', 'jpeg'],
  required Function(Uint8List data, String fileName) okButton,
  required Function() cancelButton,
}) async {
  var controller = CropController(
    aspectRatio: aspectRatio,
    // defaultCrop: const Rect.fromLTRB(0.1, 0.1, 0.9, 0.9),
  );
  Uint8List result;
  ui.Image bitmap;
  FilePickerResult? selectedFile = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: allowedExtensions,
  );
  if (selectedFile != null) {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: title,
        content: SingleChildScrollView(
          child: (cropDisable)
              ? Image.memory(selectedFile.files.first.bytes!)
              : Center(
                  child: CropImage(
                    controller: controller,
                    image: Image.memory(selectedFile.files.first.bytes!),
                    gridColor: Colors.black,
                    gridCornerSize: 50,
                    gridThinWidth: 1,
                    gridThickWidth: 4,
                    scrimColor: Colors.grey.withOpacity(0.7),
                    alwaysShowThirdLines: true,
                  ),
                ),
        ),
        actions: [
          TextButton(
            onPressed: cancelButton,
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async => {
              if (!cropDisable)
                {
                  bitmap = await controller.croppedBitmap(),
                  result =
                      (await bitmap.toByteData(format: ui.ImageByteFormat.png))!
                          .buffer
                          .asUint8List(),
                  okButton(result, selectedFile.files.first.name),
                }
              else
                {
                  okButton(
                    selectedFile.files.first.bytes!,
                    selectedFile.files.first.name,
                  )
                }
            },
            child: const Text('Ok'),
          ),
        ],
      ),
    );
  }
}
