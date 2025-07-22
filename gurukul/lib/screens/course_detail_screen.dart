import 'package:flutter/material.dart';
import '../models/course.dart';
import 'package:video_player/video_player.dart';
import 'package:just_audio/just_audio.dart';

class CourseDetailScreen extends StatefulWidget {
  final Course course;

  const CourseDetailScreen({required this.course});

  @override
  State<CourseDetailScreen> createState() => _CourseDetailScreenState();
}

class _CourseDetailScreenState extends State<CourseDetailScreen> {
  // Track expanded lecture by chapter and lecture index
  int? expandedChapterIdx;
  int? expandedLectureIdx;

  VideoPlayerController? _videoController;
  AudioPlayer? _audioPlayer;
  int? _activeVideoLectureIdx;
  int? _activeAudioLectureIdx;

  @override
  void dispose() {
    _videoController?.dispose();
    _audioPlayer?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final course = widget.course;
    final avatarUrl = 'https://randomuser.me/api/portraits/men/32.jpg';

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Header Section
          Stack(
            children: [
              // Course Image
              Image.network(
                course.imageUrl,
                width: double.infinity,
                height: 220,
                fit: BoxFit.cover,
              ),
              // Overlay
              Container(
                width: double.infinity,
                height: 220,
                color: Colors.black.withOpacity(0.4),
              ),
              // Top Row: Back, Title, Avatar
              Positioned(
                top: 32,
                left: 8,
                right: 8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Back Button
                    IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                    // Avatar
                    CircleAvatar(
                      backgroundImage: NetworkImage(avatarUrl),
                      radius: 22,
                    ),
                  ],
                ),
              ),
              // Course Description
              Positioned(
                left: 16,
                bottom: 70,
                child: Text(
                  course.description,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              // Progress and Stats
              Positioned(
                left: 16,
                right: 16,
                bottom: 48,
                child: Row(
                  children: [
                    Text(
                      course.duration,
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                    Spacer(),
                    Text(
                      '${(course.progress * 100).toInt()}% Complete',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ],
                ),
              ),
              // Progress Bar
              Positioned(
                left: 16,
                right: 16,
                bottom: 36,
                child: LinearProgressIndicator(
                  value: course.progress,
                  backgroundColor: Colors.white24,
                  color: Colors.yellow[700],
                  minHeight: 4,
                ),
              ),
              // Continue Button and Download
              Positioned(
                left: 16,
                right: 16,
                bottom: 8,
                child: Row(
                  children: [
                    // Expanded(
                    //   child: ElevatedButton(
                    //     style: ElevatedButton.styleFrom(
                    //       backgroundColor: Colors.yellow[700],
                    //       foregroundColor: Colors.white,
                    //       padding: EdgeInsets.symmetric(vertical: 12),
                    //       textStyle: TextStyle(
                    //         fontWeight: FontWeight.bold,
                    //         fontSize: 16,
                    //       ),
                    //     ),
                    //     onPressed: () {},
                    //     child: Text('CONTINUE LEARNING'),
                    //   ),
                    // ),
                    // SizedBox(width: 12),
                    // Container(
                    //   decoration: BoxDecoration(
                    //     color: Colors.black.withOpacity(0.3),
                    //     borderRadius: BorderRadius.circular(8),
                    //   ),
                    //   child: IconButton(
                    //     icon: Icon(Icons.download, color: Colors.white),
                    //     onPressed: () {},
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          ),
          // Section List
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: course.chapters.length,
              itemBuilder: (context, chapterIdx) {
                final chapter = course.chapters[chapterIdx];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Section Header
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 16, 0, 4),
                      child: Text(
                        'Section ${chapterIdx + 1}',
                        style: TextStyle(color: Colors.grey[600], fontSize: 13),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 0, 8),
                      child: Text(
                        chapter.title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    // Lectures
                    ...List.generate(chapter.lectures.length, (lectureIdx) {
                      final lecture = chapter.lectures[lectureIdx];
                      IconData icon;
                      Color iconColor = Color(0xFF233A7D);
                      String meta = '';
                      switch (lecture.type) {
                        case LectureType.text:
                          icon = lecture.imageUrl != null
                              ? Icons.image
                              : Icons.ondemand_video;
                          meta = '10 Min';
                          break;
                        case LectureType.video:
                          icon = Icons.check_circle_outline;
                          meta = '20 Min';
                          break;
                        case LectureType.audio:
                          icon = Icons.play_circle_outline;
                          meta = '30 Min';
                          break;
                        case LectureType.mixed:
                          icon = Icons.quiz_outlined;
                          meta = '10 Que.';
                          break;
                      }
                      final isExpanded =
                          expandedChapterIdx == chapterIdx &&
                          expandedLectureIdx == lectureIdx;
                      return Column(
                        children: [
                          Container(
                            color: Colors.grey[100],
                            margin: EdgeInsets.symmetric(vertical: 2),
                            child: ListTile(
                              leading: Icon(icon, color: iconColor, size: 28),
                              title: Text(
                                lecture.title,
                                style: TextStyle(fontSize: 15),
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.access_time,
                                    color: Colors.grey[400],
                                    size: 18,
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    meta,
                                    style: TextStyle(
                                      color: Colors.grey[700],
                                      fontSize: 13,
                                    ),
                                  ),
                                  Icon(
                                    isExpanded
                                        ? Icons.expand_less
                                        : Icons.expand_more,
                                    color: Colors.grey[600],
                                  ),
                                ],
                              ),
                              onTap: () {
                                setState(() {
                                  if (isExpanded) {
                                    expandedChapterIdx = null;
                                    expandedLectureIdx = null;
                                  } else {
                                    expandedChapterIdx = chapterIdx;
                                    expandedLectureIdx = lectureIdx;
                                  }
                                });
                              },
                            ),
                          ),
                          if (isExpanded)
                            Container(
                              width: double.infinity,
                              color: Colors.white,
                              padding: EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 12,
                              ),
                              child: _buildLectureContent(lecture, lectureIdx),
                            ),
                        ],
                      );
                    }),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLectureContent(Lecture lecture, int lectureIdx) {
    if (lecture.textContent != null) {
      return Text(lecture.textContent!);
    } else if (lecture.imageUrl != null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(lecture.imageUrl!, height: 180, fit: BoxFit.cover),
          if (lecture.imageText != null) ...[
            SizedBox(height: 8),
            Text(lecture.imageText!),
          ],
        ],
      );
    } else if (lecture.videoUrl != null) {
      // Video player
      if (_activeVideoLectureIdx != lectureIdx || _videoController == null) {
        _videoController?.dispose();
        _videoController =
            VideoPlayerController.networkUrl(Uri.parse(lecture.videoUrl!))
              ..initialize().then((_) {
                setState(() {});
                _videoController?.play();
              });
        _activeVideoLectureIdx = lectureIdx;
      }
      if (_videoController != null && _videoController!.value.isInitialized) {
        return AspectRatio(
          aspectRatio: _videoController!.value.aspectRatio,
          child: VideoPlayer(_videoController!),
        );
      } else {
        return Center(child: CircularProgressIndicator());
      }
    } else if (lecture.audioUrl != null) {
      // Audio player
      if (_activeAudioLectureIdx != lectureIdx || _audioPlayer == null) {
        _audioPlayer?.dispose();
        _audioPlayer = AudioPlayer();
        _audioPlayer!.setUrl(lecture.audioUrl!);
        _activeAudioLectureIdx = lectureIdx;
      }
      return Row(
        children: [
          IconButton(
            icon: Icon(Icons.play_arrow),
            onPressed: () => _audioPlayer?.play(),
          ),
          IconButton(
            icon: Icon(Icons.pause),
            onPressed: () => _audioPlayer?.pause(),
          ),
          IconButton(
            icon: Icon(Icons.stop),
            onPressed: () => _audioPlayer?.stop(),
          ),
          Text('Audio Lecture'),
        ],
      );
    } else {
      return Text('No content available.');
    }
  }
}
