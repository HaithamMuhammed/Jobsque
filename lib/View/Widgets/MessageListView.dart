import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque_flutter/Controller/Messages/message_cubit.dart';
import 'package:jobsque_flutter/View/Widgets/MyText.dart';

class MessagesListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MessageCubit, List<Message>>(
      builder: (context, messages) {
        return ListView.builder(
          itemCount: messages.length,
          itemBuilder: (context, index) {
            final message = messages[index];
            return ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: ListTile(
                tileColor: Colors.white,
                leading: CircleAvatar(
                  child: Mytext(text: message.sender[0]),
                ),
                title: Mytext(text: message.sender),
                subtitle: Mytext(text: message.content),
                trailing: Mytext(text: message.time),
              ),
            );
          },
        );
      },
    );
  }
}
