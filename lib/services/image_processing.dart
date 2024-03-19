import 'dart:core';
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image/image.dart';
import 'package:path_provider/path_provider.dart';

RxBool splashDownloaded = false.obs;

class ImageProcessor {
  static Future<bool> checkImage(String imagePath) async {
    try {
      Uint8List imageBytes = await File(imagePath).readAsBytes();
      Image? image = decodeImage(imageBytes);
      if (image == null) {
        log("Image is Corrupted... $imagePath");
        return false;
      } else {
        log("Image is fine... $imagePath");
      }
      return true;
    } catch (error) {
      log(
        "Error during checking Image... Maybe Image File is Corrupt... $imagePath",
      );
      return false;
    }
  }

  // static Future<bool> checkVideo(String videoPath) async {
  //   bool videoParse = true;
  //   VideoPlayerController videoController = VideoPlayerController.file(
  //     File(videoPath),
  //   );
  //   await videoController.initialize().catchError((error) async {
  //     if (error.runtimeType == PlatformException) {
  //       PlatformException e = error as PlatformException;
  //       if (e.code == "VideoError") {
  //         log("there is error in file we are deleting it : $error");
  //         await File(videoPath).delete();
  //         videoParse = false;
  //       }
  //     } else {
  //       log("Error loading video: $error");
  //       await File(videoPath).delete();
  //       videoParse = false;
  //     }
  //   });
  //   await videoController.dispose();
  //   return videoParse;
  // }

  static getPath(String prefix) async {
    final appDirectory = await getExternalStorageDirectory();
    return "${appDirectory!.path}/$prefix";
  }

  static getDirectory() async {
    final appDirectory = await getApplicationDocumentsDirectory();
    return appDirectory.path;
  }

  static ensureDir(String path) async =>
      await Directory(path).exists() ? null : Directory(path).create();
  static Future<List<File>> cacheImages(
    List<String> urls,
    String prefix, {
    checkVideoEnable = false,
    forceDownload = false,
  }) async {
    List<File> files = [];
    for (var url in urls) {
      files.add(
        await ImageProcessor.cacheImage(
          url,
          prefix,
        ),
      );
    }
    return files;
  }

  static Future<File> cacheImage(
    String url,
    String prefix, {
    checkVideoEnable = false,
    forceDownload = false,
  }) async {
    if (url == "") {
      return File("");
    }
    final Uri uri = Uri.parse(url);
    final fileName = uri.path.split(Platform.pathSeparator).last;
    final directory = await ImageProcessor.getPath(prefix);
    final filePath = "$directory/$fileName";

    var imageFile = File(
      filePath,
    );

    if (await imageFile.exists()) {
      log("File already Exist in the App Directory ${imageFile.path}");
      return imageFile;
      // bool checkingImage = true;
      // if (checkVideoEnable) {
      //   checkingImage = await checkVideo(imageFile.path);
      // }
      // // video is corrupt we need should delete it and download again
      // // or force download video
      // if (checkingImage == false || forceDownload == true) {
      //   log("File is corrupt removing ${imageFile.path}");
      //   await imageFile.delete();
      // } else {
      //   // file is fine return the file
      //   return imageFile;
      // }
    }
    // file does not exist or it is corrupt
    await ImageProcessor.ensureDir(directory);
    await Dio().download(url, imageFile.path);

    log(
      "file Saved in App Directory ${imageFile.path}",
    );
    return imageFile;
  }

  Future<bool> deleteAllPrefixesFiles({required prefix}) async {
    try {
      List<FileSystemEntity> prefixFiles = [];
      if (await Directory(await getPath(prefix)).exists()) {
        prefixFiles = Directory(await getPath(prefix)).listSync();
      }
      if (prefixFiles.isNotEmpty) {
        log(
          "Total number of Already available videos in /$prefix: ${prefixFiles.length}",
        );
        for (var value in prefixFiles) {
          await value.delete();
        }
        log("All of the splash screen videos deleted...");
      }
      return true;
    } catch (e) {
      log("Error in image_processing: $e");
      return false;
    }
  }

  // final mediaStore = MediaStore();
  // Future<bool> storeMediaFileExistCheck(String fileName, bool isVideo) async {
  //   try {
  //     final Uri? mediaUri = await mediaStore.getFileUri(
  //       fileName: fileName,
  //       dirType: isVideo ? DirType.video : DirType.photo,
  //       dirName: isVideo ? DirType.video.defaults : DirType.photo.defaults,
  //     );
  //     if (mediaUri == null) {
  //       return false;
  //     }
  //     return true;
  //   } catch (error) {
  //     log("Error in storeMediaFileExistCheck: $error");
  //     return false;
  //   }
  // }
  //
  // File getMediaStoreFile({
  //   String? relativePath,
  //   required String fileName,
  //   required DirType dirType,
  //   required DirName dirName,
  // }) {
  //   return File(
  //     "${dirType.fullPath(
  //       relativePath: relativePath.orAppFolder,
  //       dirName: dirName,
  //     )}/$fileName",
  //   );
  // }
  //
  // static Future<void> saveDummyFile() async {
  //   final breadVideo = await rootBundle.load(Assets.videosBread);
  //   final categoryImage = await rootBundle.load(Assets.imagesCategory10);
  //   final directory = await ImageProcessor.getDirectory();
  //   final breadVideoFile = File(
  //     "$directory/dummy.mp4",
  //   );
  //   final categoryImageFile = File(
  //     "$directory/dummy.png",
  //   );
  //   breadVideoFile.create(recursive: true);
  //   categoryImageFile.create(recursive: true);
  //   await breadVideoFile.writeAsBytes(
  //     breadVideo.buffer.asUint8List(
  //       breadVideo.offsetInBytes,
  //       breadVideo.lengthInBytes,
  //     ),
  //   );
  //   log("Saved Dummy Video File...");
  //   await categoryImageFile.writeAsBytes(
  //     categoryImage.buffer.asUint8List(
  //       categoryImage.offsetInBytes,
  //       categoryImage.lengthInBytes,
  //     ),
  //   );
  //   log("Saved Dummy Image File...");
  // }
  //
  // Future<bool> saveMediaStoreFile(File file, bool isVideo) async {
  //   return await mediaStore.saveFile(
  //     tempFilePath: file.path,
  //     dirType: isVideo ? DirType.video : DirType.photo,
  //     dirName: isVideo ? DirType.video.defaults : DirType.photo.defaults,
  //   );
  // }
  //
  // Future<File> getDummyFile(bool isVideo, String directory) async {
  //   if (isVideo) {
  //     return File(
  //       "$directory/dummy.mp4",
  //     );
  //   } else {
  //     return File(
  //       "$directory/dummy.png",
  //     );
  //   }
  // }
  //
  // Future<File> storeMediaDownload({
  //   required String url,
  //   required String prefix,
  //   required bool isVideo,
  // }) async {
  //   final Uri uri = Uri.parse(url);
  //   String fileName = uri.path.split(Platform.pathSeparator).last;
  //   if (!fileName.contains(".")) {
  //     fileName = isVideo ? "$fileName.mp4" : "$fileName.png";
  //   }
  //   bool isFileExist = await storeMediaFileExistCheck(fileName, isVideo);
  //   if (isFileExist) {
  //     return getMediaStoreFile(
  //       fileName: fileName,
  //       dirType: isVideo ? DirType.video : DirType.photo,
  //       dirName: isVideo ? DirType.video.defaults : DirType.photo.defaults,
  //     );
  //   }
  //   final directory = await ImageProcessor.getDirectory();
  //   try {
  //     final filePath = "$directory/$fileName";
  //     var file = File(
  //       filePath,
  //     );
  //     final sink = file.openWrite();
  //     try {
  //       await Dio()
  //           .download(
  //             url,
  //             file.path,
  //           )
  //           .whenComplete(
  //             () => sink.close(),
  //           );
  //     } catch (e) {
  //       log("Error in storeMediaVideoDownload: $e | $url");
  //       sink.close();
  //       return await getDummyFile(isVideo, directory);
  //     }
  //
  //     bool mediaStoreSaved = await saveMediaStoreFile(
  //       file,
  //       isVideo,
  //     );
  //     log("Media Store Saved: $mediaStoreSaved | $url");
  //
  //     return getMediaStoreFile(
  //       fileName: fileName,
  //       dirType: isVideo ? DirType.video : DirType.photo,
  //       dirName: isVideo ? DirType.video.defaults : DirType.photo.defaults,
  //     );
  //   } catch (error) {
  //     log("Error in storeMediaVideoDownload: $error | $url");
  //     return getDummyFile(isVideo, directory);
  //   }
  // }

  // Future<bool> deleteNonListFilesAndFetchNewFiles({
  //   required List<String> listOfNetworks,
  //   required String prefix,
  //   bool isCourseData = false,
  //   checkVideoEnable = false,
  //   required bool isVideo,
  // }) async {
  //   try {
  //     if (listOfNetworks.isNotEmpty) {
  //       for (var url in listOfNetworks) {
  //         File file = await cacheImage(
  //           url,
  //           prefix,
  //           checkVideoEnable: checkVideoEnable,
  //         );

  //         if (isCourseData == true) {
  //           var localList = storage.listOfLocalImages;
  //           log("before course Data: ${storage.listOfLocalImages.length}");
  //           localList.add(file.path);
  //           storage.listOfLocalImages = localList;
  //           log("after course Data: ${storage.listOfLocalImages.length}");
  //         }
  //       }
  //     }
  //     return true;
  //   } catch (e) {
  //     log("Error on deleting the image: $e");
  //     return false;
  //   }
  // }

  // //process images
  // Future<File> processSplashVideo(String url) async {
  //   String prefix = AppPrefixes.splashVideo;
  //   try {
  //     return await cacheImage(url, prefix, checkVideoEnable: true);
  //   } catch (e) {
  //     splashDownloaded.value = false;
  //     log("Error on processing AdRouterImage");
  //     return File("");
  //   }
  // }

  // Future<List<File>> processCategoryVideos(List<String> urls) async {
  //   try {
  //     List<File> files = [];
  //     for (var url in urls) {
  //       files.add(await processCategoryVideo(url));
  //     }
  //     return files;
  //   } catch (e) {
  //     log("Error on processing category video");
  //     return List<File>.empty();
  //   }
  // }
}

// Future<void> backgroundVideosDownloader(List<String> categoriesVideos) async {
//   List<DownloadTask> tasks = [];
//   String prefix = AppPrefixes.categoriesVideos;
//   for (var videoLinks in categoriesVideos) {
//     final Uri uri = Uri.parse(videoLinks);
//     final fileName = uri.path.split(Platform.pathSeparator).last;
//     final task = DownloadTask(
//       url: videoLinks,
//       filename: fileName,
//       directory: prefix,
//     );
//     tasks.add(task);
//   }
//   try {
//     await FileDownloader().downloadBatch(tasks,
//         batchProgressCallback: (succeeded, failed) => log(
//             'Completed ${succeeded + failed} out of ${tasks.length}, $failed failed'));
//   } catch (e) {
//     log("Failed to download videos");
//   }
// }
