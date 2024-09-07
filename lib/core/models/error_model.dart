class AticleErrorModel {
  final String? status;
  final String? code;
  final String? message;
  const AticleErrorModel({this.status, this.code, this.message});
  AticleErrorModel copyWith({String? status, String? code, String? message}) {
    return AticleErrorModel(
        status: status ?? this.status,
        code: code ?? this.code,
        message: message ?? this.message);
  }

  Map<String, Object?> toJson() {
    return {'status': status, 'code': code, 'message': message};
  }

  static AticleErrorModel fromJson(Map<String, Object?> json) {
    return AticleErrorModel(
        status: json['status'] == null ? null : json['status'] as String,
        code: json['code'] == null ? null : json['code'] as String,
        message: json['message'] == null ? null : json['message'] as String);
  }

  @override
  String toString() {
    return '''AticleErrorModel(
                status:$status,
code:$code,
message:$message
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is AticleErrorModel &&
        other.runtimeType == runtimeType &&
        other.status == status &&
        other.code == code &&
        other.message == message;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, status, code, message);
  }
}
