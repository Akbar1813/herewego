import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:herewego/models/post_model.dart';
import 'package:herewego/pages/detail_page.dart';
import 'package:herewego/services/auth_service.dart';
import 'package:herewego/services/pref_service.dart';
import 'package:herewego/services/rtdb_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static final String Id = 'home_page';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List <Post> items = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _apiGetPost();
  }
  _openDetail() async{
    Map results = await Navigator.of(context).push(
        MaterialPageRoute(builder: (BuildContext context) {
      return DetailPage();
    }));
    if (results.containsKey("data")) {
      _apiGetPost();
    }
  }
  _apiGetPost() async{
    var id = await Prefs.loadUserId();
    RTDBService.getPost(id).then((posts) => {
      _respPosts(posts),
    });
  }
  _respPosts (List<Post> posts){
    setState(() {
      items = posts;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Posts',style: TextStyle(color: Colors.white),),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(CupertinoIcons.square_arrow_right,color: Colors.white,),
            onPressed: (){
              AuthService.signOutUser(context);
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (ctx, i){
          return itemOfList(items[i]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openDetail,
        child: Icon(CupertinoIcons.add),
        backgroundColor: Colors.deepOrange,
      ),
    );
  }
  Widget itemOfList(Post post){
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(post.firstName!, style: TextStyle(color: Colors.black,fontSize: 20),),
              SizedBox(width: 10,),
              Text(post.lastName!, style: TextStyle(color: Colors.black,fontSize: 20),),
            ],
          ),
          SizedBox(height: 10,),
          Text(post.date!, style: TextStyle(color: Colors.black,fontSize: 16),),
          SizedBox(height: 10,),
          Text(post.content!, style: TextStyle(color: Colors.black,fontSize: 14),),
        ],
      ),
    );
  }
}
