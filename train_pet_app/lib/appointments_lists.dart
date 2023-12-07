import "package:cloud_firestore/cloud_firestore.dart";
import "package:flutter/material.dart";
// ignore: must_be_immutable
class AppointmentList extends StatelessWidget{
  const AppointmentList({super.key});
  @override
  Widget build(BuildContext context) {
    Future<List<List<Map<String, dynamic>>>> list=getDataFromFirestore();
    return ListView.custom(
      childrenDelegate: 
        SliverChildBuilderDelegate(
          (context, index) {
            return Container(
              child: Center(
                child: Text(),
              ),
            );
          },
          )
      );
  }
}
Future<List<List<Map<String, dynamic>>>> getDataFromFirestore() async {
  // Substitua 'suaColecao' pelo nome da sua coleção no Firestore
  QuerySnapshot<Map<String, dynamic>> querySnapshotFuture =
      await FirebaseFirestore.instance.collection('listins').doc('IRcVNxjgXcHx02FCH4Oh').collection('FutureAppointments').get();

  List<Map<String, dynamic>> futuredataList = [];

  for (QueryDocumentSnapshot<Map<String, dynamic>> documentSnapshot
      in querySnapshotFuture.docs) {
    Map<String, dynamic> data = documentSnapshot.data();
    futuredataList.add(data);
  }
  QuerySnapshot<Map<String, dynamic>> querySnapshotPast =
      await FirebaseFirestore.instance.collection('listins').doc('IRcVNxjgXcHx02FCH4Oh').collection('PastAppointments').get();

  List<Map<String, dynamic>> pastdataList = [];

  for (QueryDocumentSnapshot<Map<String, dynamic>> documentSnapshot
      in querySnapshotPast.docs) {
    Map<String, dynamic> data = documentSnapshot.data();
    pastdataList.add(data);
  }
  return [futuredataList,pastdataList];
}