// ignore_for_file: avoid_print

import 'package:flutter/animation.dart';

class CardModel {
  final String cardImage;
  final String text;
  final VoidCallback editTap;
  final VoidCallback shareTap;

  const CardModel(
      {required this.cardImage,
      required this.text,
      required this.editTap,
      required this.shareTap});
}

List<CardModel> cardData = [
  CardModel(
      cardImage: 'lib/images/bg-0.jpg',
      text:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
      editTap: () => print('Edit Clicked'),
      shareTap: () => print('Share Clicked')),
  CardModel(
      cardImage: 'lib/images/bg-1.jpg',
      text:
          'It is a long established fact that a reader will be distracted by the readable content.',
      editTap: () => print('Edit Clicked'),
      shareTap: () => print('Share Clicked')),
  CardModel(
      cardImage: 'lib/images/bg-2.jpg',
      text:
          'Contrary to popular belief, Lorem Ipsum is not simply random text.',
      editTap: () => print('Edit Clicked'),
      shareTap: () => print('Share Clicked')),
  CardModel(
      cardImage: 'lib/images/bg-3.jpg',
      text: 'It has roots in a piece of classical Latin literature from 45 BC.',
      editTap: () => print('Edit Clicked'),
      shareTap: () => print('Share Clicked')),
  CardModel(
      cardImage: 'lib/images/bg-4.jpg',
      text:
          'Many desktop publishing packages and web page editors now use Lorem Ipsum.',
      editTap: () => print('Edit Clicked'),
      shareTap: () => print('Share Clicked')),
  CardModel(
      cardImage: 'lib/images/bg-5.jpg',
      text:
          'The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested.',
      editTap: () => print('Edit Clicked'),
      shareTap: () => print('Share Clicked'))
];
