import 'dart:async';
import 'dart:io';
import 'dart:ui' as ui;

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

import '../../data/data.dart';

class MediaService {
  final ImageCropper _cropper = ImageCropper();
  final FilePicker _filePicker = FilePicker.platform;

  // final FileSaver _fileSaver = FileSaver.instance;
  final ImagePicker _picker = ImagePicker();

  Future<FileResult?> getImage({bool fromCamera = false}) async {
    XFile? res;
    if (fromCamera) {
      res = await _picker.pickImage(source: ImageSource.camera);
      if (res == null) return null;
    } else {
      res = await _picker.pickImage(source: ImageSource.gallery);
      if (res == null) return null;
    }
    final file = File(res.path);
    return FileResult(
      path: file.path,
      size: file.lengthSync() / 1024,
      fileName: file.path.split('/').last,
    );
  }

  Future<FileResult?> getFile(
      {List<String>? allowedExts, bool allowMultiple = false}) async {
    FilePickerResult? res;
    res = await _filePicker.pickFiles(
      allowMultiple: allowMultiple,
      allowedExtensions: allowedExts,
      type: allowedExts == null ? FileType.any : FileType.custom,
    );
    if (res == null && res!.files.isNotEmpty) return null;
    final file = File(res.files.single.path!);
    return FileResult(
      path: file.path,
      size: file.lengthSync() / 1024,
      fileName: file.path.split('/').last,
    );
  }

  // Future<FileResult?> saveFile({
  //   required String name,
  //   required Uint8List bytes,
  //   File? file,
  //   String? filePath,
  //   LinkDetails? link,
  //   String ext = '',
  //   MimeType mimeType = MimeType.other,
  //   String? customMimeType,
  // }) async {
  //   var status = await Permission.storage.status;
  //   if (!status.isGranted) {
  //     await Permission.storage.request();
  //   }
  //   String path = await ExternalPath.getExternalStoragePublicDirectory(
  //     ExternalPath.DIRECTORY_DOWNLOADS,
  //   );
  //
  //   final file = File(
  //     '$path/$name${DateTime.now().microsecondsSinceEpoch}.$ext',
  //   );
  //   file.writeAsBytesSync(bytes);
  //   // String? res = await _fileSaver.saveAs(
  //   //   name: downloadFileName(name, ext, path),
  //   //   filePath: path,
  //   //   bytes: bytes,
  //   //   ext: ext,
  //   //   // file: file,
  //   //   mimeType: mimeType,
  //   // );
  //   // if (res == null) return null;
  //   // final fileRes = File(res);
  //   return FileResult(
  //     path: file.path,
  //     size: file.lengthSync() / 1024,
  //     fileName: file.path.split('/').last,
  //   );
  // }

  Future<List<FileResult>?> getMultiImage() async {
    final res = await _picker.pickMultiImage();
    return res.map((e) {
      final file = File(e.path);
      return FileResult(
        path: file.path,
        size: file.lengthSync() / 1024,
        fileName: file.path.split('/').last,
      );
    }).toList();
  }

  Future<FileResult?> getImageCropped(
      {required FileResult file, int? size}) async {
    final res = await _cropper.cropImage(
      sourcePath: file.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],
      cropStyle: CropStyle.circle,
      aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
      compressQuality: 100,
      maxWidth: size,
      maxHeight: size,
      compressFormat: ImageCompressFormat.jpg,
      uiSettings: [
        IOSUiSettings(title: ''),
        AndroidUiSettings(
          toolbarTitle: 'Crop',
          toolbarColor: Colors.black,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.square,
          lockAspectRatio: false,
        ),
      ],
    );
    if (res == null) return null;
    return file.copyWith(path: res.path);
  }

  Future<FileResult> resizeImage(
      {required FileResult file, required Size size}) async {
    final res = await FlutterNativeImage.compressImage(
      file.path,
      targetWidth: size.width.toInt(),
      targetHeight: (size.width * size.aspectRatio).toInt(),
    );
    return file.copyWith(path: res.path);
  }

  Future<FileResult> compressImage(
      {required FileResult file, required int quality}) async {
    final res = await FlutterNativeImage.compressImage(
      file.path,
      quality: quality,
    );
    return file.copyWith(path: res.path);
  }

  Future<FileResult?> downloadFile({required String url}) async {
    final filename = url.split('/').last;
    final directory = await getTemporaryDirectory();
    final filePath = '${directory.path}/$filename';
    final response = await http.get(Uri.parse(url));
    final file = File(filePath);
    await file.writeAsBytes(response.bodyBytes);

    return FileResult(
      path: filePath,
      size: File(filePath).lengthSync() / 1024,
      fileName: url.split('/').last,
    );
  }

  String downloadFileName(String fileName, String? fileExt, String path) {
    // String fExt = fileName.split('.').last;
    String fileName0 = '';
    String tempFileName = '';
    // fileExt ??= fExt;
    // if (fExt == fileExt) {
    //   fileName0 = fileName.substring(0, (fileName.length - fExt.length - 1));
    // } else {
    fileName0 = fileName;
    // }
    int count = 1;
    tempFileName = fileName0;
    while (File('$path/$tempFileName.$fileExt').existsSync()) {
      tempFileName = '$fileName0 (${count.toString()})';
      count++;
    }
    return tempFileName;
  }

  Future<Uint8List?> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    final bytesData =
        (await fi.image.toByteData(format: ui.ImageByteFormat.png));
    if (bytesData == null) return null;
    return bytesData.buffer.asUint8List();
  }
}

final mediaService = Provider((ref) => MediaService());
