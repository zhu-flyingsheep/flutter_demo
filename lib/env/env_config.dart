

import 'package:json_annotation/json_annotation.dart';
///环境配置
@JsonSerializable(createToJson: false)
class EnvConfig {
  final String? env;
  final bool? debug;

  EnvConfig({
    this.env,
    this.debug,
  });

  factory EnvConfig.fromJson(Map<String, dynamic> json) => _$EnvConfigFromJson(json);
}


EnvConfig _$EnvConfigFromJson(Map<String, dynamic> json) {
  return EnvConfig(
    env: json['env'] as String?,
    debug: json['debug'] as bool?,
  );
}
