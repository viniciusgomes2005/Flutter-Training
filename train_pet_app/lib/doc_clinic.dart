import 'package:flutter/material.dart';
import 'package:train_pet_app/booked.dart';
import 'class_veterinary.dart';
import 'days.dart';

class DocClinic extends StatefulWidget{
  final Veterinary docClinic;
  const DocClinic({super.key, required this.docClinic});

  @override
  State<DocClinic> createState() => _DocClinicState();
}

class _DocClinicState extends State<DocClinic> {
  bool isVisible=false;
  DateTime actualDateSelected=DateTime.now();
  double textWidth=0;
  @override
    void initState() {
    super.initState();
    calculateTextWidth();
  }

  Future<void> calculateTextWidth() async {
    final text = "Booking confirmation: ${actualDateSelected.day}/${actualDateSelected.month}";
    // ignore: prefer_const_declarations
    final textStyle = const TextStyle(fontSize: 15);
    final textSpan = TextSpan(text: text, style: textStyle);
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );

    textPainter.layout();

    setState(() {
      textWidth = textPainter.width;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf9f8fd),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.of(context).size.height*0.2),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.purple),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 10,top: 10),
              child: Wrap(
                spacing: 10,
                children: [
                  Icon(Icons.share_outlined, color: Colors.purple,),
                  Icon(Icons.favorite_border_outlined, color: Colors.purple,)
                ],
              ),
            )
          ],
          flexibleSpace:Center(
            child: Icon(Icons.person_outline, size: MediaQuery.of(context).size.height*0.2),
          ),
        ),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Wrap(
          spacing: 30,
          direction:Axis.vertical ,
          children: [
            Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white,),
              width: 250,
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(widget.docClinic.name),
                      Text(widget.docClinic.specialization),
                      Wrap(
                        spacing: 10,
                        children: [
                        Row(
                          children: [
                            const Icon(Icons.place_outlined),
                            Text("${widget.docClinic.distance} km")
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(Icons.credit_card),
                            Text("\$${widget.docClinic.price}")
                          ],
                        )
                      ],)
                    ],
                  ),
                  Container(
                    width: 50,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color:const Color.fromARGB(255, 8, 77, 197),border: Border.all(width: 3,color: const Color.fromARGB(255, 8, 77, 197))),
                    height: 50,
                    child: Center(child: Text(widget.docClinic.evaluation.toString(),style: const TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),)),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(200, 80),
                backgroundColor:MaterialStateColor.resolveWith((states){
                  if(states.contains(MaterialState.pressed)){
                    return Colors.blue;
                  }else{
                    return Colors.white;
                  }
                })
              ),
              onPressed: ()async{
                DateTime? selectedDate=await showDatePicker(context: context, initialDate: DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day), firstDate: DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day-2), lastDate: DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day+2));
                if (selectedDate==null){
                  return;
                }
                setState(() {
                  actualDateSelected=selectedDate;
                });
            }, child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text("Selecione a data da consulta:", style: TextStyle(color: Colors.black,fontSize: 12),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                  Container(
                    width: 30,
                    height: 30,
                    decoration: const BoxDecoration(shape: BoxShape.circle,color: Colors.purple),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(getWeekdayAbbreviation(DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day-2)),style: const TextStyle(fontSize: 8),),
                        Text("${DateTime.now().day-2}",style: const TextStyle(fontSize: 13,fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),Container(
                    width: 30,
                    height: 30,
                    decoration: const BoxDecoration(shape: BoxShape.circle,color: Colors.purple),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(getWeekdayAbbreviation(DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day-1)),style: const TextStyle(fontSize: 8),),
                        Text("${DateTime.now().day-1}",style: const TextStyle(fontSize: 13,fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),Container(
                    width: 30,
                    height: 30,
                    decoration: const BoxDecoration(shape: BoxShape.circle,color: Colors.purple),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(getWeekdayAbbreviation(DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day)),style: const TextStyle(fontSize: 8),),
                        Text("${DateTime.now().day}",style: const TextStyle(fontSize: 13,fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),Container(
                    width: 30,
                    height: 30,
                    decoration: const BoxDecoration(shape: BoxShape.circle,color: Colors.purple),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(getWeekdayAbbreviation(DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day+1)),style: const TextStyle(fontSize: 8),),
                        Text("${DateTime.now().day+1}",style: const TextStyle(fontSize: 13,fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),Container(
                    width: 30,
                    height: 30,
                    decoration: const BoxDecoration(shape: BoxShape.circle,color: Colors.purple),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(getWeekdayAbbreviation(DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day+2)),style: const TextStyle(fontSize: 8),),
                        Text("${DateTime.now().day+2}",style: const TextStyle(fontSize: 13,fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                ],),
              ],
            ))
          ],
        )
        ),
      bottomNavigationBar: Stack(
        children: [
          Container(
            width:MediaQuery.of(context).size.width,
            color: Colors.white,
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(widget.docClinic.price.toString()),
                ElevatedButton(onPressed: (){
                  setState(() {
                    isVisible=true;
                  });
                }, child:const Text("Book"))
              ],
            ),
          ),
          Visibility(
            visible: isVisible,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 100,
              decoration: BoxDecoration(color:Colors.white,border: Border.all(color: const Color.fromARGB(0, 236, 233, 233)),borderRadius: const BorderRadius.only(topLeft:Radius.circular(20),topRight:Radius.circular(20))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(onPressed: (){
                      setState(() {
                        isVisible=false;
                      });
                    }, icon: const Icon(Icons.arrow_back, color: Colors.purple,size: 20,)),
                  ), Align(
                    alignment: Alignment.topCenter,
                    child: FutureBuilder<void>(
                      future: calculateTextWidth(),
                      builder:(context, snapshot) {
                        if (snapshot.connectionState==ConnectionState.done){
                          final horizontalMargin = (MediaQuery.of(context).size.width * 0.5) - (textWidth * 0.5)-40;
                          return Padding(
                            padding: EdgeInsets.only(left: horizontalMargin),
                              child: Text("Booking confirmation: ${actualDateSelected.day}/${actualDateSelected.month}",style: const TextStyle(fontSize: 15),overflow: TextOverflow.ellipsis,maxLines: 1,),
                            );
                        }else{
                          return Container();
                        }
                      },
                    ),
                  )
                  ]
                ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("\$${widget.docClinic.price} / first visit",style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      ElevatedButton(onPressed: (){
                        Navigator.push(context,MaterialPageRoute(builder: ((context) => BookedPage(docClinic: widget.docClinic,selectedDate: actualDateSelected,))));
                      }, child: const Text("Book"))
                    ],
                  )
                ],
              ),
            ))
        ],
      ),
    );
  }
}