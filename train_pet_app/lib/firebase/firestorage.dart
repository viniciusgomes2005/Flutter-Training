import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:train_pet_app/class_appointment.dart';
 

void addAppointment(Appointment appointment)async{
  final DocumentReference document = FirebaseFirestore.instance.collection('listins').doc('IRcVNxjgXcHx02FCH4Oh'); 
  final CollectionReference collection =document.collection('FutureAppointments');
  try{
    Map<String,dynamic> dados = appointment.toMap();
    await collection.add(dados);
  }catch(e){
    null;
  }
}
void updateAppointments() async {
  QuerySnapshot<Map<String, dynamic>> snapshotFuture =
      await FirebaseFirestore.instance
          .collection("listins")
          .doc('IRcVNxjgXcHx02FCH4Oh')
          .collection("FutureAppointments")
          .get();
  for (var doc in snapshotFuture.docs) {
    var appointment = Appointment.fromMap(doc.data() as Map<String, dynamic>);
    if (appointment.dateTime.isBefore(DateTime.now())) {
      FirebaseFirestore.instance
          .collection("listins")
          .doc('IRcVNxjgXcHx02FCH4Oh')
          .collection("PastAppointments")
          .add(appointment.toMap());
      FirebaseFirestore.instance
          .collection("listins")
          .doc('IRcVNxjgXcHx02FCH4Oh')
          .collection("FutureAppointments")
          .doc(doc.id)
          .delete();
    }
  }
}