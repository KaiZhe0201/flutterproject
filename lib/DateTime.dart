class DateTimeModel{
  String Day;
  String Date;
  String Color;
  DateTimeModel(this.Day,this.Date,this.Color);
}

List<DateTimeModel> DateTimes = DateTimeData
  .map((item) =>
    DateTimeModel(item['Day'], item['Date'], item['Color']))
  .toList();

  var DateTimeData = [
    {"Day": "Sunday", "Date": "7", "Color":"white"},
    {"Day": "Monday", "Date": "8", "Color":"white"},
    {"Day": "Tuesday", "Date": "9", "Color":"black"},
    {"Day": "Wednesday", "Date": "10", "Color":"white"},
    {"Day": "Thursday", "Date": "11", "Color":"white"},
    {"Day": "Friday", "Date": "12", "Color":"white"},
    {"Day": "Saturday", "Date": "13", "Color":"white"},
    {"Day": "Sunday", "Date": "14", "Color":"white"},
    {"Day": "Monday", "Date": "15", "Color":"white"},
    {"Day": "Tuesday", "Date": "16", "Color":"white"},
    {"Day": "Wednesday", "Date": "17", "Color":"white"},
    {"Day": "Thursday", "Date": "18", "Color":"white"},
    {"Day": "Friday", "Date": "19", "Color":".white"},
    {"Day": "Saturday", "Date": "20", "Color":"white"},
    {"Day": "Sunday", "Date": "21", "Color":"white"}
  ];


