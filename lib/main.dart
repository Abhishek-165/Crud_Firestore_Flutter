import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(debugShowCheckedModeBanner: false,
  home: MyApp(),));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

 Map datas;
  _add() async{
    Map<String,dynamic> mapData ={"Name":"Anonymous"};
    CollectionReference collectionReference = FirebaseFirestore.instance.collection('data');
    collectionReference.add(mapData);
  }

  _fetch() async{
    CollectionReference collectionReference = FirebaseFirestore.instance.collection('data');
    collectionReference.snapshots().listen((event) {
     setState(() {
     datas= event.docs[0].data();
     print(datas);
     });
  });
  }
  _update() async{
    CollectionReference collectionReference = FirebaseFirestore.instance.collection('data');
    QuerySnapshot querySnapshot = await collectionReference.get();
    querySnapshot.docs[0].reference.update({"Name":"Anand"});
  }
  _delete() async{
    CollectionReference collectionReference = FirebaseFirestore.instance.collection('data');
    QuerySnapshot querySnapshot = await collectionReference.get();
    querySnapshot.docs[0].reference.delete();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: RaisedButton(onPressed: _add,child: Text("Add",style: TextStyle(color: Colors.white),),color: Colors.blue,)),
          Expanded(child: RaisedButton(onPressed: _fetch,child: Text("Fetch",style: TextStyle(color: Colors.white)),color: Colors.red,)),
          Expanded(child: RaisedButton(onPressed: _update,child: Text("Update",style: TextStyle(color: Colors.white)),color: Colors.pink,)),
          Expanded(child: RaisedButton(onPressed: _delete,child: Text("Delete",style: TextStyle(color: Colors.white)),color: Colors.green,)),
        Expanded(child: Center(child: Text(datas.toString())))
        ],
      ),
    );
  }
}