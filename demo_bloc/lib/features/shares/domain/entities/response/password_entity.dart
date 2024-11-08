import 'package:equatable/equatable.dart';

class PasswordEntity extends Equatable {
  final String value;
  final bool isObsecure;

  const PasswordEntity({this.value = '', this.isObsecure = true});

  PasswordEntity copyWith({String? value, bool? isObsecure}) => PasswordEntity(
      value: value ?? this.value, isObsecure: isObsecure ?? this.isObsecure);

  @override
  List<Object?> get props => [value, isObsecure];
}
