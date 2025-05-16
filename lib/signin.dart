import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class Signin extends StatefulWidget {
  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  // deklarasi variabel
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final Dio _dio = Dio();
  String _errorMessage = '';

  // deklarasi fungsi
  Future<void> _signin() async {
          try {
            final response = await _dio.post('http://192.168.43.247:8000/api/signin', 
            data: {
              'username': _usernameController.text,
              'password': _passwordController.text
            },
            options: Options(
              headers: {
                'Accept': 'application/json'
              }
            )
          );


          if (response.statusCode == 200) {
            final data = response.data['data'];
            final token = data['token'];
            final user = data['user'];

            print('Token: $token');
            print('User: $user');

            Navigator.pushReplacementNamed(context, '/main');
          }
        } on DioException catch (e) {
            if (e.response?.statusCode == 422) {
              final errorData = e.response?.data;
              setState(() {
                _errorMessage = errorData['message'] ?? 'Validasi gagal';
              });
              print('Error detail: ${errorData}');
            } else {
              setState(() {
                _errorMessage = 'Terjadi kesalahan jaringan';
              });
              print('Error: ${e.message}');
            }
        } catch (e) {
          setState(() {
            _errorMessage = 'Terjadi kesalahan tidak diketahui';
          });
          print('Unexpected error: $e');
        }
  }




  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
        padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Sign In", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Color(0xff3E3C3C)),),
              Text("Silahkan lakukan sign in untuk mengakses fitur lainnya", style: TextStyle(fontSize: 12, color: Color(0xff3E3C3C)),),
              Padding(padding: EdgeInsets.only(top: 20)),
              Container(
                decoration: BoxDecoration(
                 color: Color(0xffE4EFE7),// warna background
                  borderRadius: BorderRadius.circular(16), // sudut membulat 16 pixel
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
                            Text("Username"),
                            TextField(
                              controller: _usernameController,
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
                            )
                          ],
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 15)),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Password"),
                            TextField(
                              controller: _passwordController,
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
                            )
                          ],
                        ),
                      ),
                      if (_errorMessage.isNotEmpty)
                        Padding(
                          padding: EdgeInsets.only(top: 15),
                          child: Text(
                            _errorMessage,
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      Padding(padding: EdgeInsets.only(top: 15)),
                      ElevatedButton(
                        onPressed: () {
                          // Navigator.pushReplacementNamed(context, '/main');
                          _signin();
                        }, 
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff99BC85),
                        ),
                        child: Text("Sign In", style: TextStyle(color: Colors.white),),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}