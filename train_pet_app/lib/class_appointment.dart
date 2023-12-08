import 'package:train_pet_app/class_veterinary.dart';

class Appointment{
  Veterinary veterinary;
  DateTime dateTime;
  Appointment({required this.veterinary, required this.dateTime});
  Appointment.fromMap(Map<String,dynamic> map)
    :veterinary=Veterinary(name: map["name"], specialization: map["specialization"], distance: map["distance"], price: map["price"], evaluation: map["evaluation"], experience: map["experience"]),
    dateTime=map["dateTime"];
  Map<String,dynamic> toMap(){
    return{
      "name":veterinary.name,
      "specialization":veterinary.specialization,
      "price":veterinary.price,
      "distance":veterinary.distance,
      "evaluation":veterinary.evaluation,
      "experience":veterinary.experience,
      "dateTime":dateTime,
    };
  }

}