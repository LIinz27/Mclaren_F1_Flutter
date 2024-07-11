import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String userName = "";
  String userEmail = "";

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final storedUserName = prefs.getString('userName') ?? '';
      final storedUserEmail = prefs.getString('userEmail') ?? '';

      setState(() {
        userName = storedUserName;
        userEmail = storedUserEmail;
      });
    } catch (error) {
      print("Error retrieving user data: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        title: Text(
          'My Profile',
          style: TextStyle(
            fontFamily: 'Metropolis-Black',
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.orange,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/Senna.jpg'),
                ),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userName,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Metropolis-Bold',
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      userEmail,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white.withOpacity(0.6),
                        fontFamily: 'Metropolis-Thin',
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 40),
            Divider(color: Colors.black),
            ProfileMenuItem(title: 'My Orders', subtitle: 'Already have 12 orders'),
            ProfileMenuItem(title: 'Shipping Addresses', subtitle: '3 addresses'),
            ProfileMenuItem(title: 'Payment Methods', subtitle: 'Visa **34'),
            ProfileMenuItem(title: 'Promocodes', subtitle: 'You have special promocodes'),
            ProfileMenuItem(title: 'My Reviews', subtitle: 'Reviews for 4 items'),
            ProfileMenuItem(title: 'Settings', subtitle: 'Notifications, password'),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class ProfileMenuItem extends StatelessWidget {
  final String title;
  final String subtitle;

  const ProfileMenuItem({
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.black),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Metropolis-Semibold',
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white.withOpacity(0.6),
                    fontFamily: 'Metropolis-Thin',
                  ),
                ),
              ],
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 18,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
