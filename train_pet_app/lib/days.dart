List<DateTime> dayList (){
  List<DateTime> x=[];
  for (int i=-2;i<=2;i++){
    x.add(DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day+i));
  }
  return x;
}
String getWeekdayAbbreviation(DateTime date) {
  final weekdays = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
  final weekdayIndex = date.weekday - 1;
  return weekdays[weekdayIndex];
}