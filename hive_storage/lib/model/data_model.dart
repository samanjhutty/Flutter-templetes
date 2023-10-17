import 'package:hive/hive.dart';

part 'data_model.g.dart';

@HiveType(typeId: 1)
class DataModel {
  DataModel({required this.name, required this.score});
  @HiveField(0)
  String name;

  @HiveField(1)
  double score;
}

List<DataModel> dataModel = [];
