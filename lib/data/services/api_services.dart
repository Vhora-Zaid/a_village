// import 'dart:convert';
// import 'package:http/http.dart';
// import 'package:http/http.dart' as http;
//
// import '../../models/notification_model.dart';
//
// class ApiService {
//   static Future<List<NotificationModel>> getNotifications() async {
//     final response = await http.get(Uri.parse('https://yourapi.com/notifications'));
//
//     if (response.statusCode == 200) {
//       final List<dynamic> jsonList = jsonDecode(response.body);
//       return jsonList.map((json) => NotificationModel.fromJson(json)).toList();
//     } else {
//       throw Exception('Failed to load notifications');
//     }
//   }
// }
