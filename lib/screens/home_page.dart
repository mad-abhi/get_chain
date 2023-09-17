import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_chain/screens/chat_page.dart';
import 'package:get_chain/services/auth/auth_service.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //instance of auth
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void signOut() {
    final authService = Provider.of<AuthService>(context, listen: false);
    authService.singOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        backgroundColor: Colors.blue,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: signOut,
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: _buildUserList(),
    );
  }

  //Build a list of users except for the current logged in User
  Widget _buildUserList() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('users').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text('Error');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text('Loading...');
        }
        return ListView(
          children: snapshot.data!.docs
              .map<Widget>((doc) => _buildUserListItem(doc))
              .toList(),
        );
      },
    );
  }

  //build individual user list items
  Widget _buildUserListItem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

    //display all user except current user
    if (_auth.currentUser!.email != data['email']) {
      return ListTile(
        title: Text(data['email']),
        onTap: () {
          //pass the clicked users uid to the chat page
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatPage(
                reciveruserEmail: data['email'],
                reciverUserID: data['uid'],
              ),
            ),
          );
        },
      );
    } else {
      return Container();
    }
  }
}
