import 'dart:ui';

class FriendsModel {
  final String profileImage;
  final String username;
  final VoidCallback profileOnTap;
  final VoidCallback reqAccept;

  const FriendsModel({
    required this.profileImage,
    required this.username,
    required this.profileOnTap,
    required this.reqAccept,
  });
}

List<FriendsModel> friendsData = [
  FriendsModel(
      profileImage:
          'https://www.google.com/url?sa=i&url=https%3A%2F%2Fpixabay.com%2Fimages%2Fsearch%2Fnature%2F&psig=AOvVaw2WJbWTv0CEld4BInmzQj5V&ust=1689917169647000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCLD9k5fGnIADFQAAAAAdAAAAABAE',
      username: 'username0',
      profileOnTap: () {},
      reqAccept: () {}),
  FriendsModel(
      profileImage:
          'https://www.google.com/url?sa=i&url=https%3A%2F%2Fpixabay.com%2Fimages%2Fsearch%2Fnature%2F&psig=AOvVaw2WJbWTv0CEld4BInmzQj5V&ust=1689917169647000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCLD9k5fGnIADFQAAAAAdAAAAABAE',
      username: 'username1',
      profileOnTap: () {},
      reqAccept: () {}),
  FriendsModel(
      profileImage:
          'https://www.google.com/url?sa=i&url=https%3A%2F%2Fpixabay.com%2Fimages%2Fsearch%2Fnature%2F&psig=AOvVaw2WJbWTv0CEld4BInmzQj5V&ust=1689917169647000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCLD9k5fGnIADFQAAAAAdAAAAABAE',
      username: 'username2',
      profileOnTap: () {},
      reqAccept: () {}),
  FriendsModel(
      profileImage:
          'https://www.google.com/url?sa=i&url=https%3A%2F%2Fpixabay.com%2Fimages%2Fsearch%2Fnature%2F&psig=AOvVaw2WJbWTv0CEld4BInmzQj5V&ust=1689917169647000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCLD9k5fGnIADFQAAAAAdAAAAABAE',
      username: 'username3',
      profileOnTap: () {},
      reqAccept: () {}),
  FriendsModel(
      profileImage:
          'https://www.google.com/url?sa=i&url=https%3A%2F%2Fpixabay.com%2Fimages%2Fsearch%2Fnature%2F&psig=AOvVaw2WJbWTv0CEld4BInmzQj5V&ust=1689917169647000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCLD9k5fGnIADFQAAAAAdAAAAABAE',
      username: 'username4',
      profileOnTap: () {},
      reqAccept: () {}),
  FriendsModel(
      profileImage:
          'https://www.google.com/url?sa=i&url=https%3A%2F%2Fpixabay.com%2Fimages%2Fsearch%2Fnature%2F&psig=AOvVaw2WJbWTv0CEld4BInmzQj5V&ust=1689917169647000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCLD9k5fGnIADFQAAAAAdAAAAABAE',
      username: 'username5',
      profileOnTap: () {},
      reqAccept: () {}),
  FriendsModel(
      profileImage:
          'https://www.google.com/url?sa=i&url=https%3A%2F%2Fpixabay.com%2Fimages%2Fsearch%2Fnature%2F&psig=AOvVaw2WJbWTv0CEld4BInmzQj5V&ust=1689917169647000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCLD9k5fGnIADFQAAAAAdAAAAABAE',
      username: 'username6',
      profileOnTap: () {},
      reqAccept: () {}),
];
