import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';


final List<String> imageList = [
  "https://t3.ftcdn.net/jpg/00/87/97/06/360_F_87970620_Tdgw6WYdWnrZHn2uQwJpVDH4vr4PINSc.jpg",
  "https://t4.ftcdn.net/jpg/03/42/24/25/360_F_342242546_qnKSMS49iCksUFYxnnf0JF46E9tHN3E3.jpg",
  "https://cdn.pixabay.com/photo/2016/04/04/14/12/monitor-1307227__480.jpg",
  "https://thumbs.dreamstime.com/b/creative-mechanical-engineer-working-machines-mechanical-engineer-working-machines-132647779.jpg",
  "https://wallpapercave.com/wp/wp3027281.jpg",
  "https://static.wixstatic.com/media/c6053c_8738142b68f3438ab0a4609cf02d2edb~mv2.jpg/v1/fill/w_460,h_258,al_c,q_80,usm_0.66_1.00_0.01,enc_auto/civil-engineering-company.jpg"

];

final List<Widget> imageSliders = imageList
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
                //   child: Text('${imageList.indexOf(item)}',
                //     style: const TextStyle(color: Colors.white,fontSize: 20.0, fontWeight: FontWeight.bold),
                // ),
            ),
            )
          ],
        ),
      ),
    )).toList();

class SliderImage extends StatelessWidget {
  const SliderImage({Key? key}) : super(key: key);

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
