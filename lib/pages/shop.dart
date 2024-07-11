import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Shop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              // Header
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.asset(
                      'assets/product/header.jpg',
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 10,
                    child: Text(
                      'Formula 1 Collection',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Metropolis',
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Sale Section
              _buildSectionHeader(context, 'Sale', 'Super summer sale', onTapViewAll: () {
                // Add your View all functionality here
              }),
              SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: <Widget>[
                    _buildProductCard(
                      context: context,
                      image: 'assets/product/sale1.jpg',
                      name: 'Teamwear Hybrid',
                      oldPrice: 2130000,
                      newPrice: 1499000,
                    ),
                    _buildProductCard(
                      context: context,
                      image: 'assets/product/sale2.jpg',
                      name: 'Teamwear Hooded',
                      oldPrice: 2023000,
                      newPrice: 1299000,
                    ),
                    _buildProductCard(
                      context: context,
                      image: 'assets/product/sale3.jpg',
                      name: 'Teamwear Longline',
                      oldPrice: 2499000,
                      newPrice: 1990000,
                    ),
                    _buildProductCard(
                      context: context,
                      image: 'assets/product/sale4.jpg',
                      name: 'Teamwear T-Shirt',
                      oldPrice: 800000,
                      newPrice: 680000,
                    ),
                    _buildProductCard(
                      context: context,
                      image: 'assets/product/sale5.jpg',
                      name: 'Junior Teamwear Hooded',
                      oldPrice: 999999,
                      newPrice: 799000,
                    ),
                    _buildProductCard(
                      context: context,
                      image: 'assets/product/sale6.jpg',
                      name: 'AERO-Active',
                      oldPrice: 2769000,
                      newPrice: 2290000,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // New Section
              _buildSectionHeader(context, 'New', "You've never seen it before!", onTapViewAll: () {
                // Add your View all functionality here
              }),
              SizedBox(height: 10),
              _buildProductGrid(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title, String subtitle, {Function? onTapViewAll}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: 'Metropolis',
              ),
            ),
            GestureDetector(
              onTap: onTapViewAll as void Function()?,
              child: Text(
                'View all',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Metropolis',
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 5),
        Text(
          subtitle,
          style: TextStyle(
            fontWeight: FontWeight.w300,
            fontFamily: 'Metropolis',
          ),
        ),
      ],
    );
  }

  Widget _buildProductCard({required BuildContext context, required String image, required String name, int? oldPrice, int? newPrice}) {
    final discount = oldPrice != null && newPrice != null ? '${(((oldPrice - newPrice) / oldPrice) * 100).toStringAsFixed(0)}%' : null;

    return Container(
      width: 150,
      margin: EdgeInsets.only(right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  image,
                  width: 150,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              if (discount != null)
                Positioned(
                  top: 10,
                  left: 10,
                  child: Container(
                    color: Colors.red,
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Text(
                      discount,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Metropolis',
                      ),
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            name,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontFamily: 'Metropolis',
            ),
          ),
          if (oldPrice != null)
            Text(
              formatCurrency(oldPrice),
              style: TextStyle(
                color: Colors.grey,
                decoration: TextDecoration.lineThrough,
                fontFamily: 'Metropolis',
              ),
            ),
          if (newPrice != null)
            Text(
              formatCurrency(newPrice),
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontFamily: 'Metropolis',
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildProductGrid(BuildContext context) {
    final items = [
      _buildProductCardGrid(
        context: context,
        image: 'assets/product/product1.jpg',
        name: "Monaco Senna '1' Tee",
        oldPrice: 799000,
      ),
      _buildProductCardGrid(
        context: context,
        image: 'assets/product/product2.jpg',
        name: 'Monaco Senna Script Hoodie',
        oldPrice: 1385000,
      ),
      _buildProductCardGrid(
        context: context,
        image: 'assets/product/product3.jpg',
        name: 'Oscar Piastri Australia 9Fifty PC',
        oldPrice: 874000,
      ),
      _buildProductCardGrid(
        context: context,
        image: 'assets/product/product4.jpg',
        name: 'Monaco Senna Script Hoodie',
        oldPrice: 1385000,
      ),
      _buildProductCardGrid(
        context: context,
        image: 'assets/product/product5.jpg',
        name: "Monaco Senna '27' Tee",
        oldPrice: 799000,
      ),
      _buildProductCardGrid(
        context: context,
        image: 'assets/product/product6.jpg',
        name: 'McLaren Formula 1 Team - 1.80 - World Record Fastest Pit Stop - 2023',
        oldPrice: 554000,
      ),
      _buildProductCardGrid(
        context: context,
        image: 'assets/product/product7.jpg',
        name: 'Born To Race Hoodie',
        oldPrice: 1385000,
      ),
      _buildProductCardGrid(
        context: context,
        image: 'assets/product/product8.jpg',
        name: 'Teamwear Polo Shirt',
        oldPrice: 1598000,
      ),
    ];

    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: items,
    );
  }

  Widget _buildProductCardGrid({required BuildContext context, required String image, required String name, required int oldPrice}) {
    return Container(
      width: (MediaQuery.of(context).size.width - 48) / 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              image,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 10),
          Text(
            name,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontFamily: 'Metropolis',
            ),
          ),
          Text(
            formatCurrency(oldPrice),
            style: TextStyle(
              color: Colors.grey,
              fontFamily: 'Metropolis',
            ),
          ),
        ],
      ),
    );
  }

  String formatCurrency(int value) {
    final format = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp');
    return format.format(value);
  }
}
