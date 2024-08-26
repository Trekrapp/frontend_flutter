import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/entities/messages/message_entity.dart';
import '../../../../domain/use_cases/messages/get_message_use_case.dart';

part 'get_messages_state.dart';

class GetMessagesCubit extends Cubit<GetMessagesState> {
  final GetMessageUseCase getMessageUseCase;
  GetMessagesCubit({required this.getMessageUseCase})
      : super(GetMessagesInitial());
  Future<void> fetchMessages() async {
    emit(GetMessagesLoading());
    try {
      final result = await getMessageUseCase.callback();
      result.fold((l) => emit(GetMessagesFailure(message: l.message)),
          (r) => emit(GetMessagesLoaded(messages: r)));
    } on SocketException catch (e) {
      print("this is error $e");
      emit(GetMessagesFailure(message: e.toString()));
    } catch (e) {
      print("this is error $e");
      emit(GetMessagesFailure(message: e.toString()));
    }
  }
}
