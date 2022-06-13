import 'dart:io';
import 'package:fitness/constants.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class Raporlar extends StatefulWidget {
   static const String sayfaName = "/Raporlar";

  @override
  _RaporlarState createState() => _RaporlarState();
}

class _RaporlarState extends State<Raporlar> {
  int? selectedId;
 late int sliderDeger=65;
 var time=DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
              Color.fromRGBO(19, 20, 41, 0.95),
              Color.fromRGBO(19, 20, 41, 1),
            ])),
          ),
          title: Text("KİLO TAKİP SİSTEMİ"),
          centerTitle: true,
        ),
        bottomNavigationBar: const AltMenu(),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
              Color.fromRGBO(19, 20, 41, 0.95),
              Color.fromRGBO(19, 20, 41, 1),
            ])),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                margin: EdgeInsets.all(3),
                child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Slider(value: sliderDeger.toDouble(), 
                  min: 45.0,
                  max: 220.0,
                  onChanged: (yeniSliderDeger){
                    setState(() {
                    sliderDeger=yeniSliderDeger.round();
                    });
                  }),
                  Text(sliderDeger.toString(),style: TextStyle(fontSize: 15,color: Colors.white,)),
                ],
            ),
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                    Color.fromRGBO(19, 20, 41, 0.95),
                    Color.fromRGBO(19, 20, 41, 1),
                  ])),
                  child: FutureBuilder<List<Grocery>>(
                      future: DatabaseHelper.instance.getGroceries(),
                      builder: (BuildContext context,
                          AsyncSnapshot<List<Grocery>> snapshot) {
                        if (!snapshot.hasData) {
                          return Center(child: Text('Loading...',style: const TextStyle(color: Colors.white,fontSize: 18,)));
                        }
                        return snapshot.data!.isEmpty
                            ? Center(child: Text('Lütfen kilonuzu ekleyin.',style: TextStyle(color: Colors.white,fontSize: 18,),))
                            : ListView(
                                children: snapshot.data!.map((grocery) {
                                  return Center(
                                    child: Card(
                                      color: selectedId == grocery.id
                                          ? Colors.white70
                                          : Colors.white,
                                      child: ListTile(
                                        title: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(grocery.name),
                                            Text(grocery.time)
                                          ],
                                        ),
                                        onTap: () {
                                          setState(() {
                                            if (selectedId == null) {
                                              sliderDeger = grocery.name as int;
                                              selectedId = grocery.id;
                                            } else {
                                              sliderDeger = 0;
                                              selectedId = null;
                                            }
                                          });
                                        },
                                        onLongPress: () {
                                          setState(() {
                                            DatabaseHelper.instance.remove(grocery.id!);
                                          });
                                        },
                                      ),
                                    ),
                                  );
                                }).toList(),
                              );
                      }),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xff4338CA),
          child: Icon(Icons.save),
          onPressed: () async {
            selectedId != null
                ? await DatabaseHelper.instance.update(
                    Grocery(id: selectedId, name: sliderDeger.toString(),time: time.toString()),
                  )
                : await DatabaseHelper.instance.add(
                    Grocery(name: sliderDeger.toString(), time: time.toString()),
                  );
            setState(() {
              selectedId = null;
            });
          },
        ),
      
    );
  }
}

class Grocery {
  final int? id;
  final String name;
  final String time;

  Grocery({this.id, required this.name,required this.time});

  factory Grocery.fromMap(Map<String, dynamic> json) => new Grocery(
        id: json['id'],
        name: json['name'],
         time: json['time']
      );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'time': time,
    };
  }
}

class DatabaseHelper {
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;
  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'VeriTabani.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE groceries(
          id INTEGER PRIMARY KEY,
          name TEXT,
          time TEXT
      )
      ''');
  }

  Future<List<Grocery>> getGroceries() async {
    Database db = await instance.database;
    var groceries = await db.query('groceries', orderBy: 'name');
    List<Grocery> groceryList = groceries.isNotEmpty
        ? groceries.map((c) => Grocery.fromMap(c)).toList()
        : [];
    return groceryList;
  }

  Future<int> add(Grocery grocery) async {
    Database db = await instance.database;
    return await db.insert('groceries', grocery.toMap());
  }

  Future<int> remove(int id) async {
    Database db = await instance.database;
    return await db.delete('groceries', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> update(Grocery grocery) async {
    Database db = await instance.database;
    return await db.update('groceries', grocery.toMap(),
        where: "id = ?", whereArgs: [grocery.id]);
  }
}