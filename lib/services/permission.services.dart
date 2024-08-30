// import 'package:permission_handler/permission_handler.dart';

// abstract class PermissionService {
//   Future<bool> hasPermission(Permission permission);
//   Future<bool> requestPermission(Permission permission);
//   Future<bool> requestCameraPermission();
//   Future<bool> requestStoragePermission();
//   Future<bool> requestExtStoragePermission();
//   Future<bool> requestImagePermission();
//   Future<bool> requestMicPermission();
//   Future<bool> requestsAudioPermission();
//   Future<bool> requestMediaLibPermission();
//   Future<bool> requestNotificationPermission();
// }

// class PermissionServiceImpl implements PermissionService {
//   @override
//   Future<bool> hasPermission(Permission permission) async {
//     PermissionStatus status = await permission.status;
//     return status == PermissionStatus.granted;
//   }

//   @override
//   Future<bool> requestPermission(Permission permission) async {
//     PermissionStatus status = await permission.request();
//     return status == PermissionStatus.granted;
//   }

//   @override
//   Future<bool> requestCameraPermission() async {
//     return await requestPermission(Permission.camera);
//   }

//   @override
//   Future<bool> requestStoragePermission() async {
//     return await requestPermission(Permission.storage);
//   }

//   @override
//   Future<bool> requestExtStoragePermission() async {
//     return await requestPermission(Permission.manageExternalStorage);
//   }

//   @override
//   Future<bool> requestImagePermission() async {
//     return await requestPermission(Permission.photos);
//   }

//   @override
//   Future<bool> requestMicPermission() async {
//     return await requestPermission(Permission.microphone);
//   }

//   @override
//   Future<bool> requestsAudioPermission() async {
//     return await requestPermission(Permission.audio);
//   }

//   @override
//   Future<bool> requestMediaLibPermission() async {
//     return await requestPermission(Permission.mediaLibrary);
//   }

//   @override
//   Future<bool> requestNotificationPermission() async {
//     return await requestPermission(Permission.notification);
//   }
// }
