class Friend {
  String name;
  String imageUrl;
  String numPposts;
  String numFollowers;
  String numFollowing;

  Friend({
    this.imageUrl,
    this.name,
    this.numFollowers,
    this.numFollowing,
    this.numPposts,
  });
}

List<Friend> favorite = [
  Friend(
    name: 'Sam',
    imageUrl: 'assets/images/profile/image01.jpg',
  ),
  Friend(
    name: 'Saly',
    imageUrl: 'assets/images/profile/image02.jpg',
  ),
  Friend(
    name: 'Alex',
    imageUrl: 'assets/images/profile/image03.jpg',
  ),
  Friend(
    name: 'Sara',
    imageUrl: 'assets/images/profile/image04.jpg',
  ),
  Friend(
    name: 'Tomas',
    imageUrl: 'assets/images/profile/image05.jpg',
  ),
];
