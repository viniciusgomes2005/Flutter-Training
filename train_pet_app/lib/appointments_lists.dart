import "package:cloud_firestore/cloud_firestore.dart";
import "package:flutter/material.dart";
import "package:train_pet_app/class_appointment.dart";
// ignore: must_be_immutable
class AppointmentList extends StatefulWidget{
  final String listName;
  const AppointmentList({super.key,required this.listName});

  @override
  State<AppointmentList> createState() => _AppointmentListState();
}

class _AppointmentListState extends State<AppointmentList> {
  List<Appointment> futureAppointments=[];

  List<Appointment> pastAppointments = [];

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  void initState(){
    super.initState();
    refresh();
  }
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: List.generate(widget.listName=="future"? futureAppointments.length:pastAppointments.length, (index) {
        Appointment model =widget.listName=="future"? futureAppointments[index]:pastAppointments[index];
        return Container(
          width: 300,
          height: 100,
          decoration: const BoxDecoration(
            color: Colors.purple,
          ),
          child: Text(model.veterinary.name),
        );
      }),
    );
  }

  refresh() async {
    List<Appointment> pastList=[]; 
    List<Appointment> futureList=[];
    QuerySnapshot<Map<String,dynamic>> snapshotFuture = await firestore.collection("listins").doc('IRcVNxjgXcHx02FCH4Oh').collection("FutureAppointments").get();
    QuerySnapshot<Map<String,dynamic>> snapshotPast = await firestore.collection("listins").doc('IRcVNxjgXcHx02FCH4Oh').collection("PastAppointments").get();
    for(var doc in snapshotPast.docs){
      pastList.add(Appointment.fromMap(doc.data()));
    }
    for(var doc in snapshotFuture.docs){
      futureList.add(Appointment.fromMap(doc.data()));
    }
    setState(() {
      pastAppointments=pastList;
      futureAppointments=futureList;
    });
  }
}