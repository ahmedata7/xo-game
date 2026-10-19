import 'package:flutter/material.dart';
import 'package:xo/xo_Screen.dart';

class loginScreen extends StatelessWidget {
  static const String routeName = "loginScreen";
  String p1Name = "";
  String p2Name = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          "XO Game",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.purple.shade700,
              Colors.blue.shade600,
            ],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Card(
                elevation: 15,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.sports_esports,
                        size: 80,
                        color: Colors.pink,
                      ),

                      SizedBox(height: 10),

                      Text(
                        "XO GAME",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                        ),
                      ),

                      SizedBox(height: 30),

                      TextField(
                        onChanged: (value) {
                          p1Name = value;
                        },
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          labelText: "Player 1 (X)",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),

                      SizedBox(height: 20),

                      TextField(
                        onChanged: (value) {
                          p2Name = value;
                        },
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person_outline),
                          labelText: "Player 2 (O)",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),

                      SizedBox(height: 30),

                      SizedBox(
                        width: double.infinity,
                        height: 55,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              xoGame.routeName,
                              arguments: gameArgs(
                                player1Name: p1Name,
                                player2Name: p2Name,
                              ),
                            );
                          },
                          child: Text(
                            "START GAME",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
class gameArgs{
  String player1Name;
  String player2Name;
  gameArgs({required this.player1Name,required this.player2Name});
}
