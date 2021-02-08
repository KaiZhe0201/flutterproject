class QuickMedicineModel{
  String name;
  String medicine;
  String image;

  QuickMedicineModel(this.name,this.medicine,this.image);
}

List<QuickMedicineModel> quicks = quicksData
  .map((item) =>
    QuickMedicineModel(item['name'], item['medicine'], item['image']))
  .toList();

  var quicksData = [
    {"name": "Ativan", "medicine": "3 Tab", "image": "assets/medicine1.jpg"},
    {"name": "Valchlor", "medicine": "2 Tab", "image": "assets/medicine2.jpg"},
    {"name": "Adderall", "medicine": "1 Tab", "image": "assets/medicine3.jpg"},
    {"name": "Danazol", "medicine": "1 Tab", "image": "assets/medicine4.jpg"},
    {"name": "Macrobid", "medicine": "2 Tab", "image": "assets/medicine7.jpg"},
  ];