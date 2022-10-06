//return todays date formated
String todaysDateFormatted() {
  var dateTimeObject = DateTime.now();
  String year = dateTimeObject.year.toString();

  String month = dateTimeObject.month.toString();

  if (month.length == 1) {
    month = '0$month';
  }

  String day = dateTimeObject.day.toString();

  if (day.length == 1) {
    day = '0$day';
  }

  String yyyymmdd = year + month + day;
  return yyyymmdd;
}

//COnvert string yyyymmdd to DateTime Object
DateTime createDateTimeObject(String yyyymmdd) {
  int yyyy = int.parse(yyyymmdd.substring(0, 4));
  int mm = int.parse(yyyymmdd.substring(4, 6));
  int dd = int.parse(yyyymmdd.substring(6, 8));

  DateTime dateTime = DateTime(yyyy, mm, dd);
  return dateTime;
}

//Conver DateTIme oBject To String yyymmdd

String convertDateTimeToString(DateTime dateTime) {
  String year = dateTime.toString();

  String month = dateTime.month.toString();

  if (month.length == 1) {
    month = '0$month';
  }

  String day = dateTime.day.toString();

  if (day.length == 1) {
    day = '0$day';
  }

  String yyyymmdd = year + month + day;
  return yyyymmdd;
}
