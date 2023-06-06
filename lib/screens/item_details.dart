import 'dart:ffi';

import 'package:coffee_ui2/Models/coffee_items.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:coffee_ui2/collor_pallete.dart';
// import 'package:colorful_iconify_flutter/icons/vscode_icons.dart';
import 'package:iconify_flutter/iconify_flutter.dart';

class ItemDetails extends StatefulWidget {
  final CoffeeItem cItem;
  ItemDetails({required this.cItem});

  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                  height: screenHeight,
                  width: screenWidth,
                  color: Colors.black),
              Hero(
                tag: widget.cItem.title.toString(),
                child: Container(
                  height: screenHeight / 2 + 70,
                  width: screenWidth,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(widget.cItem.itemImage!),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              Positioned(
                top: 35.0,
                left: 10.0,
                child: Container(
                  height: 50.0,
                  width: screenWidth - 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: 45.0,
                          width: 45.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              color: Color(0xff14181D),
                              border: Border.all(
                                  color: Color(0xff322b2e), width: 1.0)),
                          child: Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: Color(0xff525154),
                            size: 20,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 45.0,
                          width: 45.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              color: Color(0xff14181D),
                              border: Border.all(
                                  color: Color(0xff322b2e), width: 1.0)),
                          child: Icon(
                            Icons.favorite_rounded,
                            color: Color(0xff525154),
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: (screenHeight / 2) - 30.0,
                child: GlassContainer(
                  height: 150.0,
                  width: screenWidth,
                  blur: 4,
                  borderRadius: BorderRadius.circular(30.0),
                  border: Border.fromBorderSide(BorderSide.none),
                  color: Colors.black.withOpacity(0.6),
                  child: Container(
                    height: 140.0,
                    width: screenWidth - 20.0,
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 25.0),
                          width: (screenWidth - 20) / 2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.cItem.title!,
                                style: GoogleFonts.sourceSansPro(
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              Text(widget.cItem.subtitle!,
                                  style: GoogleFonts.sourceSansPro(
                                      fontSize: 17.0, color: Colors.white)),
                              SizedBox(height: 10.0),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Icon(Icons.star,
                                      color: ColorPallete().coffeeSelected,
                                      size: 22.0),
                                  SizedBox(width: 10.0),
                                  Text(
                                    widget.cItem.rating.toString(),
                                    style: GoogleFonts.sourceSansPro(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 17.0),
                                  ),
                                  SizedBox(width: 5.0),
                                  Text(
                                    '(6,986)',
                                    style: GoogleFonts.sourceSansPro(
                                        color: Colors.white, fontSize: 15),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 25.0),
                          height: 140.0,
                          width: (screenWidth - 20) / 2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    height: 50.0,
                                    width: 50.0,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        color: Color(0xFF0F1419)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.coffee,
                                          color: ColorPallete().coffeeSelected,
                                          size: 21.0,
                                        ),
                                        Text(
                                          'Coffee',
                                          style: GoogleFonts.sourceSansPro(
                                              color: Color(0xff909193),
                                              fontSize: 12),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 50.0,
                                    width: 50.0,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        color: Color(0xFF0F1419)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.water_drop_outlined,
                                          color: ColorPallete().coffeeSelected,
                                          size: 21.0,
                                        ),
                                        Text(
                                          'Milk',
                                          style: GoogleFonts.sourceSansPro(
                                              color: Color(0xff909193),
                                              fontSize: 12),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10.0),
                              Container(
                                height: 35.0,
                                width: 120.0,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color(0xFF0F1419)),
                                child: Center(
                                  child: Text(
                                    'Medium Rosted',
                                    style: GoogleFonts.sourceSansPro(
                                        fontSize: 12.0,
                                        color: Color(0xFF909193)),
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
              ),
              Positioned(
                top: (screenHeight / 2) + 140.0,
                child: Container(
                  height: (screenHeight / 2) + 140.0,
                  width: screenWidth,
                  child: ListView(
                    padding: EdgeInsets.only(left: 15.0, right: 15),
                    children: [
                      Text('Description',
                          style: GoogleFonts.sourceSansPro(
                              fontSize: 17, color: Color(0xFF999A9B))),
                      SizedBox(height: 10.0),
                      Container(
                        height: 40.0,
                        width: screenWidth - 30.0,
                        child: Text(
                            'A cappuccino is a coffee-based drink made primarily from espresso and milk...',
                            style: GoogleFonts.sourceSansPro(
                                fontSize: 17, color: Colors.white)),
                      ),
                      SizedBox(height: 10.0),
                      Text('Size',
                          style: GoogleFonts.sourceSansPro(
                              fontSize: 17, color: Color(0xFF999A9B))),
                      SizedBox(height: 10.0),
                      Container(
                        width: screenWidth - 30.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildSizeBotton('S', 0),
                            _buildSizeBotton('M', 1),
                            _buildSizeBotton('L', 2)
                          ],
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Container(
                        width: screenWidth - 30,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 50.0,
                              child: Column(
                                children: [
                                  Text('Price',
                                      style: GoogleFonts.sourceSansPro(
                                          fontSize: 17,
                                          color: Color(0xFF999A9B))),
                                  Row(
                                    children: [
                                      Text('\$',
                                          style: GoogleFonts.sourceSansPro(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: ColorPallete()
                                                  .coffeeSelected)),
                                      Text(widget.cItem.prize.toString(),
                                          style: GoogleFonts.sourceSansPro(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                              color: Colors.white)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                height: 50.0,
                                width: (screenWidth / 2) + 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.0),
                                    color: ColorPallete().coffeeSelected),
                                child: Center(
                                  child: Text(
                                    'Buy Now',
                                    style: GoogleFonts.sourceSansPro(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17.0,
                                        color: Colors.white),
                                  ),
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
            ],
          ),
        ),
      ),
    );
  }

  _buildSizeBotton(String size, int index) {
    return AnimatedContainer(
      duration: Duration(seconds: 4),
      curve: Curves.easeIn,
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedIndex = index;
          });
        },
        child: Container(
          height: 40.0,
          width: 100.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: index == selectedIndex ? Colors.black : Color(0xFF0D0F14),
              border: index == selectedIndex
                  ? Border.all(
                      color: ColorPallete().coffeeSelected,
                      style: BorderStyle.solid,
                      width: 1.0)
                  : Border.all(
                      color: Colors.black,
                      style: BorderStyle.solid,
                      width: 0.3)),
          child: Center(
            child: Text(
              size,
              style: GoogleFonts.sourceSansPro(
                  fontSize: 15,
                  color: index == selectedIndex
                      ? ColorPallete().coffeeSelected
                      : Color(0xFFADADAD)),
            ),
          ),
        ),
      ),
    );
  }
}
