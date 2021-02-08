class QuickMedicineModel{
  String name;
  String image;

  QuickMedicineModel(this.name,this.image);
}

List<QuickMedicineModel> quicks = quicksData
  .map((item) =>
    QuickMedicineModel(item['name'], item['image']))
  .toList();

  var quicksData = [
    {"name": "Ativan", "image": "assets/medicine1.jpg"},
    {"name": "Valchlor",  "image": "assets/medicine2.jpg"},
    {"name": "Adderall",  "image": "assets/medicine3.jpg"},
    {"name": "Danazol", "image": "assets/medicine4.jpg"},
    {"name": "Macrobid",  "image": "assets/medicine7.jpg"},
    {"name": "Fexotana",  "image": "assets/medicine3.jpg"},
    {"name": "Topibanc",  "image": "assets/medicine1.jpg"},
    {"name": "Topiban",  "image": "assets/medicine2.jpg"},
    {"name": "Travophilus",  "image": "assets/medicine1.jpg"},
    {"name": "Neuroban",  "image": "assets/medicine4.jpg"},
    {"name": "Neuroban",  "image": "assets/medicine3.jpg"}
  ];