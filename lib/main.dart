import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(NBAApp());
}

class NBAApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NBA App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NBA App'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(icon: Icon(Icons.people), text: 'Teams'),
            Tab(icon: Icon(Icons.person), text: 'Players'),
            Tab(icon: Icon(Icons.sports_basketball), text: 'Games'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          TeamsTab(),
          PlayersTab(),
          GamesTab(),
        ],
      ),
    );
  }
}

class TeamsTab extends StatelessWidget {
  final List<String> teams = [
    'Lakers',
    'Warriors',
    'Bulls',
    'Celtics',
    'Nets',
    'Knicks',
    'Heat',
    'Clippers',
    'Suns',
    '76ers',
    // Add more teams as needed
  ];

  final List<String> teamLogos = [
    'assets/lakersteam.png',
    'assets/warriorsteam.png',
    'assets/bullsteam.png',
    'assets/celticsteam.png',
    'assets/netsteam.png',
    'assets/knicksteam.png',
    'assets/heatteam.png',
    'assets/clippersteam.png',
    'assets/sunsteam.png',
    'assets/76ersteam.png',
    // Add more paths as needed
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(10.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Number of columns
        childAspectRatio: 3 / 2, // Aspect ratio of each grid item
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
      ),
      itemCount: teams.length,
      itemBuilder: (ctx, index) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(15.0), // Rounded edges
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                teamLogos[index],
                fit: BoxFit.cover,
              ),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0), // Blur effect
                child: Container(
                  color: Colors.black.withOpacity(0.3), // Slightly darken the image
                ),
              ),
              Center(
                child: Text(
                  teams[index],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class PlayersTab extends StatelessWidget {
  final List<Map<String, dynamic>> players = [
    {
      'name': 'LeBron James',
      'team': 'Lakers',
      'stats': {
        'points': 28,
        'rebounds': 8,
        'assists': 7,
      },
      'image': 'assets/lebron.png',
    },
    {
      'name': 'Stephen Curry',
      'team': 'Warriors',
      'stats': {
        'points': 32,
        'rebounds': 5,
        'assists': 6,
      },
      'image': 'assets/curry.png',
    },
    {
      'name': 'Kevin Durant',
      'team': 'Suns',
      'stats': {
        'points': 30,
        'rebounds': 9,
        'assists': 4,
      },
      'image': 'assets/durant.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(10.0),
      itemCount: players.length,
      itemBuilder: (ctx, index) {
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Image.asset(
                  players[index]['image']!,
                  width: 70, // Increase the size of the image
                  height: 70, // Increase the size of the image
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        players[index]['name'],
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        players[index]['team'],
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Points: ${players[index]['stats']['points']}',
                        style: TextStyle(fontSize: 14),
                      ),
                      Text(
                        'Rebounds: ${players[index]['stats']['rebounds']}',
                        style: TextStyle(fontSize: 14),
                      ),
                      Text(
                        'Assists: ${players[index]['stats']['assists']}',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class GamesTab extends StatelessWidget {
  final List<Map<String, String>> games = [
    {
      'homeTeam': 'Lakers',
      'awayTeam': 'Warriors',
      'homeLogo': 'assets/lakers.png',
      'awayLogo': 'assets/warriors.png',
      'time': '7:00 PM'
    },
    {
      'homeTeam': 'Bulls',
      'awayTeam': 'Celtics',
      'homeLogo': 'assets/bulls.png',
      'awayLogo': 'assets/celtics.png',
      'time': '8:00 PM'
    },
    {
      'homeTeam': 'Nets',
      'awayTeam': 'Knicks',
      'homeLogo': 'assets/nets.png',
      'awayLogo': 'assets/knicks.png',
      'time': '7:30 PM'
    },
    // Add more games as needed
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(10.0),
      itemCount: games.length,
      itemBuilder: (ctx, index) {
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Image.asset(
                  games[index]['homeLogo']!,
                  width: 70, // Increase the size of the image
                  height: 70, // Increase the size of the image
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        '${games[index]['homeTeam']} vs ${games[index]['awayTeam']}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        games[index]['time']!,
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                Image.asset(
                  games[index]['awayLogo']!,
                  width: 70, // Increase the size of the image
                  height: 70, // Increase the size of the image
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
