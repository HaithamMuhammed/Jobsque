// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque_flutter/Controller/Messages/message_cubit.dart';
import 'package:jobsque_flutter/View/Widgets/FilterListTile.dart';
import 'package:jobsque_flutter/View/Widgets/MessageListView.dart';
import 'package:jobsque_flutter/View/Widgets/MyText.dart';
import 'package:searchfield/searchfield.dart';

class MessageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Mytext(text: 'Messages'),
        actions: [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFFD1D5DB)),
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
              ),
              child: IconButton(
                icon: Image.asset("images/Filter-4.png"),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            FilterListTile(
                              title: 'All',
                              onTap: () {
                                context.read<MessageCubit>().loadMessages();
                                Navigator.pop(context);
                              },
                            ),
                            FilterListTile(
                              title: 'Unread',
                              onTap: () {
                                context
                                    .read<MessageCubit>()
                                    .filterMessages('Unread');
                                Navigator.pop(context);
                              },
                            ),
                            FilterListTile(
                              title: 'Spam',
                              onTap: () {
                                context
                                    .read<MessageCubit>()
                                    .filterMessages('Spam');
                                Navigator.pop(context);
                              },
                            ),
                            FilterListTile(
                              title: 'Archived',
                              onTap: () {
                                context
                                    .read<MessageCubit>()
                                    .filterMessages('Archived');
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(20.0),
            child: SearchField(
              searchInputDecoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 15),
                filled: true,
                fillColor: Colors.white,
                prefixIcon: Image.asset("images/search-normal.png"),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Color(0xFFD1D5DB))),
              ),
              suggestions: [],
              hint: 'Search...',
              searchStyle: TextStyle(fontSize: 15),
              maxSuggestionsInViewPort: 5,
              itemHeight: 50,
              onTap: () {},
            ),
          ),
          Expanded(
            child: MessagesListView(),
          ),
        ],
      ),
    );
  }
}
