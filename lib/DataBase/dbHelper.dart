import 'package:cloud_firestore/cloud_firestore.dart';
import '../Models/Model.dart';

void addPlanetToDb(Planet planet) async{

  await FirebaseFirestore.instance.collection('Planets').add({
    'position': planet.position,
    'name': planet.name,
    'iconImage': planet.iconImage,
    'description': planet.description,
    'images': planet.images
  });
}

List<Planet> SnapshotToList(QuerySnapshot snapshot){
  List<Planet> planetsList=[];
  for(var doc in snapshot.docs){
    planetsList.add(
      Planet(
        doc.get('position'),
        name: doc.get('name'),
        iconImage: doc.get('iconImage'),
        description: doc.get('description'),
        images: doc.get('images')
        )
    );
  }
  return planetsList;
}




Stream<QuerySnapshot> get DBPlants {
  return FirebaseFirestore.instance.collection('Planets').orderBy('position').snapshots();
}