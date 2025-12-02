import 'package:week_plan/models/schedule/schedule_model.dart';
import 'package:week_plan/repository/schedule_repository.dart';

class AddScheduleTileService {
  final ScheduleRepository scheRepo;

  AddScheduleTileService(this.scheRepo);
  void addSchedule(
    String uid,
    String scheduleName,
    String refId,
    String colorHex,
    DateTime startTime,
    DateTime endTime,
    bool isAllTime,
    bool isCompleted,
  ) {
    if (uid == '') {
      return;
    }

    scheRepo.addSchedule(ScheduleModel.createWithoutId(
        scheduleName: scheduleName,
        startTime: startTime,
        uid: uid,
        refId: refId,
        endTime: endTime,
        isAllDay: isAllTime,
        isCompleted: isCompleted));
  }
}
