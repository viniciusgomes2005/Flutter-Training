import "package:flutter/material.dart";
import "package:train_pet_app/appointments_lists.dart";
// ignore: must_be_immutable
class AllBooked extends StatefulWidget{
  const AllBooked({super.key,});
  @override
  State<StatefulWidget> createState()=> _AllBookedState();
}
class _AllBookedState extends State<AllBooked>{
  String listName="future";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          backgroundColor: listName=="future"?Colors.purple:const Color(0xFFf9f8fd),
                          shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)
                                  )
                        ),
                        onPressed:() {
                          setState(() {
                            listName="future";
                          });
                      }, 
                        child: Text("Upcoming",style: TextStyle(color: listName=="future"?Colors.white:Colors.black),)),
                      
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:  listName=="future"?const Color(0xFFf9f8fd):Colors.purple,
                          shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)
                                  )
                        ),
                        onPressed:() {
                          setState(() {
                            listName="past";
                          });
                      },
                      child: Text("Past",style: TextStyle(color:listName=="future"? Colors.black:Colors.white),),)]),
              ],
            ),
            ),
            body: AppointmentList(listName: listName),
          );
  }

}