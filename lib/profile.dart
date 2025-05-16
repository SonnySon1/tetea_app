import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:dio/dio.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  // inisialisasi nilai variable
  final Dio dio = Dio();
  final storage = FlutterSecureStorage();
  String token = '';
  String user_name = '';


  // initState
  @override
  void initState() {
    super.initState();
    getDataUser();
  }

  // panggi data dari storage
  Future<String?> getDataUser() async {
    final token_storage     = await storage.read(key: 'token');
    final user_name_storage = await  storage.read(key: 'user_name');

    setState(() {
      token = token_storage ?? '';
      user_name = user_name_storage ?? '';
    });
  }


  // future logout
  Future<void> logout() async {
    await dio.get('http://192.168.43.247:8000/api/signout', options: Options(
      headers: {'Authorization': 'Bearer ' + token})
    );

    await storage.delete(key: 'token');
    await storage.delete(key: 'user_id');
    await storage.delete(key: 'user_name');

    Navigator.pushReplacementNamed(context, '/signin');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff99BC85),
        title: Text("PROFILE", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
      ),
      body: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Profile",
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Color(0xff3E3C3C)),
                    ),
                    Text(
                      "Informasi akun anda",
                      style: TextStyle(fontSize: 12, color: Color(0xff3E3C3C)),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.only(top: 60)),
                Center(
                  child: Column(
                    children: [
                      Image.network(
                        "https://i.pinimg.com/736x/15/0f/a8/150fa8800b0a0d5633abc1d1c4db3d87.jpg",
                        width: 100,
                        height: 100,
                      ),
                      Padding(padding: EdgeInsets.only(top: 20)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            user_name,
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xff3E3C3C)),
                          ),
                          Padding(padding: EdgeInsets.only(left: 10)),
                          Container(
                            padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Color(0xffE4EFE7),
                            ),
                            child: Text("Admin", style: TextStyle(fontSize: 12, color: Color(0xff99BC85)),),
                          )
                        ],
                      ),

                      Padding(padding: EdgeInsets.only(top: 50)),
                      ElevatedButton(
                        onPressed: (){
                          // Navigator.pushReplacementNamed(context, '/signin');
                          logout();
                        }, 
                        style: ElevatedButton.styleFrom(backgroundColor: Color(0xff99BC85)),
                        child: Text("Sign Out", style: TextStyle(color: Colors.white),),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

    );
  }
}