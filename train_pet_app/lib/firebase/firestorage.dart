import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:train_pet_app/class_appointment.dart';
 

void addAppointment(Appointment appointment)async{
  final DocumentReference document = FirebaseFirestore.instance.collection('listins').doc('IRcVNxjgXcHx02FCH4Oh'); 
  final CollectionReference collection =document.collection('FutureAppointments');
  try{
    Map<String,dynamic> dados = {
      'dateTime':appointment.dateTime,
      'name':appointment.veterinary.name,
      'specialization':appointment.veterinary.specialization,
      'price':appointment.veterinary.price,
      'evaluation':appointment.veterinary.evaluation,
      'experience':appointment.veterinary.experience,
      'distance':appointment.veterinary.distance
    };
    await collection.add(dados);
  }catch(e){
    null;
  }
}
void updateList(Appointment appointment)async{
  final DocumentReference documentFuture = FirebaseFirestore.instance.collection('listins').doc('IRcVNxjgXcHx02FCH4Oh'); 
  final CollectionReference collectionFuture =documentFuture.collection('FutureAppointments');
  final DocumentReference documentPast = FirebaseFirestore.instance.collection('listins').doc('IRcVNxjgXcHx02FCH4Oh'); 
  final CollectionReference collectionPast =documentPast.collection('PastAppointments');
  collectionFuture.get().then(
    (querySnapshot){
      for(var docSnapshot in querySnapshot.docs){
        var data = docSnapshot.data() as Map<String,dynamic>;
        if(data.containsKey('dateTime')&&data['dateTime'] is Timestamp){
          DateTime firestoreDate = (data["dateTime"] as Timestamp).toDate();
          DateTime actualDate = DateTime.now();
          if(firestoreDate.isBefore(actualDate)){
            collectionPast.add(docSnapshot);
            collectionFuture.doc(docSnapshot.id).delete();
          }
        }
      }
    }
  );
}