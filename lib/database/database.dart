import 'package:moor_flutter/moor_flutter.dart';

part 'database.g.dart';

class Activity extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get date => dateTime()();
  TextColumn get description => text()();
  // The price will be treated as cents notation, i.e, $0.10 = 100 as integer
  IntColumn get price => integer()();
  TextColumn get type => text()();
}

@UseMoor(tables: [Activity])
class ActivityDatabase extends _$ActivityDatabase {
  ActivityDatabase()
      : super(FlutterQueryExecutor.inDatabaseFolder(path: "db.sqlite"));
}
