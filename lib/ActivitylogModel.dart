class ActivityLogModel{
  String name;
  String content;
  String image;

  ActivityLogModel(this.name,this.content,this.image);
}

List<ActivityLogModel> ActivityLogs = ActivityLogData
  .map((item) =>
    ActivityLogModel(item['name'], item['content'], item['image']))
  .toList();

  var ActivityLogData = [
    {"name": "Watsons", "content": "Watsons inspires and enables every one of our customers to look good and feel great so they can enjoy life to the fullest.",  "image": "assets/16.jpg"},
    {"name": "GNC", "content": "GNC It means to live well—and at GNC—we see that as something worth celebrating.",  "image": "assets/15.jpg"},
    {"name": "Fine Supplement", "content": "At Fine Supplements, our customers trust us to provide them with the highest quality products.",  "image": "assets/14.jpg"}
  ];