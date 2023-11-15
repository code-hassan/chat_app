
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'chat.dart';


class ChatUserList extends StatelessWidget {
   ChatUserList({super.key});
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String?> getUserID() async {
    User? user = _auth.currentUser;
    if (user != null) {
      return user.uid;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User List'),
        actions: [
          IconButton(
            onPressed: (){
              FirebaseAuth.instance.signOut();
            },
            icon: Icon(
              Icons.exit_to_app,
              color: Theme.of(context).colorScheme.primary,

            ),
          ),
        ],
      ),
      body: FutureBuilder(
        future: getUserID(),
        builder: (context, AsyncSnapshot<String?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (!snapshot.hasData || snapshot.data == null) {
            // User not authenticated
            // You might want to navigate to a login screen or handle this case differently
            return const Center(
              child: Text('User not authenticated'),
            );
          }

          String currentUserId = snapshot.data!;

          return StreamBuilder(
            stream: FirebaseFirestore.instance.collection('users').snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              List<DocumentSnapshot> users = snapshot.data!.docs;

              return ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {

                  var user = users[index].data() as Map<String, dynamic>;
                  var name = user['username'] ?? 'No Name';
                  var email = user['email'] ?? 'No Email';
                  print("user ${user}");
                  // Filter out the currently authenticated user
                  if (users[index].id == currentUserId) {
                    return const SizedBox(); // Skip rendering for the current user
                  }
                  return ListTile(
                    onTap: (){
                      Navigator.of(context)
                          .push(
                          MaterialPageRoute(
                              builder: (ctx) => ChatScreen(documentId: users[index].id,)));
                    },
                    title: Text(name),
                    subtitle: Text(email),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(user['image_Url']),
                    ),
                    // Other user information or actions can be added here
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
