class Veterinary {
  final String name;
  final String specialization;
  final double distance;
  final double price;
  final double evaluation;
  final int experience;
  const Veterinary({required this.name, required this.specialization, required this.distance, required this.price, required this.evaluation, required this.experience});
}
const List<Veterinary> allVeterinaries = [
  Veterinary(name: "Dr. Smith", specialization: "Small Animals", distance: 5, price: 50, evaluation: 4.5, experience: 10),
  Veterinary(name: "Dr. Johnson", specialization: "Equine Care", distance: 15, price: 75, evaluation: 4.8, experience: 12),
  Veterinary(name: "Dr. Martinez", specialization: "Exotic Pets", distance: 8, price: 60, evaluation: 2.2, experience: 8),
  Veterinary(name: "Dr. Anderson", specialization: "Dental Health", distance: 3, price: 40, evaluation: 4.7, experience: 9),
  Veterinary(name: "Dr. White", specialization: "Avian Medicine", distance: 10, price: 55, evaluation: 4.4, experience: 11),
  Veterinary(name: "Dr. Lee", specialization: "Large Animals", distance: 20, price: 80, evaluation: 3.0, experience: 15),
  Veterinary(name: "Dr. Harris", specialization: "Emergency Care", distance: 2, price: 70, evaluation: 4.6, experience: 13),
  Veterinary(name: "Dr. Taylor", specialization: "Reptiles", distance: 6, price: 45, evaluation: 4.3, experience: 7),
  Veterinary(name: "Dr. Clark", specialization: "Orthopedics", distance: 12, price: 65, evaluation: 4.9, experience: 14),
  Veterinary(name: "Dr. Wilson", specialization: "Feline Medicine", distance: 4, price: 55, evaluation: 5, experience: 10),
  Veterinary(name: "Dr. Hall", specialization: "Animal Behavior", distance: 18, price: 70, evaluation: 5, experience: 12),
  Veterinary(name: "Dr. Brown", specialization: "Oncology", distance: 7, price: 75, evaluation: 4.4, experience: 11),
  Veterinary(name: "Dr. Adams", specialization: "Geriatrics", distance: 13, price: 60, evaluation: 4.8, experience: 9),
  Veterinary(name: "Dr. Miller", specialization: "Dermatology", distance: 9, price: 50, evaluation: 4.7, experience: 8),
  Veterinary(name: "Dr. Thomas", specialization: "Neurology", distance: 14, price: 65, evaluation: 4.3, experience: 10),
  Veterinary(name: "Dr. Moore", specialization: "Avian Medicine", distance: 11, price: 55, evaluation: 4.6, experience: 13),
  Veterinary(name: "Dr. King", specialization: "Equine Care", distance: 16, price: 80, evaluation: 4.9, experience: 14),
  Veterinary(name: "Dr. Parker", specialization: "Exotic Pets", distance: 5, price: 45, evaluation: 4.2, experience: 7),
  Veterinary(name: "Dr. Green", specialization: "Small Animals", distance: 19, price: 70, evaluation: 4.0, experience: 15),
  Veterinary(name: "Dr. Walker", specialization: "Large Animals", distance: 8, price: 40, evaluation: 4.5, experience: 12)
];
const List<Veterinary> allClinics = [
  Veterinary(name: "Veterinária Pata Feliz", specialization: "Small Animals", distance: 5, price: 50, evaluation: 4.5, experience: 10),
  Veterinary(name: "Clínica Equina Estrela", specialization: "Equine Care", distance: 15, price: 75, evaluation: 4.8, experience: 12),
  Veterinary(name: "Exotic Pets & More", specialization: "Exotic Pets", distance: 8, price: 60, evaluation: 2.2, experience: 8),
  Veterinary(name: "Anderson Dental Vets", specialization: "Dental Health", distance: 3, price: 40, evaluation: 4.7, experience: 9),
  Veterinary(name: "Avian Care Center", specialization: "Avian Medicine", distance: 10, price: 55, evaluation: 4.4, experience: 11),
  Veterinary(name: "Large Animal Experts", specialization: "Large Animals", distance: 20, price: 80, evaluation: 3.0, experience: 15),
  Veterinary(name: "Emergency Vet Clinic", specialization: "Emergency Care", distance: 2, price: 70, evaluation: 4.6, experience: 13),
  Veterinary(name: "Reptile Haven", specialization: "Reptiles", distance: 6, price: 45, evaluation: 4.3, experience: 7),
  Veterinary(name: "Orthopedic Pet Care", specialization: "Orthopedics", distance: 12, price: 65, evaluation: 4.9, experience: 14),
  Veterinary(name: "Feline Health Center", specialization: "Feline Medicine", distance: 4, price: 55, evaluation: 5, experience: 10),
  Veterinary(name: "Animal Behavior Clinic", specialization: "Animal Behavior", distance: 18, price: 70, evaluation: 5, experience: 12),
  Veterinary(name: "Oncology Pet Care", specialization: "Oncology", distance: 7, price: 75, evaluation: 4.4, experience: 11),
  Veterinary(name: "Geriatric Vet Services", specialization: "Geriatrics", distance: 13, price: 60, evaluation: 4.8, experience: 9),
  Veterinary(name: "Dermatology Pet Clinic", specialization: "Dermatology", distance: 9, price: 50, evaluation: 4.7, experience: 8),
  Veterinary(name: "Neurology Animal Clinic", specialization: "Neurology", distance: 14, price: 65, evaluation: 4.3, experience: 10),
  Veterinary(name: "Avian Health Center", specialization: "Avian Medicine", distance: 11, price: 55, evaluation: 4.6, experience: 13),
  Veterinary(name: "Equine Care Clinic", specialization: "Equine Care", distance: 16, price: 80, evaluation: 4.9, experience: 14),
  Veterinary(name: "Paws & Claws Veterinary", specialization: "Exotic Pets", distance: 5, price: 45, evaluation: 4.2, experience: 7),
  Veterinary(name: "Happy Tails Vet Clinic", specialization: "Small Animals", distance: 19, price: 70, evaluation: 4.0, experience: 15),
  Veterinary(name: "Countryside Animal Hospital", specialization: "Large Animals", distance: 8, price: 40, evaluation: 4.5, experience: 12)
];
