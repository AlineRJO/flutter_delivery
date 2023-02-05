
import 'package:equatable/equatable.dart';
import 'package:match/match.dart';

part 'register_state.g.dart';

// TODO: comando  flutter pub run build_runner watch -d
@match
enum RegisterStatus {
  initial,
  register,
  sucess,
  error
}

class RegisterState extends Equatable{
  final RegisterStatus status;

  RegisterState({
    required this.status,
  });

  RegisterState.initial(): status = RegisterStatus.initial;

  RegisterState copyWith({
    RegisterStatus? status,
  }) {
    return RegisterState(
      status: status ?? this.status,
    );
  }
  
  @override
  List<Object?> get props => [status];
}
