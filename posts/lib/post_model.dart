import 'dart:io';
import 'dart:ui';

import 'package:flutter/animation.dart';

class PostModel {
  final String avatarImage;
  final String username;
  final String caption;
  final String time;
  final String postImage;
  final VoidCallback avatarOnTap;
  final VoidCallback imageOnTap;
  final VoidCallback likeOnTap;
  final VoidCallback moreOnTap;
  final VoidCallback commentsOnTap;
  final VoidCallback shareOnTap;

  PostModel(
      this.avatarImage,
      this.username,
      this.time,
      this.caption,
      this.postImage,
      this.avatarOnTap,
      this.imageOnTap,
      this.likeOnTap,
      this.commentsOnTap,
      this.shareOnTap,
      this.moreOnTap);
}

List<PostModel> postData = [
  PostModel(
      'https://cdn.pixabay.com/photo/2015/04/19/08/32/marguerite-729510_1280.jpg',
      'Username',
      'Just now',
      'The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.\n'
          "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?",
      'https://st2.depositphotos.com/2523411/8882/i/600/depositphotos_88824856-stock-photo-sunrise-above-the-mountains.jpg',
      () => stdout.writeln('Avatar Clicked'),
      () => stdout.writeln('image Clicked'),
      () => stdout.writeln('Like Pressed'),
      () => stdout.writeln('comment Pressed'),
      () => stdout.writeln('share Pressed'),
      () => stdout.writeln('more Pressed')),
  PostModel(
      'https://cdn.pixabay.com/photo/2015/04/19/08/32/marguerite-729510_1280.jpg',
      'Username',
      'Just now',
      'The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.\n"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?"',
      'https://st2.depositphotos.com/2523411/8882/i/600/depositphotos_88824856-stock-photo-sunrise-above-the-mountains.jpg',
      () => stdout.writeln('Avatar Clicked'),
      () => stdout.writeln('image Clicked'),
      () => stdout.writeln('Like Pressed'),
      () => stdout.writeln('comment Pressed'),
      () => stdout.writeln('share Pressed'),
      () => stdout.writeln('more Pressed')),
  PostModel(
      'https://cdn.pixabay.com/photo/2015/04/19/08/32/marguerite-729510_1280.jpg',
      'Username',
      'Just now',
      'The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.\n'
          "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?",
      'https://st2.depositphotos.com/2523411/8882/i/600/depositphotos_88824856-stock-photo-sunrise-above-the-mountains.jpg',
      () => stdout.writeln('Avatar Clicked'),
      () => stdout.writeln('image Clicked'),
      () => stdout.writeln('Like Pressed'),
      () => stdout.writeln('comment Pressed'),
      () => stdout.writeln('share Pressed'),
      () => stdout.writeln('more Pressed')),
  PostModel(
      'https://cdn.pixabay.com/photo/2015/04/19/08/32/marguerite-729510_1280.jpg',
      'Username',
      'Just now',
      'The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.\n'
          "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?",
      'https://st2.depositphotos.com/2523411/8882/i/600/depositphotos_88824856-stock-photo-sunrise-above-the-mountains.jpg',
      () => stdout.writeln('Avatar Clicked'),
      () => stdout.writeln('image Clicked'),
      () => stdout.writeln('Like Pressed'),
      () => stdout.writeln('comment Pressed'),
      () => stdout.writeln('share Pressed'),
      () => stdout.writeln('more Pressed')),
  PostModel(
      'https://cdn.pixabay.com/photo/2015/04/19/08/32/marguerite-729510_1280.jpg',
      'Username',
      'Just now',
      'The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.\n'
          "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?",
      'https://st2.depositphotos.com/2523411/8882/i/600/depositphotos_88824856-stock-photo-sunrise-above-the-mountains.jpg',
      () => stdout.writeln('Avatar Clicked'),
      () => stdout.writeln('image Clicked'),
      () => stdout.writeln('Like Pressed'),
      () => stdout.writeln('comment Pressed'),
      () => stdout.writeln('share Pressed'),
      () => stdout.writeln('more Pressed')),
  PostModel(
      'https://cdn.pixabay.com/photo/2015/04/19/08/32/marguerite-729510_1280.jpg',
      'Username',
      'Just now',
      'The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.\n'
          "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?",
      'https://st2.depositphotos.com/2523411/8882/i/600/depositphotos_88824856-stock-photo-sunrise-above-the-mountains.jpg',
      () => stdout.writeln('Avatar Clicked'),
      () => stdout.writeln('image Clicked'),
      () => stdout.writeln('Like Pressed'),
      () => stdout.writeln('comment Pressed'),
      () => stdout.writeln('share Pressed'),
      () => stdout.writeln('more Pressed')),
];
