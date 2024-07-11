import 'package:flutter/material.dart';

class Team extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.orange, Colors.deepOrange],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'McLaren F1 Team',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontFamily: 'Metropolis',
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'The McLaren Formula 1 team is a British motor racing team based in Woking, Surrey, England. McLaren is best known as a Formula 1 constructor, the second oldest active team and one of the most successful teams in F1 history.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                    fontFamily: 'Metropolis',
                  ),
                ),
                SizedBox(height: 20),

                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'assets/car.jpg',
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.black.withOpacity(0.6), Colors.transparent],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),

                Text(
                  'Drivers',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontFamily: 'Metropolis',
                  ),
                ),
                SizedBox(height: 10),

                _buildDriverCard('assets/drivers/driver1.jpg', 'Lando Norris #4', 'First Driver'),
                SizedBox(height: 20),
                _buildDriverCard('assets/drivers/driver2.jpg', 'Oscar Piastri #81 ', 'Second Driver'),
                SizedBox(height: 20),

                Text(
                  'Achievements',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontFamily: 'Metropolis',
                  ),
                ),
                SizedBox(height: 10),
                _buildAchievementItem('8 Constructors\' Championships'),
                _buildAchievementItem('12 Drivers\' Championships'),
                _buildAchievementItem('Race victories:	184'),
                _buildAchievementItem('Podiums: 512'),
                _buildAchievementItem('2023: 3rd place in Constructors\' Championship'),
                _buildAchievementItem('2022: 4th place in Constructors\' Championship'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDriverCard(String imagePath, String name, String position) {
    return Card(
      color: Colors.white24,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      shadowColor: Colors.black54,
      elevation: 8,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage(imagePath),
            ),
            SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontFamily: 'Metropolis',
                  ),
                ),
                Text(
                  position,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                    fontFamily: 'Metropolis',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAchievementItem(String achievement) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Icon(Icons.check, color: Colors.white70),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              achievement,
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontFamily: 'Metropolis',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
