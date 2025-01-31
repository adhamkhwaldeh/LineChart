// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'monitoring_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MonitoringModel _$MonitoringModelFromJson(Map<String, dynamic> json) =>
    MonitoringModel(
      timestamp: json['timestamp'] as String,
      value: (json['value'] as num).toInt(),
    );

Map<String, dynamic> _$MonitoringModelToJson(MonitoringModel instance) =>
    <String, dynamic>{
      'timestamp': instance.timestamp,
      'value': instance.value,
    };
