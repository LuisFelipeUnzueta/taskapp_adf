import 'package:sqflite_common/sqlite_api.dart';
import 'package:task_app_adf/app/core/database/migrations/migration.dart';

class MigrationV1 implements Migration {
  @override
  void create(Batch batch) {
    batch.execute('''
      create table todo(
        id Integer primary key autoincrement,
        descricao varchar(500) not null,
        data_hora datetime,
        finalizado integer
      )
      ''');
  }

  @override
  void update(Batch batch) {}
}
