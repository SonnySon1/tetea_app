import 'package:flutter/material.dart';


class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff99BC85),
        title: Text("HOME", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: ListView(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
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
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(onPressed: (){}, icon: Icon(Icons.edit, size: 14, color: Color(0xff99BC85),) ),
                    IconButton(onPressed: (){}, icon: Icon(Icons.delete, size: 14, color: Colors.red,) ),
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
                              Text("Lemon Tea", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xff3E3C3C)),),
                              Text(
                              "lorem ipsum dolor sit amet consectetur adipiscing elit nulla vestibulum",
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xff3E3C3C),
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                              Text("Rp. 15.000", style: TextStyle(fontSize: 15, color: Color(0xff99BC85), fontWeight: FontWeight.bold),),
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
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(onPressed: (){}, icon: Icon(Icons.edit, size: 14, color: Color(0xff99BC85),) ),
                    IconButton(onPressed: (){}, icon: Icon(Icons.delete, size: 14, color: Colors.red,) ),
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
                              Text("Lemon Tea", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xff3E3C3C)),),
                              Text(
                              "lorem ipsum dolor sit amet consectetur adipiscing elit nulla vestibulum",
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xff3E3C3C),
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                              Text("Rp. 15.000", style: TextStyle(fontSize: 15, color: Color(0xff99BC85), fontWeight: FontWeight.bold),),
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
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(onPressed: (){}, icon: Icon(Icons.edit, size: 14, color: Color(0xff99BC85),) ),
                    IconButton(onPressed: (){}, icon: Icon(Icons.delete, size: 14, color: Colors.red,) ),
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
                              Text("Lemon Tea", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xff3E3C3C)),),
                              Text(
                              "lorem ipsum dolor sit amet consectetur adipiscing elit nulla vestibulum",
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xff3E3C3C),
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                              Text("Rp. 15.000", style: TextStyle(fontSize: 15, color: Color(0xff99BC85), fontWeight: FontWeight.bold),),
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
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(onPressed: (){}, icon: Icon(Icons.edit, size: 14, color: Color(0xff99BC85),) ),
                    IconButton(onPressed: (){}, icon: Icon(Icons.delete, size: 14, color: Colors.red,) ),
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
                              Text("Lemon Tea", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xff3E3C3C)),),
                              Text(
                              "lorem ipsum dolor sit amet consectetur adipiscing elit nulla vestibulum",
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xff3E3C3C),
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                              Text("Rp. 15.000", style: TextStyle(fontSize: 15, color: Color(0xff99BC85), fontWeight: FontWeight.bold),),
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
      ),
    );
  }
}