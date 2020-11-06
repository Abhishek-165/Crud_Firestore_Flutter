# Crud Firestore Flutter

# ScreenShot

<img src="https://github.com/Abhishek-165/Crud_Firestore_Flutter/blob/master/images/CrudFirestore.jpeg" height="400" width="250">

# Description 

In the application, we are adding, fetching, update and delete with firebase firestore

## Adding


    Map<String,dynamic> mapData ={"Name":"Anonymous"};
    CollectionReference collectionReference = FirebaseFirestore.instance.collection('data');
    collectionReference.add(mapData);
  

 ## Fetching
 
    CollectionReference collectionReference = FirebaseFirestore.instance.collection('data');
    collectionReference.snapshots().listen((event) {
     setState(() {
     datas= event.docs[0].data();
     print(datas);
     });
     });
 
## Updating

    CollectionReference collectionReference = FirebaseFirestore.instance.collection('data');
    QuerySnapshot querySnapshot = await collectionReference.get();
    querySnapshot.docs.reference.update({"Name":"Abhishek"});
  
 ## Deleting
    CollectionReference collectionReference = FirebaseFirestore.instance.collection('data');
    QuerySnapshot querySnapshot = await collectionReference.get();
    querySnapshot.docs.reference.delete();
  
