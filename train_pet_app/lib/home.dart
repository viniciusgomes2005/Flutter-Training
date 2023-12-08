import 'package:flutter/material.dart';
import 'package:train_pet_app/all_booked.dart';
import 'package:train_pet_app/firebase/firestorage.dart';
import 'veterinary.dart';
class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: "HomeApp",
      home: Scaffold(
        backgroundColor:const Color(0xFFf9f8fd),
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Pet-Care",style: TextStyle(fontSize: 35,color: Colors.black,fontWeight: FontWeight.w900),),
          backgroundColor:const Color(0xFFf9f8fd),
          shadowColor: const Color.fromARGB(31, 135, 134, 134),
          actions:<Widget> [
            IconButton(
              onPressed: (){}, 
              icon: const Icon(Icons.search))
          ],
        ),
        bottomNavigationBar:  SizedBox(
          height: 100,
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
                        updateAppointments();
                        Navigator.push(context,MaterialPageRoute(builder: ((context) => AllBooked())));
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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [Center(child: RichText(
            text: const TextSpan(
              text: "What are you\nlooking for, ",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color: Colors.black),
              children: <TextSpan>[
                TextSpan(text: "Maria?",style: TextStyle(color: Colors.amber))
              ]
              ),
            )
          ),
            Center(
              child: Wrap(
                direction: Axis.vertical,
                spacing: 10,
                children: [
                  Wrap(
                    spacing: 10,
                    children: [
                      SizedBox(
                        width: 80,
                        height: 80,
                        child: ElevatedButton(
                            style:  ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                              )
                            ),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: ((context) => const Specialists())));
                            },
                            child: const Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(
                                    Icons.healing,
                                    color: Colors.orange,
                                    size: 35,
                                  ),
                                  Text(
                                    "Veterinary",
                                    style: TextStyle(fontSize:10, color: Colors.black),
                                  )
                                ],
                              ),
                            ),
                      ),
                      SizedBox(
                        width: 80,
                        height: 80,
                        child: ElevatedButton(
                            style:  ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                              )
                            ),
                            onPressed: () {
                              
                            },
                            child: const Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(
                                    Icons.bathtub,
                                    color: Color.fromARGB(255, 3, 55, 97),
                                    size: 35,
                                  ),
                                  Text(
                                    "Grooming",
                                    style: TextStyle(fontSize:10, color: Colors.black),
                                  )
                                ],
                              ),
                            ),
                      ),
                      SizedBox(
                        width: 80,
                        height: 80,
                        child: ElevatedButton(
                            style:  ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                              )
                            ),
                            onPressed: () {
                              
                            },
                            child: const Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(
                                    Icons.bed,
                                    color: Colors.red,
                                    size: 35,
                                  ),
                                  Text(
                                    "Pet boarding",
                                    style: TextStyle(fontSize:10, color: Colors.black),
                                  )
                                ],
                              ),
                            ),
                      ),
                    ],
                  ),
                  Wrap(
                    spacing: 10,
                    children: [
                      SizedBox(
                        width: 80,
                        height: 80,
                        child: ElevatedButton(
                            style:  ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                              )
                            ),
                            onPressed: () {
                              
                            },
                            child: const Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(
                                    Icons.tapas,
                                    color: Colors.brown,
                                    size: 35,
                                  ),
                                  Text(
                                    "Food",
                                    style: TextStyle(fontSize:10, color: Colors.black),
                                  )
                                ],
                              ),
                            ),
                      ),
                      SizedBox(
                        width: 80,
                        height: 80,
                        child: ElevatedButton(
                            style:  ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                              )
                            ),
                            onPressed: () {
                              
                            },
                            child: const Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(
                                    Icons.toys,
                                    color: Colors.purple,
                                    size: 35,
                                  ),
                                  Text(
                                    "Toys",
                                    style: TextStyle(fontSize:10, color: Colors.black),
                                  )
                                ],
                              ),
                            ),
                      ),
                      SizedBox(
                        width: 80,
                        height: 80,
                        child: ElevatedButton(
                            style:  ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                              )
                            ),
                            onPressed: () {
                              
                            },
                            child: const Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(
                                    Icons.sports_baseball,
                                    color: Colors.blue,
                                    size: 35,
                                  ),
                                  Text(
                                    "Training",
                                    style: TextStyle(fontSize:10, color: Colors.black),
                                  )
                                ],
                              ),
                            ),
                      ),
                    ],
                  ),
                  Wrap(
                    spacing: 10,
                    children: [
                      SizedBox(
                        width: 80,
                        height: 80,
                        child: ElevatedButton(
                            style:  ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                              )
                            ),
                            onPressed: () {
                              
                            },
                            child: const Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(
                                    Icons.local_taxi,
                                    color: Colors.yellow,
                                    size: 35,
                                  ),
                                  Text(
                                    "Pet Taxi",
                                    style: TextStyle(fontSize:10, color: Colors.black),
                                  )
                                ],
                              ),
                            ),
                      ),
                      SizedBox(
                        width: 80,
                        height: 80,
                        child: ElevatedButton(
                            style:  ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                              )
                            ),
                            onPressed: () {
                              
                            },
                            child: const Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(
                                    Icons.vaccines,
                                    color: Colors.green,
                                    size: 35,
                                  ),
                                  Text(
                                    "Vaccine",
                                    style: TextStyle(fontSize:10, color: Colors.black),
                                  )
                                ],
                              ),
                            ),
                      ),
                      SizedBox(
                        width: 80,
                        height: 80,
                        child: ElevatedButton(
                            style:  ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                              )
                            ),
                            onPressed: () {
                              
                            },
                            child: const Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(
                                    Icons.pets,
                                    color: Color.fromARGB(255, 228, 157, 181),
                                    size: 35,
                                  ),
                                  Text(
                                    "Other",
                                    style: TextStyle(fontSize:10, color: Colors.black),
                                  )
                                ],
                              ),
                            ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}