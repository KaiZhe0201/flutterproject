import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterproject/places.dart';
import 'package:flutterproject/image_card.dart';

class ImageCards extends StatefulWidget {
  @override
  _ImageCardsState createState() => _ImageCardsState();
}

class _ImageCardsState extends State<ImageCards> {
  List<Place> places = [
    Place(place: 'Park', image: 'Park.png', days:'Windsor Nature Park', description: 'A park is an open place in a city or town for nature. There are often trees, benches, statues, and ponds in a park. Some parks built in big cities are very large. These can have fountains or picnic areas.A park is an open area,often found with trees,benches,statues,etc.'),
    Place(place: 'Market', image: 'market.png',days:'ABC Market', description: 'A wet market is a marketplace selling fresh meat, fish, produce, and other perishable goods as distinguished from "dry markets" that sell durable goods such as fabric and electronics.'),
    Place(place: 'Mall', image: 'Mall.png',days:'Mandarin Gallery', description: 'Community centres or community halls are public locations where members of a community tend to gather for group activities, social support, public information, and other purposes.'),
    Place(place: 'Community Centre', image: 'CommunityCentre.png',days:'Clementi Community Club', description: 'Community centres or community halls are public locations where members of a community tend to gather for group activities, social support, public information, and other purposes.'),
    Place(place: 'Hospital', image: 'hospital.png',days:'Raffles Hospital', description: 'Hospital, an institution that is built, staffed, and equipped for the diagnosis of disease; for the treatment, both medical and surgical, of the sick and the injured; and for their housing during this process')
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 260,
        width: 400,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: places.length,
            itemBuilder: (_, index) {
              return ImageCard(
                place: places[index],
                name: places[index].place,
                picture: places[index].image,
                description: places[index].description
              );
            }));
  }
}
