enum LectureType { text, video, audio, mixed }

class Lecture {
  final String id;
  final String title;
  final LectureType type;
  final String? textContent;
  final String? imageUrl;
  final String? imageText;
  final String? videoUrl;
  final String? audioUrl;
  final String? content; // for backward compatibility

  Lecture({
    required this.id,
    required this.title,
    required this.type,
    this.textContent,
    this.imageUrl,
    this.imageText,
    this.videoUrl,
    this.audioUrl,
    this.content,
  });
}

class Chapter {
  final String id;
  final String title;
  final List<Lecture> lectures;

  Chapter({required this.id, required this.title, required this.lectures});
}

class Course {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final double progress; // 0.0 to 1.0
  final String duration;
  final List<Chapter> chapters;

  Course({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.progress,
    required this.duration,
    required this.chapters,
  });
}
