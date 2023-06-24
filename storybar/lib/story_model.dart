import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StoryModel {
  final VoidCallback onTap;
  final String userName;
  final String thumbnailImage;
  final String avatarImage;

  StoryModel(
    this.userName,
    this.avatarImage,
    this.thumbnailImage,
    this.onTap,
  );
}

List<StoryModel> modelData = [
  StoryModel(
      'userName', 'res/drawable/flower.jpg', 'res/drawable/default_image.jpg',
      () {
    stdout.writeln('Image Clicked');
  }),
  StoryModel(
      'userName', 'res/drawable/flower.jpg', 'res/drawable/default_image.jpg',
      () {
    stdout.writeln('Image Clicked');
  }),
  StoryModel(
      'userName', 'res/drawable/flower.jpg', 'res/drawable/default_image.jpg',
      () {
    stdout.writeln('Image Clicked');
  }),
  StoryModel(
      'userName', 'res/drawable/flower.jpg', 'res/drawable/default_image.jpg',
      () {
    stdout.writeln('Image Clicked');
  }),
  StoryModel(
      'userName', 'res/drawable/flower.jpg', 'res/drawable/default_image.jpg',
      () {
    stdout.writeln('Image Clicked');
  }),
  StoryModel(
      'userName', 'res/drawable/flower.jpg', 'res/drawable/default_image.jpg',
      () {
    stdout.writeln('Image Clicked');
  }),
  StoryModel(
      'userName', 'res/drawable/flower.jpg', 'res/drawable/default_image.jpg',
      () {
    stdout.writeln('Image Clicked');
  }),
  StoryModel(
      'userName', 'res/drawable/flower.jpg', 'res/drawable/default_image.jpg',
      () {
    stdout.writeln('Image Clicked');
  }),
];
