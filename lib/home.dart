import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final dio = Dio();
  final storage = FlutterSecureStorage();
  String token = '';
  List data_menus  = [];

  // init state
  @override
  void initState() {
    super.initState();
    loadData();
  }


  Future<void> loadData() async {
    await getDataUser();
    await getDataMenu();
  }



  // get data user
  Future<void> getDataUser() async {
    final token_storage = await storage.read(key: 'token');
    setState(() {
      token = token_storage ?? '';
    });
  }

  // Feature get data menu
  Future<void> getDataMenu() async {
    try {
      final response = await dio.get('http://192.168.43.247:8000/api/menu',
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer ' + token,
          }
        )
      );
      
      setState(() {
        data_menus = response.data['data'];
      });

    } catch (e) {
       print(e);
    }
  }


  // Feature delete data menu
  Future<void> deleteMenu(int id) async {
    print(id);
    try {
      await dio.get('http://192.168.43.247:8000/api/menu/delete/$id', options: Options(
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ' + token,
        }
      ));

      setState(() {
        getDataMenu();
      });
    } catch (e) {
      print(e);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff99BC85),
        title: Text("HOME", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: ListView(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(top: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Home", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Color(0xff3E3C3C)),),
                        Text("Semua menu yang tersedia", style: TextStyle(fontSize: 12, color: Color(0xff3E3C3C)),),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 30),
                    child: ElevatedButton(
                      onPressed: (){
                        Navigator.pushNamed(context, '/newmenu');
                      }, 
                      child: Text("New Menu+", style: TextStyle(color: Colors.white)), 
                      style: ElevatedButton.styleFrom(backgroundColor: Color(0xff99BC85)),
                    ),
                  ),
                ),
              ],
            ),

            Padding(padding: EdgeInsets.only(top: 20)),
            
              // each data
              ...data_menus.map((data_menu) => 
                CardProduct(
                    id: data_menu['id'], 
                    name: data_menu['name'], 
                    price: data_menu['price'].toString(), 
                    description: data_menu['description'],
                    onDelete: () => deleteMenu(data_menu['id'])
                )
              ),

          ],
        ),
      ),
    );
  }
}



// card product
class CardProduct extends StatelessWidget {
  const CardProduct({this.id = 0, this.name = '', this.price = '', this.description = '', required this.onDelete});
  final int id;
  final String name;
  final String price;
  final String description;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(onPressed: (){
                     Navigator.pushNamed(
                      context,
                      '/editmenu',
                      arguments: {
                        'menu_id': id,
                        'name': name,
                        'price': price,
                        'description': description,
                      },
                    );

                    }, icon: Icon(Icons.edit, size: 14, color: Color(0xff99BC85),) ),
                    IconButton(onPressed: (){
                      onDelete();
                    }, icon: Icon(Icons.delete, size: 14, color: Colors.red,) ),
                  ],
                ),
                Card(
                  color: Color(0xffE4EFE7),
                  shadowColor: Colors.transparent,
                  child: Padding(
                    padding: EdgeInsets.all(15), 
                    child: Row(
                      children: [
                        Image.network("https://smb-padiumkm-images-public-prod.oss-ap-southeast-5.aliyuncs.com/product/image/28022024/631a656ccdc00cf233d364a3/65de90027847acddd57b5331/d81b758c4816a20a36fcb02bb716c4.jpg?x-oss-process=image/resize,m_pad,w_432,h_432/quality,Q_70", width: 100,),
                        Padding(padding: EdgeInsets.only(left: 20)),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xff3E3C3C)),),
                              Text(
                              description,
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xff3E3C3C),
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                              Text("Rp. $price", style: TextStyle(fontSize: 15, color: Color(0xff99BC85), fontWeight: FontWeight.bold),),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(padding: EdgeInsets.all(2)),
        ],
      ),
    );
  }
}