import 'package:flutter/widgets.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'user.dart';

// ignore: camel_case_types
class connectionDB {
  bool userselected = false;

  Future<Database> getDatabase() async {
    // Get a reference to the database
    var db = await openDatabase('databaseHelper.db');
    return db;
  }

  void registerUser(List<TextEditingController> userData) async {
    WidgetsFlutterBinding.ensureInitialized();

    // Opening the database and storing the reference.
    // final database = openDatabase(
    //   join(await getDatabasesPath(), 'databaseHelper.db'),
    // );

    // Get a reference to the database
    final Database db = await getDatabase();
    // Define a function to delete a table from the database
    // Future<void> deleteTable(String tableName) async {
    //   // Execute a DROP TABLE statement to delete the table
    //   await db.execute('DROP TABLE IF EXISTS $tableName');
    // }

    // Delete the users table from the database
    //await deleteTable('users');

    // Future<void> createUsersTable(Database db) async {
    //   await db.execute('''
    //   CREATE TABLE IF NOT EXISTS users(
    //     userId INTEGER PRIMARY KEY,
    //     fullName TEXT,
    //     email TEXT UNIQUE,
    //     password TEXT
    //   )
    // ''');
    // }

    //creates a user table
    //await createUsersTable(db);

    // Define a function to insert a user into the database
    Future<void> insertUser(User user) async {
      // Insert the user into the users table
      try {
        await db.insert(
          'user',
          user.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      } on DatabaseException catch (e) {
        // Handle the error
        print('Error inserting user: $e');
      }
    }

    // Create a new user
    final newUser = User(
        fullName: userData[0].text,
        email: userData[1].text,
        password: userData[2].text);

    // Insert the new user into the database
    await insertUser(newUser);

    // //fetching inserted user data
    Future<List<User>> getUsers() async {
      // Query the users table
      final List<Map<String, dynamic>> maps = await db.query('user');

      // Convert the List<Map<String, dynamic>> into a List<User>
      return List.generate(maps.length, (i) {
        return User.fromMap(maps[i]);
      });
    }

    // // Retrieve all users from the database
    final users = await getUsers();

    // // Print the list of users
    print(users.toString());

    // //FOR TABLES LIST
    // Future<List<String>> getTables() async {
    //   // Query the sqlite_master table to get a list of all tables
    //   final List<Map<String, dynamic>> result = await db
    //       .rawQuery('SELECT name FROM sqlite_master WHERE type="table"');

    //   // Convert the result into a List<String>
    //   return result.map((row) => row['name'] as String).toList();
    // }

    // // Get a list of all tables in the database
    // final tables = await getTables();

    // // Print the list of tables
    // print('List of tables: $tables');
  }

  void loginValidation(String email, String password) async {
    WidgetsFlutterBinding.ensureInitialized();
    final Database db = await getDatabase();

    // Query the users table
    final List<Map<String, dynamic>> maps = await db.query(
      'user',
      columns: ['User_Id'],
      where: 'Email = ? AND Password = ?',
      whereArgs: [email, password],
    );

    if (maps.isNotEmpty) {
      userselected = true;
    }
    // Convert the List<Map<String, dynamic>> into a List<User>
    // return List.generate(maps.length, (i) {
    //   return User.fromMap(maps[i]);
    // });
  }
}
