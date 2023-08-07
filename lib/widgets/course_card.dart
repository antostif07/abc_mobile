import 'package:abc_mobile/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Model/course_model.dart';

class CourseCard extends StatelessWidget {
  const CourseCard({super.key, required this.course});

  final CourseModel course;

  @override
  Widget build(BuildContext context) {
    final cover = course.cover == null ? const AssetImage('assets/images/logo.png') : NetworkImage('${Routes.apiUrl}${course.cover?.contentUrl}');
    final centerCover = course.center.cover == null ? const AssetImage('assets/images/logo.png') : NetworkImage('${Routes.apiUrl}${course.center.cover?.contentUrl}');

    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
        color: Colors.white
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 160,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(16.0)),
              image: DecorationImage(
                image: cover as ImageProvider,
                fit: BoxFit.cover,
                
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: CircleAvatar(
                    backgroundImage: centerCover as ImageProvider,
                  ),
                ),
                Text(course.center.name, style: GoogleFonts.poppins(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold
                ),)
              ]
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Text(course.name, style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.black,
            ),),
          ),
          Text(
            course.briefDescription ?? '',
            style: GoogleFonts.poppins(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.all(16.0)
                ),
                onPressed: () {
                  Get.toNamed(Routes.courseScreen, );
                },
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 8),
                      child: Icon(Icons.arrow_forward, color: Colors.white),
                    ),
                    Text('Voir le cours', style: GoogleFonts.poppins(
                      color: Colors.white,
                    ),)
                  ],
                )
            ),
          )
        ],
      ),
    );
  }

}