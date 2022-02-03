import 'dart:math';

import 'package:flutter/material.dart';
import 'package:patterns_setstate/model/post_model.dart';
import 'package:patterns_setstate/pages/home_page.dart';
import 'package:patterns_setstate/services/http_service.dart';

class Post_add_page extends StatefulWidget {
  const Post_add_page({Key key}) : super(key: key);
  static const String id="Post_add_page";

  @override
  _Post_add_pageState createState() => _Post_add_pageState();
}

class _Post_add_pageState extends State<Post_add_page> {
  bool isLoading = false;
  final TextEditingController _titleTextEditingController = TextEditingController();
  final TextEditingController _bodyTextEditingController = TextEditingController();

  _apiPostCreate()  async {
    setState(() {
      isLoading = true;
    });

    Post post = Post(title: _titleTextEditingController.text, body: _bodyTextEditingController.text, userId: Random().nextInt(pow(2, 30) - 1));

    var response = await Network.POST(Network.API_CREATE, Network.paramsCreate(post));

    setState(() {
      if (response != null) {
        Navigator.pushNamedAndRemoveUntil(context, Home_page.id, (route) => false);
      }
      isLoading = false;
    });
    print(response);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Post',style: TextStyle(color: Colors.white,fontSize: 20),),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Title",style: TextStyle(color: Colors.grey,fontSize: 20),),
                  const SizedBox(height: 10,),
                  // #title
                  Container(
                    height: 70,
                    width: double.infinity,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey,
                    ),
                    child: TextField(
                      maxLines: 50,
                      controller: _titleTextEditingController,
                      style: const TextStyle(color:Colors.white,fontSize: 20),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20,),
                  const Text("Content",style: TextStyle(color: Colors.grey,fontSize: 20),),
                  const SizedBox(height: 10,),
                  // #content
                  Container(
                    height: 300,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey,
                    ),
                    child: TextField(
                      controller: _bodyTextEditingController,
                      style: const TextStyle(color:Colors.white,fontSize: 18),
                      maxLines: 300,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  FlatButton(
                    onPressed: (){_apiPostCreate();},
                    color: Colors.blue,
                    minWidth: double.infinity,
                    height: 45,
                    child: const Text("Add",style: TextStyle(color: Colors.white,fontSize: 18),),
                  ),
                ],
              ),
            ),
          ),

          isLoading ? const Center(child: CircularProgressIndicator(),) : const SizedBox.shrink(),
        ],
      ),
    );
  }
}