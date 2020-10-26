import 'package:hive/hive.dart';
import 'package:my_garden/hive_helper/hive_types.dart';
import 'package:my_garden/hive_helper/hive_adapters.dart';
import 'package:my_garden/hive_helper/fields/notification_model_fields.dart';


part 'notification_model.g.dart';


@HiveType(typeId: HiveTypes.notificationModel, adapterName: HiveAdapters.notificationModel)
class NotificationModel extends HiveObject{
	@HiveField(NotificationModelFields.title)
  final String title;
	@HiveField(NotificationModelFields.message)
  final String message;
	@HiveField(NotificationModelFields.date)
  final String date;
	@HiveField(NotificationModelFields.isEnable)
  final bool isEnable;
  NotificationModel({
    this.title,
    this.message,
    this.date,
    this.isEnable,
  });
}