import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterdemo/models/usercollection.dart';

class DatabaseSrvices{

  final String uid;

  DatabaseSrvices({this.uid});

  //collection reference
  final CollectionReference myCollection = Firestore.instance.collection('usercollection');

  Future updateUserData(String sugars, String name, int strength) async{
    return await myCollection.document(uid).setData({
      'sugars' : sugars,
      'name' : name,
      'strength' : strength,
    });
  }

  //user brew list from snapshaot
  List<UserCollection> _userCollectionListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc){
      return UserCollection(
        name: doc.data['name'] ?? '',
        strength: doc.data['strength'] ?? 0,
        sugars: doc.data['sugars'] ?? '0'
      );
    }).toList();
  }

  //get user stream
  Stream<List<UserCollection>> get usercollection {
    return myCollection.snapshots()
      .map(_userCollectionListFromSnapshot);
  } 
}