abstract class WelcomEvent {}

class UpdateValueEvent extends WelcomEvent {
  final int newValue;

  UpdateValueEvent({required this.newValue});
}
