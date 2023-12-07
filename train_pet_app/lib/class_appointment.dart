import 'package:train_pet_app/class_veterinary.dart';

class Appointment{
  final Veterinary veterinary;
  final DateTime dateTime;
  const Appointment({required this.veterinary, required this.dateTime});
}