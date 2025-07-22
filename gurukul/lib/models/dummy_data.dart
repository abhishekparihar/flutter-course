import 'course.dart';

final List<Course> dummyCourses = [
  Course(
    id: 'c1',
    title: 'Dance',
    description: 'You can Learn dance here',
    imageUrl:
        'https://images.unsplash.com/photo-1517841905240-472988babdf9', // Replace with your asset or network image
    progress: 0.6,
    duration: '10 hours',
    chapters: [
      Chapter(
        id: 'ch1',
        title: 'Basics',
        lectures: [
          Lecture(
            id: 'l1',
            title: 'Introduction',
            type: LectureType.text,
            textContent: 'Welcome to Dance! This is a text-only lecture.',
          ),
          Lecture(
            id: 'l2',
            title: 'Dance Posture',
            type: LectureType.text,
            imageUrl:
                'https://images.unsplash.com/photo-1464983953574-0892a716854b',
            imageText: 'This is a dance posture image with description.',
          ),
          Lecture(
            id: 'l3',
            title: 'Warm Up Video',
            type: LectureType.video,
            videoUrl: 'https://samplelib.com/mp4/sample-5s.mp4',
          ),
          Lecture(
            id: 'l4',
            title: 'Warm Up Audio',
            type: LectureType.audio,
            audioUrl:
                'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3',
          ),
        ],
      ),
      Chapter(
        id: 'ch2',
        title: 'Advanced',
        lectures: [
          Lecture(
            id: 'l3',
            title: 'Freestyle',
            type: LectureType.audio,
            content: 'audio_url',
          ),
          Lecture(
            id: 'l4',
            title: 'Performance',
            type: LectureType.mixed,
            content: 'mixed_content',
          ),
        ],
      ),
    ],
  ),
  Course(
    id: 'c2',
    title: 'Public Speaking',
    description: 'You can Learn Public Speaking',
    imageUrl:
        'https://images.unsplash.com/photo-1506744038136-46273834b3fb', // Replace with your asset or network image
    progress: 0.0,
    duration: '3 hours',
    chapters: [
      Chapter(
        id: 'ch3',
        title: 'Getting Started',
        lectures: [
          Lecture(
            id: 'l5',
            title: 'Why Public Speaking?',
            type: LectureType.text,
            content: 'Text content',
          ),
        ],
      ),
    ],
  ),
];
