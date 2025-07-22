import 'package:flutter/material.dart';
import '../models/dummy_data.dart';
import '../models/course.dart';
import 'course_detail_screen.dart';
import 'package:video_player/video_player.dart';
import 'package:just_audio/just_audio.dart';

class CoursesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Courses'),
        actions: [
          IconButton(icon: Icon(Icons.notifications_none), onPressed: () {}),
        ],
        backgroundColor: Color(0xFF233A7D),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: dummyCourses.length,
        itemBuilder: (ctx, idx) {
          final course = dummyCourses[idx];
          return Card(
            margin: EdgeInsets.only(bottom: 16),
            elevation: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  course.imageUrl,
                  height: 160,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${course.title} >',
                        style: TextStyle(color: Colors.grey[700], fontSize: 14),
                      ),
                      SizedBox(height: 4),
                      Text(
                        course.description,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Text(
                            course.duration,
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                          Spacer(),
                          Text(
                            '${(course.progress * 100).toInt()}% Complete',
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ],
                      ),
                      SizedBox(height: 4),
                      LinearProgressIndicator(
                        value: course.progress,
                        backgroundColor: Colors.grey[300],
                        color: Color(0xFF233A7D),
                        minHeight: 4,
                      ),
                      SizedBox(height: 12),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF233A7D),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                    CourseDetailScreen(course: course),
                              ),
                            );
                          },
                          child: Text(
                            course.progress > 0
                                ? 'CONTINUE LEARNING'
                                : 'START COURSE',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
