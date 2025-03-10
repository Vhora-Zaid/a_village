// import 'package:flutter/material.dart';
// import '../data/services/api_services.dart';
// import '../models/notification_model.dart';
//
// class NotificationProvider with ChangeNotifier {
//   List<NotificationModel> _notifications = [];
//   bool _isLoading = false;
//   bool _hasError = false;
//
//   List<NotificationModel> get notifications => _notifications;
//   bool get isLoading => _isLoading;
//   bool get hasError => _hasError;
//
//   Future<void> fetchNotifications() async {
//     _isLoading = true;
//     _hasError = false;
//     notifyListeners();
//
//     try {
//       final data = await ApiService.getNotifications();
//       _notifications = data;
//     } catch (e) {
//       _hasError = true;
//     } finally {
//       _isLoading = false;
//       notifyListeners();
//     }
//   }
// }
