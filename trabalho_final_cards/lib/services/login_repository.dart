import 'package:trabalho_final_cards/models/login.dart';
import 'package:trabalho_final_cards/utils/db_helper.dart';

class LoginRepository {
  final _table = 'login';
  final _dbHelper = DBHelper();

  Future<LoginState> getCurrent() async {
    final db = await _dbHelper.getDataBase();
    final result = await db.query(_table);
    if (result.isNotEmpty) {
      return LoginState.fromMap(result.first);
    }
    return null;
  }

  Future<void> save(LoginState loginState) async {
    final db = await _dbHelper.getDataBase();
    await db.transaction((txn) async {
      await txn.delete(_table);
      await txn.insert(_table, loginState.toMap());
    });
  }

  Future<void> clear() async {
    final db = await _dbHelper.getDataBase();
    await db.delete(_table);
    
  }
}
