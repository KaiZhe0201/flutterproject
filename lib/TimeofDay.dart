class TimeofDayModel{
  String name;
  String image;

  TimeofDayModel(this.name,this.image);
}

List<TimeofDayModel> quickss = quicksData
  .map((item) =>
    TimeofDayModel(item['name'], item['image']))
  .toList();

  var quicksData = [
    {"name": "Morning", "image": "assets/morning.jpg"},
    {"name": "Afternoon",  "image": "assets/afternoon.jpg"},
    {"name": "Evening",  "image": "assets/evening.jpg"},
    {"name": "Night", "image": "assets/night.jpg"}
  ];