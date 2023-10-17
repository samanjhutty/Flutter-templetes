import 'package:hive/hive.dart';
import 'data_model.dart';

late Box box;
final dbBox = Hive.box<DataModel>('DB');
