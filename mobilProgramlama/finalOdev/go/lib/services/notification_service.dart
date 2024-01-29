// ignore_for_file: unused_field

import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationService {
  final FirebaseMessaging _firebaseMessaging;

  NotificationService(this._firebaseMessaging);

  Future<void> init() async {
    // Uygulama açıkken gelen bildirimleri dinle
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      // Handle receiving message
    });

    // Uygulama kapalıyken gelen bildirimleri dinle
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {});
  }
}
