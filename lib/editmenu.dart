import 'dart:math';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Editmenu extends StatefulWidget {
  const Editmenu({super.key});

  @override
  State<Editmenu> createState() => _EditmenuState();
}

class _EditmenuState extends State<Editmenu> {
  // deklarasi variable
  final dio = Dio();
  final storage = FlutterSecureStorage();
  String token = '';
  String user_id = '';
  String nameError = '';
  String priceError = '';
  String descriptionError = '';

  late int menu_id;
  late String name;
  late String price;
  late String description;


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final args = ModalRoute.of(context)!.settings.arguments as Map;
    menu_id = args['menu_id'];
    name = args['name'];
    price = args['price'];
    description = args['description'];

    // set nilai awal untuk controller
    setState(() {
      nameController.text = name;
      priceController.text = price;
      descriptionController.text = description;
    });
  }


  // simpan nilai input ke dalam variabe
  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final descriptionController = TextEditingController();

  // init state
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }


  // load data
  Future<void> loadData() async {
    await getDataUser();
  }

  // load data user
  Future<void> getDataUser() async {
    final token_storage = await storage.read(key: 'token');
    final user_id_storage = await storage.read(key: 'user_id');
    setState(() {
      token = token_storage ?? '';
      user_id = user_id_storage ?? '';
    });
  }

  // update data menu
  Future<void> updateMenu() async {
    setState(() {
      nameError = '';
      priceError = '';
      descriptionError = '';
    });


    try {
      final response = await dio.post('http://192.168.43.247:8000/api/menu/update/$menu_id', 
        data: {
          'name': nameController.text,
          'price': priceController.text,
          'description': descriptionController.text,
          'user_id': user_id
        },
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer ' + token,
          }
        )
      );

      if (response.statusCode == 200) {
        Navigator.pushNamedAndRemoveUntil(context, '/main', (route) => false);
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 422) {

        // filed yang tersedia
        List fields = ["name", "price", "description"];

        // lakukan for loop untuk mengecek setiap field
        for (var i = 0; i < fields.length; i++) {
          // akses filed sesuai index
          var field = fields[i];

          // cek apakah field ada di error
          if (e.response?.data['errors'][field] != null) {
            setState(() {
              // kualifikasikan error sesuai field
              if (field == "name") {
                nameError = e.response?.data['errors'][field][0];
              } else if (field == "price") {
                priceError = e.response?.data['errors'][field][0];
              } else if (field == "description") {
                descriptionError = e.response?.data['errors'][field][0];
              }
            });
          }
        }

      }
    }
    catch (e) {
      print(e);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff99BC85),
        title: Text("NEW MENU", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("New Menu", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Color(0xff3E3C3C)),),
                  Text("Silahkan masukan data menu di bawah ini", style: TextStyle(fontSize: 12, color: Color(0xff3E3C3C)),),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 20)),
            Container(
              decoration: BoxDecoration(
                color: Color(0xffE4EFE7),
                borderRadius: BorderRadius.circular(16), 
              ),
              child: Container(
                padding: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Nama menu"),
                          TextField(
                            controller: nameController,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xff99BC85), width: 2),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                            )
                          ),
                          if (nameError != '')
                          Text(nameError, style: TextStyle(color: Colors.red),)
                        ],
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 15)),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Deskirpsi"),
                          TextField(
                            controller: descriptionController,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xff99BC85), width: 2),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                            )
                          ),
                          if (descriptionError != '')
                          Text(descriptionError, style: TextStyle(color: Colors.red),)
                        ],
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 15)),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Harga"),
                          TextField(
                            controller: priceController,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xff99BC85), width: 2),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                            )
                          ),
                          if (priceError != '')
                          Text(priceError, style: TextStyle(color: Colors.red),)
                        ],
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 15)),
                    ElevatedButton(
                      onPressed: () {
                        updateMenu();
                      }, 
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff99BC85),
                      ),
                      child: Text("Simpan", style: TextStyle(color: Colors.white),),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}