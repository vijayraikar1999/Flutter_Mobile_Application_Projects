import 'package:social_media_app/models/friends.dart';

class Post {
  final String imageUrl;
  final String timePosted;
  final Friend friend;
  final String description;
  final String comments;
  final String shared;
  final String like;

  Post({
    this.imageUrl,
    this.description,
    this.friend,
    this.timePosted,
    this.comments,
    this.shared,
    this.like,
  });
}

final Friend sam = Friend(
  name: 'Sam',
  imageUrl: 'assets/images/profile/image01.jpg',
);

final Friend saly = Friend(
  name: 'Saly',
  imageUrl: 'assets/images/profile/image02.jpg',
);

final Friend alex = Friend(
  name: 'Alex',
  imageUrl: 'assets/images/profile/image03.jpg',
);

final Friend sara = Friend(
  name: 'Sara',
  imageUrl: 'assets/images/profile/image04.jpg',
);

final Friend tomas = Friend(
  name: 'Tomas',
  imageUrl: 'assets/images/profile/image05.jpg',
);

final Friend nancy = Friend(
  name: 'Nancy',
  imageUrl: 'assets/images/profile/image06.jpg',
);

final Friend markous = Friend(
  name: 'Markous',
  imageUrl: 'assets/images/profile/image07.jpg',
);

final Friend kamala = Friend(
  name: 'Kamala',
  imageUrl: 'assets/images/profile/image08.jpg',
);

final Friend may = Friend(
  name: 'May',
  imageUrl: 'assets/images/profile/image09.jpg',
);

List<Post> posts = [
  Post(
      friend: markous,
      imageUrl: 'assets/images/posts/2.jpg',
      timePosted: '4 hours ago',
      like: '40',
      shared: '33',
      comments: '20',
      description:
          'This is simply a dummy text of the printing and typesetting industry. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.'),
  Post(
      friend: kamala,
      imageUrl: 'assets/images/posts/3.jpg',
      timePosted: '5 hours ago',
      like: '45',
      shared: '101',
      comments: '25',
      description:
          'This is simply a dummy text of the printing and typesetting industry. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.   '),
  Post(
      friend: saly,
      imageUrl: 'assets/images/posts/4.jpg',
      timePosted: '3 hours ago',
      like: '58',
      shared: '55',
      comments: '30',
      description:
          'This is simply a dummy text of the printing and typesetting industry. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.   '),
  Post(
      friend: tomas,
      imageUrl: 'assets/images/posts/1.jpg',
      timePosted: '3 hours ago',
      like: '72',
      shared: '33',
      comments: '35',
      description:
          'This is simply a dummy text of the printing and typesetting industry. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. '),
  Post(
      friend: may,
      imageUrl: 'assets/images/posts/3.jpg',
      timePosted: '25 hours ago',
      like: '80',
      shared: '26',
      comments: '40',
      description:
          'This is simply a dummy text of the printing and typesetting industry. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.'),
];
