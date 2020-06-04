import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pics_world/models/user.dart';
import 'package:pics_world/pages/profile.dart';
import 'package:pics_world/pages/upload.dart';
import 'package:pics_world/widgets/post.dart';
import '../widgets/header.dart';
import '../widgets/progress.dart';
import '../pages/home.dart';

class Timeline extends StatefulWidget {
  @override
  _TimelineState createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  
  List<Post> posts = [];
  List<Post> postsDisp=[];
  List<User> uId=[];
  List<QuerySnapshot> snapshot=[];
  @override
  void initState() {
    // TODO: implement initState
    setPosts();
    super.initState();
  }
  getUserIds() async{
    QuerySnapshot snapshot = await usersRef.getDocuments();
    setState(() {
      uId = snapshot.documents.map((doc) => User.fromDocument(doc)).toList();
      print(uId.length);
    });
  }
  setPosts() async{
    await getUserIds();
    for(var i=0;i<uId.length;i++){
      await getPosts(uId[i].id);
    }
  }

  getPosts(String i) async {
    /*setState(() {
      isLoading = true;
    });*/
    QuerySnapshot snapshot = await postsRef.document(i).collection('userPosts')
        .getDocuments();
    setState(() {
      print(snapshot);
      posts = snapshot.documents.map((doc) => Post.fromDocument(doc)).toList();
      postsDisp = postsDisp + posts;
      print(postsDisp);
    });
  }
  
  @override
  Widget build(context) {
    return Scaffold(
      appBar: header(context, isAppTitle: true),
      body: ListView(
        children: [
          Column(children: postsDisp,)
        ],
      ),
    );
  }
  
}
