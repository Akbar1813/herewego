import 'package:flutter/material.dart';
import 'package:herewego/services/pref_service.dart';
import 'package:herewego/services/rtdb_service.dart';

import '../models/post_model.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);
  static final String Id = 'detail_page';
  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  var dateController = TextEditingController();
  var contentController = TextEditingController();
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  _addPost() async {
    String date = dateController.text.toString();
    String content = contentController.text.toString();
    String fName = firstNameController.text.toString();
    String lName = lastNameController.text.toString();
    _apiAddPost(fName, lName,date,content);
  }
  _apiAddPost(String fName,String lName,String date, String content) async{
    var id = await Prefs.loadUserId();
    RTDBService.addPost(Post(id,fName,lName,content,date)).then((response) => {
      _respAddPost(),
    });
  }
  _respAddPost () {
    Navigator.of(context).pop({'data': 'done'});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Post'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(30),
          child: Column(
            children: [
              SizedBox(height: 15,),
              TextField(
                controller: firstNameController,
                decoration: InputDecoration(
                  hintText: 'First Name',
                ),
              ),
              SizedBox(height: 15,),
              TextField(
                controller: lastNameController,
                decoration: InputDecoration(
                  hintText: 'Last Name',
                ),
              ),
              SizedBox(height: 15,),
              TextField(
                controller: dateController,
                decoration: InputDecoration(
                  hintText: 'Date',
                ),
              ),
              SizedBox(height: 15,),
              TextField(
                controller: contentController,
                decoration: InputDecoration(
                  hintText: 'Content',
                ),
              ),
              SizedBox(height: 15,),
              Container(
                width: double.infinity,
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextButton(
                  child: Text('Add Post',style: TextStyle(color: Colors.white),),
                  onPressed: _addPost,
                ),
              )
            ],
          )
        ),
      ),
    );
  }
}
