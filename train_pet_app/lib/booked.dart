import 'package:flutter/material.dart';
import 'package:train_pet_app/all_booked.dart';
import 'package:train_pet_app/class_veterinary.dart';
import 'package:train_pet_app/days.dart';

class BookedPage extends StatelessWidget{
  final Veterinary docClinic;
  final DateTime selectedDate;
  const BookedPage({super.key,required this.docClinic,required this.selectedDate});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.lightBlue,Color.fromARGB(255, 68, 68, 255),Color.fromARGB(255, 33, 51, 243),Color.fromARGB(255, 36, 30, 215)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(Icons.check_circle_outline,color: Colors.white,size: 150,),
              Wrap(
                direction: Axis.vertical,
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 25,
                children: [
                  const Text("Your appointment\nhas been booked", textAlign: TextAlign.center, style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 23),),
                  Text("${docClinic.name} will be waiting\nfor you and your pet",textAlign: TextAlign.center,style: const TextStyle(color:Colors.white),),
                  Container(
                    width: 180,
                    height: 35,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 6, 66, 116),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                      const Icon(Icons.schedule_outlined,color: Color.fromARGB(160, 131, 143, 181),),
                      Text("${getWeekdayAbbreviation(selectedDate)} ${selectedDate.day} ${selectedDate.month} at 10:30am",style: const TextStyle(color:Colors.white),)
                    ]),
                  )
                ]),
              ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: const BorderSide(color: Colors.white)
                    )
                  )
                ),
                onPressed: (){
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: ((context) => AllBooked(docClinicToAdd: docClinic,))), (route) => route.isFirst);
                }, 
                child: const Text("Go to my appointments")
                )
            ],
          ),
        ),
      ),
    );
  }

}