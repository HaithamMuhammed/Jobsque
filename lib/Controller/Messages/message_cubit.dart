import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'message_state.dart';

class Message {
  final String sender;
  final String content;
  final String time;
  final bool isUnread;
  final bool isSpam;
  final bool isArchived;

  Message(this.sender, this.content, this.time,
      {this.isUnread = false, this.isSpam = false, this.isArchived = false});
}

class MessageCubit extends Cubit<List<Message>> {
  MessageCubit() : super([]) {
    loadMessages();
  }

  void loadMessages() {
    emit([
      Message('Twitter', 'Here is the link: http://zoom.com/jbcodefp', '12:39',
          isUnread: true),
      Message('Gojek Indonesia', 'Let\'s keep in touch.', '12:39',
          isUnread: true),
      Message('Shoope', 'Thank You David!', '09:45'),
      Message('Dana', 'Thank you for your attention!', 'Yesterday'),
      Message('Slack', 'I look forward to hearing from you.', '12/8',
          isSpam: true),
      Message('Facebook', 'What about the interview stage?', '12/8',
          isArchived: true),
    ]);
  }

  void filterMessages(String filter) {
    if (filter == 'Unread') {
      emit(state.where((message) => message.isUnread).toList());
    } else if (filter == 'Spam') {
      emit(state.where((message) => message.isSpam).toList());
    } else if (filter == 'Archived') {
      emit(state.where((message) => message.isArchived).toList());
    } else {
      loadMessages();
    }
  }
}
