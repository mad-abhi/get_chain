import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_chain/components/chat_bubble.dart';
import 'package:get_chain/components/get_bubble.dart';
import 'package:get_chain/components/my_text_field.dart';
import 'package:get_chain/components/name_bubble.dart';
import 'package:get_chain/services/chat/chat_service.dart';

class ChatPage extends StatefulWidget {
  final String reciveruserEmail;
  final String reciverUserID;
  const ChatPage({
    super.key,
    required this.reciveruserEmail,
    required this.reciverUserID,
  });

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _messageController = TextEditingController();
  final ChatService _chatService = ChatService();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void sendMessage() async {
    //only send the message if there is something to send
    if (_messageController.text.isNotEmpty) {
      await _chatService.sendMessage(
          widget.reciverUserID, _messageController.text);
      //clear the text controller afetr sending the message
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.reciveruserEmail),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          //messages
          Expanded(
            child: _buildMessageList(),
          ),

          //user input
          _buildMessageInput(),

          const SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }

  //build message List
  Widget _buildMessageList() {
    return StreamBuilder(
      stream: _chatService.getMessages(
          widget.reciverUserID, _firebaseAuth.currentUser!.uid),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error${snapshot.error}');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text('Loading...');
        }
        return ListView(
          children: snapshot.data!.docs
              .map((document) => _buildMessageItem(document))
              .toList(),
        );
      },
    );
  }

  //build message item
  Widget _buildMessageItem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;

    //align the messages to the right if the sender is the current user,otherwise to the left
    var alignmnet = (data['senderId'] == _firebaseAuth.currentUser!.uid)
        ? Alignment.centerRight
        : Alignment.centerLeft;
    return Container(
      alignment: alignmnet,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment:
              (data['senderId'] == _firebaseAuth.currentUser!.uid)
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
          mainAxisAlignment:
              (data['senderId'] == _firebaseAuth.currentUser!.uid)
                  ? MainAxisAlignment.end
                  : MainAxisAlignment.start,
          children: [
            NameBubble(message: data['senderEmail']),
            const SizedBox(
              height: 5.0,
            ),
            data['senderId'] == _firebaseAuth.currentUser!.uid
                ? ChatBubble(message: data['message'])
                : GetBubble(message: data['message']),
          ],
        ),
      ),
    );
  }

  // build message input
  Widget _buildMessageInput() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 25.0,
      ),
      child: Row(
        children: [
          Expanded(
            child: MyTextField(
              controller: _messageController,
              hindText: 'Enter Message',
              obscureText: false,
            ),
          ),
          IconButton(
            onPressed: sendMessage,
            icon: Icon(
              Icons.arrow_upward_rounded,
              size: 40,
            ),
          ),
        ],
      ),
    );
  }
}
