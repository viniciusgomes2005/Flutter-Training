import 'package:flutter/material.dart';
import 'package:pet_app/doc_clinic.dart';
import 'package:pet_app/veterinary.dart';
import 'class_veterinary.dart';
class Clinics extends StatefulWidget{
  const Clinics({Key? key}) :super(key: key);
  @override
  State<Clinics> createState() => _SpecialistsState();
}

class _SpecialistsState extends State<Clinics> {
  final controller=TextEditingController();
  List<Veterinary>clinicList=allClinics;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 95,
        iconTheme: const IconThemeData(color: Colors.purple),
        centerTitle: true,
        title: Wrap(
          direction: Axis.vertical,
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 15,
          children: [
            Wrap(
                spacing: 10,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFf9f8fd),
                      shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)
                              )
                    ),
                    onPressed:() {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context) => const Specialists())));
                  }, 
                    child: const Text("Specialists",style: TextStyle(color: Colors.black))),
                  
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:  Colors.purple,
                      shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)
                              )
                    ),
                    onPressed:() {
                    
                  },
                  child: const Text("Clinics"))]),
            SizedBox(
              width: 200,
              height: 32,
              child: TextField(
                style: const TextStyle(fontSize: 15),
                controller:controller,
                onChanged:searchDoc,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                  hintText: "What are you looking for?"
                ),
              ),
            )
          ],
        ),
        actions:[
          Align(
            alignment: Alignment.topRight,
            child: Row(children: [
                        IconButton(onPressed: (){}, icon: const Icon(Icons.place_outlined)),
                        const Text("Map",style: TextStyle(color: Colors.purple),)
                      ],),
          )
        ],
        leading: const Align(
          alignment: Alignment.topLeft,
          child: BackButton(),
        ),
      ),
      backgroundColor: const Color(0xFFf9f8fd),
      body: ListView.builder(
        padding:EdgeInsets.only(left: MediaQuery.of(context).size.width*0.5-100),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: clinicList.length,
        itemBuilder: (BuildContext context,int index){
          final item = clinicList[index];
          return ListTile(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: ((context) =>  DocClinic(docClinic:item))));
              },
              shape:ContinuousRectangleBorder(borderRadius: BorderRadius.circular(10)) ,
              leading: const Icon(Icons.house_outlined,size: 60,),
              subtitle: Wrap(
                spacing: 5,
                direction: Axis.vertical,
                children: [
                  Text(item.specialization),
                  Row(children: [
                    Icon(
                      Icons.star,
                      size: 15,
                      color: (item.evaluation>=1)?const Color.fromARGB(255, 255, 221, 0):const Color.fromARGB(255, 236, 228, 163),
                    ),
                    Icon(
                      Icons.star,
                      size: 15,
                      color: (item.evaluation>=2)?const Color.fromARGB(255, 255, 221, 0):const Color.fromARGB(255, 236, 228, 163),
                    ),
                    Icon(
                      Icons.star,
                      size: 15,
                      color: (item.evaluation>=3)?const Color.fromARGB(255, 255, 221, 0):const Color.fromARGB(255, 236, 228, 163),
                    ),
                    Icon(
                      Icons.star,
                      size: 15,
                      color: (item.evaluation>=4)?const Color.fromARGB(255, 255, 221, 0):const Color.fromARGB(255, 236, 228, 163),
                    ),
                    Icon(
                      Icons.star,
                      size: 15,
                      color: (item.evaluation>=5)?const Color.fromARGB(255, 255, 221, 0):const Color.fromARGB(255, 236, 228, 163),
                    ),
                  ],
                  ),
                  Wrap(
                    spacing: 10,
                    children: [
                    Row(
                      children: [
                        const Icon(Icons.place_outlined),
                        Text("${item.distance} km")
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.credit_card),
                        Text("\$${item.price}")
                      ],
                    )
                  ],)
                ],
              ),
              title: Text(item.name),
            );
        }
        ),
      bottomNavigationBar:SizedBox(
          height: 60,
          child: BottomAppBar(
            color:const Color(0xFFf9f8fd),
            shadowColor: Colors.black26,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () {
                        
                      },
                    ),
                    const Text("Search")
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.schedule),
                      onPressed: () {
                        
                      },
                    ),
                    const Text("Schedule")
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.explore_outlined),
                      onPressed: () {
                        
                      },
                    ),
                    const Text("Explore")
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.person_outline),
                      onPressed: () {
                        
                      },
                    ),
                    const Text("Profile")
                  ],
                ),
              ],
              )
            ),
        ), 
    );
  }
  void searchDoc(String textInput){
    final suggestions = allClinics.where((veterinary){
        final input=textInput.toLowerCase();
        final name=veterinary.name.toLowerCase();
        final specialization=veterinary.specialization.toLowerCase();
        final distance=veterinary.distance.toString().toLowerCase();
        final evaluation=veterinary.evaluation.toString().toLowerCase();
        final price=veterinary.price.toString().toLowerCase();
        final finalProperties="$name $specialization $distance $evaluation $price";
        return finalProperties.contains(input);
    }).toList();
    setState(()=>clinicList=suggestions);
  }
}
