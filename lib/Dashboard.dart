import 'package:flutter/material.dart';
import 'Models/coffee_items.dart';
import 'collor_pallete.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Widgets/search_bar.dart';
import 'package:iconify_flutter/icons/fluent_mdl2.dart';
import 'package:iconify_flutter/icons/ph.dart';
import 'package:iconify_flutter/icons/ri.dart';
import 'package:iconify_flutter/icons/heroicons_solid.dart';
import 'screens/item_details.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final List<String> coffeeTypes = [
    'Cappuccino',
    'Espresso',
    'Latte',
    'Flat White',
  ];
  int counter = -1;
  String selectedItem = 'Cappuccino';
  final List<CoffeeItem> coffeeList = [
    CoffeeItem(
        rating: 4.5,
        itemImage: 'assets/coffeemain.jpg',
        prize: 4.20,
        subtitle: 'With Oat Milk',
        title: 'Cappuccino'),
    CoffeeItem(
        rating: 4.2,
        itemImage: 'assets/secondary.jpg',
        prize: 3.14,
        subtitle: 'With Chocolate',
        title: 'Cappuccino'),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: _buildBottomBar(),
        backgroundColor: ColorPallete().scaffoldbg,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                          padding: EdgeInsets.all(7.0),
                          height: 42.0,
                          width: 42.0,
                          decoration: BoxDecoration(
                              color: Color(0xff1f242c),
                              borderRadius: BorderRadius.circular(12.0)),
                          child: Iconify(
                            HeroiconsSolid.view_grid,
                            size: 12.0,
                            color: Color(0xFF4D4F52),
                          )),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.all(7.0),
                        height: 42.0,
                        width: 42.0,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/model.png'),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(12.0)),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 15.0, top: 15.0),
                width: (MediaQuery.of(context).size.width / 3) * 2 + 25.0,
                child: Text('Find the best coffee for you',
                    style: GoogleFonts.sourceSansPro(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ),
              SizedBox(height: 20.0),
              SearchBar(),
              SizedBox(height: 20.0),
              Padding(
                padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
                child: ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return LinearGradient(
                            begin: Alignment(0.7, -1.0),
                            end: Alignment(1.0, -1.0),
                            colors: <Color>[Colors.black, Colors.transparent])
                        .createShader(bounds);
                  },
                  blendMode: BlendMode.dstATop,
                  child: Container(
                    color: Color(0xff0d0f14),
                    height: 40.0,
                    width: MediaQuery.of(context).size.width - 20.0,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        ...coffeeTypes.map((e) {
                          counter++;
                          if (counter <= 3)
                            return _buildTypes(e, counter);
                          else {
                            counter = 0;
                            return _buildTypes(e, counter);
                          }
                        }).toList()
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: (MediaQuery.of(context).size.height / 2) - 50.0,
                width: MediaQuery.of(context).size.width,
                child: ListView(
                  padding: EdgeInsets.only(top: 5.0),
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 15.0, right: 15.0),
                      child: Container(
                        color: Color(0xff0d0f14),
                        width: MediaQuery.of(context).size.width,
                        height: 225.0,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            ...coffeeList.map((e) {
                              return _buildCoffeeItem(e);
                            }).toList(),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: 15.0, right: 15.0, top: 10.0),
                      child: Text('Special for you',
                          style: GoogleFonts.sourceSansPro(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15, right: 15, top: 10),
                      child: Container(
                        height: 125.0,
                        padding: EdgeInsets.all(10.0),
                        width: MediaQuery.of(context).size.width - 20,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: <Color>[
                                  ColorPallete().gradientTopLeft,
                                  Colors.black
                                ])),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 115,
                              width: 130,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  image: DecorationImage(
                                      image:
                                          AssetImage('assets/beansbottom.jpg'),
                                      fit: BoxFit.cover)),
                            ),
                            Container(
                              height: 115,
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(top: 20.0),
                                    height: 100,
                                    width: MediaQuery.of(context).size.width -
                                        185.0,
                                    child: Text(
                                      '5 Coffee Beans You Must Try!',
                                      style: GoogleFonts.sourceSansPro(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17,
                                          color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTypes(coffee, counter) {
    return Padding(
      padding: counter != 0
          ? EdgeInsets.only(left: 25.0)
          : EdgeInsets.only(left: 7.0),
      child: Container(
        height: 50.0,
        color: Color(0xff0d0f14),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedItem = coffee;
                });
              },
              child: Text(coffee,
                  style: GoogleFonts.sourceSansPro(
                    fontWeight: FontWeight.bold,
                    color: coffee == selectedItem
                        ? ColorPallete().coffeeSelected
                        : ColorPallete().coffeeUnselected,
                    fontSize: 17.0,
                  )),
            ),
            SizedBox(height: 4.0),
            Container(
              height: 8.0,
              width: 8.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  color: coffee == selectedItem
                      ? ColorPallete().coffeeSelected
                      : Colors.transparent),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomBar() {
    return Container(
      padding: EdgeInsets.only(left: 25.0, right: 25.0),
      height: 50.0,
      decoration: BoxDecoration(color: Color(0xff1a1819)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Iconify(FluentMdl2.home_solid, color: Color(0xffd17742)),
          Iconify(Ph.handbag_fill, color: Color(0xff4e4f53)),
          Iconify(Ri.heart_2_fill, color: Color(0xff4e4f53)),
          Container(
            child: Stack(
              children: [
                Iconify(HeroiconsSolid.bell, color: Color(0xff4e4f53)),
                Positioned(
                  top: 2.0,
                  left: 15.0,
                  child: Container(
                    height: 7.0,
                    width: 7.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3.5),
                        color: Colors.red),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCoffeeItem(CoffeeItem cItem) {
    return Padding(
      padding: EdgeInsets.only(left: 10.0, right: 10.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ItemDetails(
                        cItem: cItem,
                      )));
        },
        child: Container(
          height: 200.0,
          width: 150.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[ColorPallete().gradientTopLeft, Colors.black],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 140.0,
                width: 150.0,
                child: Stack(
                  children: [
                    Positioned(
                      top: 10.0,
                      left: 10.0,
                      child: Hero(
                        tag: cItem.title.toString(),
                        child: Container(
                          height: 120.0,
                          width: 130.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(cItem.itemImage.toString()),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 10.0,
                      right: 10.0,
                      child: Container(
                        height: 20.0,
                        width: 50.0,
                        decoration: BoxDecoration(
                            color: Color(0xFF342520).withOpacity(0.7),
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(15),
                                topRight: Radius.circular(15))),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(Icons.star,
                                  color: ColorPallete().coffeeSelected,
                                  size: 15.0),
                              Text(
                                cItem.rating.toString(),
                                style: GoogleFonts.sourceSansPro(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  cItem.title.toString(),
                  style: GoogleFonts.sourceSansPro(
                      color: Colors.white, fontSize: 17.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, bottom: 5.0),
                child: Text(
                  cItem.subtitle.toString(),
                  style: GoogleFonts.sourceSansPro(
                      color: Colors.white, fontSize: 12.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text('\$',
                            style: GoogleFonts.sourceSansPro(
                                color: ColorPallete().coffeeSelected,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0)),
                        Text(cItem.prize.toString(),
                            style: GoogleFonts.sourceSansPro(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0)),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 30.0,
                        width: 30.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: ColorPallete().coffeeSelected),
                        child: Icon(Icons.add, color: Colors.white, size: 20),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
