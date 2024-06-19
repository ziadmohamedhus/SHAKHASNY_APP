part of 'chat_cubit.dart';

@immutable
abstract class ChatState {}

class ChatInitial extends ChatState {}

class ChatSuccess extends ChatState {}

class ChatUpdateText extends ChatState {}

class ChatScrollText extends ChatState {}

class GetMessageLoadingState extends ChatState {}

class GetMessageSuccessState extends ChatState {}

class GetMessageFailureState extends ChatState {}

class SendMessageSuccessState extends ChatState {}

class SendMessageFailureState extends ChatState {}

class SendNotificationSuccessState extends ChatState {
  final String message;

  SendNotificationSuccessState({required this.message});
}
class SendNotificationFailureState extends ChatState {
  final String error;

  SendNotificationFailureState({required this.error});
}
