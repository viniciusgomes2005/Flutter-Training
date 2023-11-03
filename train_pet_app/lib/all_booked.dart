import "package:flutter/material.dart";
import "package:train_pet_app/class_veterinary.dart";

// ignore: must_be_immutable
class AllBooked extends StatefulWidget{
  final Veterinary? docClinicToAdd;
  AllBooked({super.key,this.docClinicToAdd});
  List<Veterinary> docClinicMap=[];
  void addingDocClinic(){
    if (docClinicToAdd!=null){
      docClinicMap.add(docClinicToAdd!);
    }
  }
  @override
  State<StatefulWidget> createState()=> _AllBookedState();
}
class _AllBookedState extends State<AllBooked>{
  bool isVisible=false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Wrap(
              direction: Axis.vertical,
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 15,
              children: [
                const Text("Appointments"),
                Wrap(
                    spacing: 10,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple,
                          shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)
                                  )
                        ),
                        onPressed:() {
                      }, 
                        child: const Text("Upcoming")),
                      
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:  const Color(0xFFf9f8fd),
                          shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)
                                  )
                        ),
                        onPressed:() {
                      },
                      child: const Text("Past",style: TextStyle(color: Colors.black),),)]),
              ],
            ),
            ),
          ),
      ],
    );
  }

}