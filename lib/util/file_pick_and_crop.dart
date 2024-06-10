import 'dart:typed_data';
import 'package:crop_image/crop_image.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:flutter/widgets.dart';

const oneBytes = 1048576;

/// Opens a file picker dialog allowing the user to select an image file, optionally crop it, and then perform actions based on user interaction.
///
/// - `context`: The `BuildContext` used to display the dialog.
/// - `cropDisable`: A boolean flag to enable or disable image cropping. Defaults to `false`.
/// - `title`: An optional widget to set as the dialog title.
/// - `aspectRatio`: The aspect ratio for image cropping, if enabled. Defaults to `1.7`.
/// - `allowedExtensions`: A list of allowed file extensions for image selection. Defaults to `['png', 'jpg', 'jpeg']`.
/// - `okButton`: A required callback function that will be invoked when the user confirms the selection. It receives the image data (`Uint8List`) and the selected file name.
/// - `cancelButton`: A required callback function that will be invoked when the user cancels the selection.
///
/// Example usage:
/// ```dart
/// cPickAndCropImage(
///   context,
///   title: Text('Select an Image'),
///   cropDisable: false,
///   aspectRatio: 1.5,
///   allowedExtensions: ['jpg', 'jpeg'],
///   okButton: (data, fileName) {
///     // Handle the selected image data here.
///   },
///   cancelButton: () {
///     // Handle cancel action here.
///   },
/// );
/// ```
///
/// This function opens a file picker dialog, allows the user to choose an image file, and optionally provides cropping functionality. Once the user confirms or cancels the selection, the appropriate callback is invoked to handle the chosen image data.
cPickAndCropImage(
  BuildContext context, {
  cropDisable = false,
  Widget? title,
  aspectRatio = 1.7,
  allowedExtensions = const ['png', 'jpg', 'jpeg', 'webp'],
  int? maxFileSizeInBytes,
  required Function(Uint8List data, String fileName) okButton,
  required Function() cancelButton,
  Function(String message)? errors,
}) async {
  var scrollController = ScrollController();
  var controller = CropController(
    aspectRatio: aspectRatio,
  );

  Uint8List result;
  ui.Image bitmap;

  bool active = true;

  String processing =
      'Upon processing the image, please remain patient until the completion of the task. ';

  FilePickerResult? selectedFile = await FilePicker.platform.pickFiles(
    withData: true,
    type: FileType.custom,
    allowedExtensions: allowedExtensions,
  );

  if (selectedFile != null) {
    if (maxFileSizeInBytes != null &&
        selectedFile.files.first.size > maxFileSizeInBytes) {
      errors?.call(
        'The file is too big required size is ${maxFileSizeInBytes / oneBytes} MB and provided ${selectedFile.files.first.size / oneBytes} MB',
      );
    } else {
      showAdaptiveDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) => AlertDialog.adaptive(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          title: title,
          content: Scrollbar(
            controller: scrollController,
            thumbVisibility: true,
            trackVisibility: true,
            thickness: 10,
            radius: Radius.zero,
            child: SingleChildScrollView(
              controller: scrollController,
              child: (cropDisable)
                  ? Image.memory(
                      selectedFile.files.first.bytes!,
                    )
                  : Center(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: CropImage(
                          controller: controller,
                          image: Image.memory(
                            selectedFile.files.first.bytes!,
                          ),
                          gridColor: Colors.black,
                          gridCornerSize: 50,
                          gridThinWidth: 1,
                          gridThickWidth: 4,
                          scrimColor: Colors.grey.withOpacity(0.7),
                          alwaysShowThirdLines: true,
                        ),
                      ),
                    ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (active) {
                  cancelButton();
                } else {
                  errors?.call(processing);
                }
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () async => {
                if (active)
                  {
                    if (!cropDisable)
                      {
                        active = false,
                        bitmap = await controller.croppedBitmap(),
                        result = (await bitmap.toByteData(
                          format: ui.ImageByteFormat.png,
                        ))!
                            .buffer
                            .asUint8List(),
                        okButton(result, selectedFile.files.first.name),
                        active = true,
                      }
                    else
                      {
                        okButton(
                          selectedFile.files.first.bytes!,
                          selectedFile.files.first.name,
                        ),
                      },
                  }
                else
                  {
                    errors?.call(processing),
                  },
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      );
    }
  }
}
