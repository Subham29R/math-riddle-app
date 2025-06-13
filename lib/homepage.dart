import 'package:flutter/material.dart';
import 'categories_page.dart';

class HomePage extends StatelessWidget {
  final buttonTextStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF7A5DF5), Color(0xFF4D2DB7)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Math',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.yellow,
                        ),
                      ),
                      // SizedBox(width: 5),
                      Text(
                        'Riddles',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40),

                ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.play_circle_fill, color: Colors.white),
                  label: Text('Play', style: buttonTextStyle),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    minimumSize: Size(double.infinity, 60),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                SizedBox(height: 15),

                ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.calendar_today, color: Colors.white),
                  label: Text('Daily Challenge', style: buttonTextStyle),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    minimumSize: Size(double.infinity, 60),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                SizedBox(height: 15),

                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CategoriesPage()),
                    );
                  },
                  icon: Icon(Icons.category, color: Colors.white),
                  label: Text('Categories', style: buttonTextStyle),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    minimumSize: Size(double.infinity, 60),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),

                SizedBox(height: 15),

                ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.lock, color: Colors.white),
                  label: Text('Premium', style: buttonTextStyle),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    minimumSize: Size(double.infinity, 60),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                SizedBox(height: 15),

                ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.settings, color: Colors.white),
                  label: Text('Settings', style: buttonTextStyle),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey.shade800,
                    minimumSize: Size(double.infinity, 60),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                SizedBox(height: 15),

                ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.exit_to_app, color: Colors.white),
                  label: Text('Exit', style: buttonTextStyle),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    minimumSize: Size(double.infinity, 60),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
