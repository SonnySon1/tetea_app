import 'package:flutter/material.dart';


class Profile extends StatelessWidget {
  const Profile({super.key});

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
                            "Userxxxxxxx",
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
                          Navigator.pushReplacementNamed(context, '/signin');
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