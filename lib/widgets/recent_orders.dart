import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooddelivery/data/data.dart';
import 'package:fooddelivery/models/order.dart';

class RecentOrders extends StatefulWidget {
  @override
  _RecentOrdersState createState() => _RecentOrdersState();
}

class _RecentOrdersState extends State<RecentOrders> {
  @override
  _buildRecentOrder(BuildContext context, Order order) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15.0),
      width: 320,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            width: 1.0,
            color: Colors.grey[200],
          ),
          borderRadius: BorderRadius.circular(15.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                ClipRRect(
                  borderRadius:BorderRadius.circular(15.0),
                  child: Image(
                    image: AssetImage(order.food.imageUrl),
                    height: 100.0,
                    width: 100.0,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        SizedBox(height: 4,),Text(order.food.name,style:TextStyle(fontSize: 18,fontWeight: FontWeight.bold,) ,),
                        SizedBox(height: 4,),Text(order.restaurant.name,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16.0,
                        ),overflow:TextOverflow.ellipsis,),
                        SizedBox(height: 4,),Text(order.date,style:TextStyle(fontWeight: FontWeight.w600,fontSize: 16.0,
                        ), overflow: TextOverflow.ellipsis,),],),
                  ),
                ),
              ],
            ),
          ),
          Container(margin: EdgeInsets.only(right: 20.0),
          width: 48.0,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(30),
          ),
          child: IconButton(icon: Icon(Icons.add),iconSize: 30,color: Colors.white,onPressed:(){},),)
        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Recent Orders',
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.w600, letterSpacing: 1.0),
          ),
          Container(
            height: 120,
            color: Colors.grey[50],
            child: ListView.builder(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.only(left: 10.0),
                scrollDirection: Axis.horizontal,
                itemCount: currentUser.orders.length,
                itemBuilder: (BuildContext context, int index) {
                  Order order = currentUser.orders[index];
                  return _buildRecentOrder(context, order);
                }),
          )
        ],
      ),
    );
  }
}
