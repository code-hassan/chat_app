import 'package:chat_app/screens/chat.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatUserList extends StatefulWidget {
  const ChatUserList({super.key});

  @override
  State<ChatUserList> createState() => _ChatUserListState();
}

class _ChatUserListState extends State<ChatUserList> {
  final authenticatedUser = FirebaseAuth.instance.currentUser!;
  final CollectionReference usersCollection = FirebaseFirestore.instance.collection('users');

  // Map to store user data
  List<Map<String, dynamic>> userList = [];

  @override
  void initState() {
    super.initState();
    // Fetch user data from Firestore when the widget is initialized
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    try {
      // Assuming 'hassan@gmail.com' is the user's email
      QuerySnapshot querySnapshot = await usersCollection.get();

      // Iterate through documents and store user data in the list
      querySnapshot.docs.forEach((doc) {
        Map<String, dynamic> userData = {
          'email': doc['email'],
          'image_Url': doc['image_Url'],
          'username': doc['username'],
        };
        userList.add(userData);
      });

      // Print the user list for debugging
      print("User List: $userList");

      // Update the UI
      setState(() {});
    } catch (e) {
      // Handle errors
      print("Error fetching user data: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat Users'),
      ),
    body: ListView.builder(
      itemCount: userList.length,
        itemBuilder: (ctx,index){
          var user = userList[index];
          return ListTile(
            onTap: (){
             Navigator.of(context)
                 .push(
                 MaterialPageRoute(
                     builder: (ctx) => ChatScreen()));
            },
            title: Text('${user['username']}'),
            subtitle: Text('${user['email']}'),
            leading: CircleAvatar(
              backgroundImage: NetworkImage(user['image_Url']),
            ),
            // Other user information or actions can be added here
          );
        }),
    );
  }
}
