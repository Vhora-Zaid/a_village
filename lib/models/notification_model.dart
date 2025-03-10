
class NotificationModel {
  final String userName;
  final String message;
  final String avatarUrl;
  final String timeAgo;
  final bool isNew;

  NotificationModel({
    required this.userName,
    required this.message,
    required this.avatarUrl,
    required this.timeAgo,
    required this.isNew,
  });
}
