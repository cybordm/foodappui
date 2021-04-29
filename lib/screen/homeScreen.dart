import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:fooddelivery/data/data.dart';
import 'package:fooddelivery/screen/restaurantscreen.dart';
import 'package:fooddelivery/widgets/ratingstars.dart';
import 'package:fooddelivery/widgets/recent_orders.dart';
import 'package:fooddelivery/models/restaurant.dart';
import 'package:fooddelivery/screen/restaurantscreen.dart';

import 'cart_screen.dart';

class homeScreen extends StatefulWidget {
  @override
  _homeScreenState createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  _buildRestaurants() {
    List<Widget> restaurantList = [];
    restaurants.forEach((Restaurant restaurant) {
      restaurantList.add(GestureDetector(
        onTap:()=> Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => RestaurantScreen(restaurant: restaurant))),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 1.0, color: Colors.grey[200]),
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Expanded(
            child: Row(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Hero(
                      tag: restaurant.imageUrl,
                      child: Image(
                        height: 150,
                        width: 150,
                        image: AssetImage(restaurant.imageUrl),
                        fit: BoxFit.cover,
                      ),
                    )),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          restaurant.name,
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(restaurant.address,
                            style: TextStyle(
                                fontSize: 14.0, fontWeight: FontWeight.w600),
                            overflow: TextOverflow.ellipsis),
                        SizedBox(
                          height: 4,
                        ),
                        Text('0.2 miles away',
                            style: TextStyle(
                                fontSize: 14.0, fontWeight: FontWeight.w600),
                            overflow: TextOverflow.ellipsis),
                        SizedBox(
                          height: 4,
                        ),
                        RatingStars(restaurant.rating),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ));
    });
    return Column(
      children: restaurantList,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.account_circle),
          iconSize: 30,
          onPressed: () {},
        ),
        title: Center(child: Text('Food Delivery')),
        actions: [
          TextButton(
              onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (_)=>CartScreen(),));},
              child: Text(
                'Cart(${currentUser.cart.length})',
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ))
        ],
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Padding(
            padding: EdgeInsets.all((20.0)),
            child: TextField(
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide(width: 0.8),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide(
                        width: 0.8, color: Theme.of(context).primaryColor),
                  ),
                  hintText: 'Search for food or Restaurants',
                  prefixIcon: Icon(
                    Icons.search,
                    size: 30.0,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: null,
                  )),
            ),
          ),
          RecentOrders(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Nearby Restaurents',
                  style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.0),
                ),
              ),
              _buildRestaurants(),
            ],
          )
        ],
      ),
    );
  }
}
