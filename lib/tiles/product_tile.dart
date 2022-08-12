import 'package:kapaas/database/json/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kapaas/database/tables.dart';

class Products extends StatefulWidget {
  const Products({Key? key, required this.title, required this.img})
      : super(key: key);
  final String title;
  final String img;

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {

  List<Map<String, String>>? subCategory;

  void selectSubCategory(){
    switch( widget.title ) {
      case 'Lehenga': 
      subCategory = catLehenga;
      break;

      case 'Kurtha': 
      subCategory = catKurtha;
      break;

      case 'Saree': 
      subCategory = catSaree;
      break;

      case 'Blouse': 
      subCategory = catBlouse;
      break;

      case 'Gowns': 
      subCategory = catGown;
      break;

      case 'One Piece': 
      subCategory = catOnePiece;
      break;

      case 'Chaubandi': 
      subCategory = catChaubandi;
      break;

      case 'Daura Surwar': 
      subCategory = catDauraSurwar;
      break;

      case 'Jens Kurtha': 
      subCategory = catJensKurtha;
      break;

      case 'Suit': 
      subCategory = catSuit;
      break;

      case 'Shirt Pant': 
      subCategory = catShirtPant;
      break;
    }
  }

  @override
  Widget build(BuildContext context) {
    selectSubCategory();
    return Scaffold(
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Stack(
            children: [
              Positioned(
                child: Container(
                  height: size.height * 0.45,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(widget.img), fit: BoxFit.cover)),
                ),
              ),
              Container(
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.arrow_back_ios_new_sharp,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.more_vert_rounded,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 170,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          widget.title,
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 82, 80, 80),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )),
            ],
          ),
          Flexible(
            fit: FlexFit.loose,
            child: Padding(
              padding: EdgeInsets.all(15),
              child: GridView.builder(          
                physics: ScrollPhysics(), 
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15),
                itemCount: subCategory?.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(subCategory?[index]['imgUrl'] as String), fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      margin: EdgeInsets.only(top:115),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(100,0,0,0),
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start ,
                        children: <Widget>[
                          Container(
                            // padding: const EdgeInsets.only(top:110),
                            child:Text(
                                subCategory?[index]['title'] as String,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(255,255,255,255),
                                ),
                            ),
                          ),
                          Container(
                            child:Text(
                                subCategory?[index]['price'] as String,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(255,255,255,255),
                                ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ]));
  }
}

