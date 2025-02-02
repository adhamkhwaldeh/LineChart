// 1
import 'package:json_annotation/json_annotation.dart';

// 2
part 'monitoring_model.g.dart';

// 3
@JsonSerializable()
class MonitoringModel {
  String timestamp;
  num value;

  DateTime get dateTime {
    try {
      return DateTime.parse(timestamp);
    } catch (ex) {
      return DateTime.now();
    }
  }

  int get timeOnly {
    try {
      var date = DateTime.parse(timestamp);
      return date.hour * 60 + date.minute;
    } catch (ex) {
      return 1;
    }
  }

  String get time2View {
    try {
      var date = DateTime.parse(timestamp);
      return "${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}";
    } catch (ex) {
      return '';
    }
  }

  num get valueInKiloWatt {
    return value / 1000;
  }

  // 6
  MonitoringModel({
    required this.timestamp,
    required this.value,
  });

  // 7
  factory MonitoringModel.fromJson(Map<String, dynamic> json) =>
      _$MonitoringModelFromJson(json);

  // 8
  // @override
  Map<String, dynamic> toJson() => _$MonitoringModelToJson(this);

  // Override the equality operator
  // I've added the functions below for comparison within monitoring_bloc_test
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! MonitoringModel) return false;
    return other.timestamp == timestamp && other.value == value;
  }

  // Override the hashCode
  @override
  int get hashCode => Object.hash(timestamp, value);

  @override
  String toString() => 'Person(timestamp: $timestamp, value: $value)';
}
