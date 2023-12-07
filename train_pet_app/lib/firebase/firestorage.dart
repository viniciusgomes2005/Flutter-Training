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