import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';


final List<String> imageList1 = [
  "https://images.shiksha.com/mediadata/images/1568604998phpV05K5B.jpeg",
  "https://images.shiksha.com/mediadata/images/1568605472phpVeU6MA.jpeg",
  "https://uemgroup.s3.amazonaws.com/uploads/sites/3/2020/08/DSC7792-scaled.jpg",
  "https://uemgroup.s3.amazonaws.com/uploads/sites/3/2020/08/DSC7821-scaled.jpg",
  "https://images.shiksha.com/mediadata/images/1568605121phpJKGBRL_205x160.jpg",
  "https://static.collegedekho.com/media/img/institute/crawled_images/Girls_Hostel_facilitites2.jpg"

];

final List<Widget> imageSliders = imageList1
    .map((item) => Container(
  margin: const EdgeInsets.all(5.0),
  child: ClipRRect(
    borderRadius: const BorderRadius.all(Radius.circular(5.0)),
    child: Stack(
      children: <Widget>[
        Image.network(item, fit: BoxFit.cover, width: 1000.0),
        Positioned(
          bottom: 0.0,
          left: 0.0,
          right: 0.0,
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(100, 0, 0, 0),
                  Color.fromARGB(0, 0, 0, 0)
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            child: Text('No. ${imageList1.indexOf(item)} image',
              style: const TextStyle(color: Colors.white,fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ),
        )
      ],
    ),
  ),
)).toList();

class AboutSliderImage extends StatelessWidget {
  const AboutSliderImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CarouselSlider(
        options: CarouselOptions(
            autoPlay: true,
            aspectRatio: 2.0,
            enlargeCenterPage: true
        ),
        items: imageSliders,
      ),
    );
  }
}
