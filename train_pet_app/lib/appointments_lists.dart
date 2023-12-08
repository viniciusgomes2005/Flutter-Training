import "package:cloud_firestore/cloud_firestore.dart";
import "package:flutter/material.dart";
// ignore: must_be_immutable
class AppointmentList extends StatelessWidget{
  final String list;
  const AppointmentList({super.key, required this.list});
  @override
  Widget build(BuildContext context)  {
    
    return FutureBuilder(
      future: list=='future'? getFutureDataFromFirestore():getPastDataFromFirestore(),
      builder: (context,futureSnapshot){
        if (futureSnapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }else if (futureSnapshot.hasError){
          return Text(futureSnapshot.error.toString());
        }else{
          List<Map<String, dynamic>> dataList = futureSnapshot.data ?? [];

          return ListView.custom(
              childrenDelegate: 
                SliverChildBuilderDelegate(
                  childCount: dataList.length,
                  (context, index) {
                    return  Container(
                      decoration: const BoxDecoration(
                        color: Colors.amber
                      ),
                      child: Center(
                        child: Text(dataList[index].toString()),
                      ),
                    );
                  },
                  )
              );
        }
      }
    );
  }
}
Future<List<Map<String, dynamic>>> getFutureDataFromFirestore() async {
  // Substitua 'suaColecao' pelo nome da sua coleção no Firestore
  QuerySnapshot<Map<String, dynamic>> querySnapshotFuture =
      await FirebaseFirestore.instance.collection('listins').doc('IRcVNxjgXcHx02FCH4Oh').collection('FutureAppointments').get();

  List<Map<String, dynamic>> futuredataList = [];

  for (QueryDocumentSnapshot<Map<String, dynamic>> documentSnapshot
      in querySnapshotFuture.docs) {
    Map<String, dynamic> data = documentSnapshot.data();
    futuredataList.add(data);
  }
  
  return futuredataList;
}
Future<List<Map<String, dynamic>>> getPastDataFromFirestore() async {
  QuerySnapshot<Map<String, dynamic>> querySnapshotPast =
      await FirebaseFirestore.instance.collection('listins').doc('IRcVNxjgXcHx02FCH4Oh').collection('PastAppointments').get();

  List<Map<String, dynamic>> pastdataList = [];

  for (QueryDocumentSnapshot<Map<String, dynamic>> documentSnapshot
      in querySnapshotPast.docs) {
    Map<String, dynamic> data = documentSnapshot.data();
    pastdataList.add(data);
  }
  return pastdataList;
}
