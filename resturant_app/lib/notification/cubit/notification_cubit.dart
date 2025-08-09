import 'package:resturant_app/models/notification_model.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

abstract class NotificationState {}

class NotificationInitial extends NotificationState {}

class NotificationLoaded extends NotificationState {
  final List<NotificationModel> notifications;

  NotificationLoaded(this.notifications);
}

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(NotificationInitial());

  void loadNotifications() {
    final data = [
      NotificationModel(
        title: "Order Confirmed",
        body: "Your order #1234 has been confirmed!",
        timestamp: DateTime.now().subtract(Duration(minutes: 5)),
      ),
      NotificationModel(
        title: "New Promo",
        body: "Get 20% off on all desserts today!",
        timestamp: DateTime.now().subtract(Duration(hours: 2)),
      ),
      NotificationModel(
        title: "Delivery Update",
        body: "Your food is arriving in 10 minutes.",
        timestamp: DateTime.now().subtract(Duration(days: 1)),
      ),
    ];

    emit(NotificationLoaded(data));
  }

  void clearAll() {
    emit(NotificationLoaded([]));
  }
}
