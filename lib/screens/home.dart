import 'package:flutter/material.dart';
import 'package:musichub/screens/login_signup.dart';
import 'package:musichub/screens/library.dart';
import 'package:musichub/screens/editing.dart';
import 'package:musichub/screens/musicplayer.dart';
import 'package:musichub/screens/search.dart';
import 'package:musichub/screens/setting.dart';
import 'package:musichub/screens/bollywood.dart';
import 'package:musichub/screens/hollywood.dart';
import 'package:musichub/screens/lollywood.dart';
import 'package:musichub/screens/qawali.dart';
import 'package:musichub/screens/kpop.dart';
import 'package:musichub/screens/naat.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  TabController? _tabController;
  AnimationController? _animationController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _animationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _animationController!.forward();
  }

  @override
  void dispose() {
    _tabController?.dispose();
    _animationController!.dispose();
    super.dispose();
  }

  Widget _buildAnimatedListTile(String title, IconData icon) {
    return FadeTransition(
      opacity: _animationController!,
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(1, 0),
          end: Offset.zero,
        ).animate(CurvedAnimation(
          parent: _animationController!,
          curve: Curves.easeInOut,
        )),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black, // Set the tile background color to black
            borderRadius: BorderRadius.circular(10), // Make the corners rounded
          ),
          child: ListTile(
            leading: Icon(icon, color: Colors.white),
            title: Text(title, style: TextStyle(color: Colors.white)),
            onTap: () {},
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(
            Icons.settings,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SettingsScreen()),
            );
          },
        ),
        title: Text(
          'Home',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.logout, color: Colors.white),
            onPressed: () {
              _showLogoutDialog(context);
            },
          ),
        ],
      ),
      body: Container(
        color: Colors.amber,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('resources/images/appbg2.png'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 3,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 30,
                    children: [
                      MusicCategory(
                        title: 'Bollywood',
                        icon: Icons.music_note_rounded,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => BollywoodSongScreen()),
                          );
                        },
                      ),
                      MusicCategory(
                        title: 'Hollywood',
                        icon: Icons.music_note_rounded,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HollywoodSongScreen()),
                          );
                        },
                      ),
                      MusicCategory(
                        title: 'Lollywood',
                        icon: Icons.music_note_rounded,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LollywoodSongScreen()),
                          );
                        },
                      ),
                      MusicCategory(
                        title: 'Qawali',
                        icon: Icons.music_note_rounded,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => QawaliScreen()),
                          );
                        },
                      ),
                      MusicCategory(
                        title: 'Kpop',
                        icon: Icons.music_note_rounded,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => KpopScreen()),
                          );
                        },
                      ),
                      MusicCategory(
                        title: 'Naat',
                        icon: Icons.music_note_rounded,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Naat()),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          color: Colors.black,
          child: TabBar(
            controller: _tabController,
            unselectedLabelColor: Colors.white,
            labelColor: Colors.white,
            indicatorColor: Colors.black,
            tabs: [
              Tab(
                icon: Icon(Icons.home_outlined, color: Colors.white),
                text: 'Home',
              ),
              Tab(
                icon: Icon(Icons.library_music, color: Colors.white),
                text: 'Library',
              ),
              Tab(
                icon: Icon(Icons.edit_outlined, color: Colors.white),
                text: 'Edit',
              ),
              Tab(
                icon: Icon(Icons.search_outlined, color: Colors.white),
                text: 'Search',
              ),
            ],
            onTap: (index) {
              switch (index) {
                case 0:
                  Container();
                  break;
                case 1:
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LibraryScreen()),
                  );
                  break;
                case 2:
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SeparateVocalsBeatsScreen()),
                  );
                  break;
                case 3:
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SearchScreen()),
                  );
                  break;
              }
            },
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        width: 60,
        height: 60,
        child: FloatingActionButton(
          backgroundColor: Colors.white,
          child: Icon(Icons.music_note, color: Colors.black),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MusicPlayer()),
            );
          },
          shape: CircleBorder(),
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.black,
          title: Text(
            'Logout',
            style: TextStyle(color: Colors.white),
          ),
          content: Text(
            'Are you sure you want to logout?',
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => login_signup()),
                );
              },
              child: Text(
                'Yes',
                style: TextStyle(color: Colors.black),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('No', style: TextStyle(color: Colors.black)),
            ),
          ],
        );
      },
    );
  }
}

class MusicCategory extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  MusicCategory({required this.title, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: 100, // Set the width of the box
            height: 75,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(40.0),
            ),
            child: Center(
              child: Icon(
                icon,
                size: 40.0,
                color: Colors.white,
              ),
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(
          title,
          style: TextStyle(
            color: Colors.black,
            fontSize: 18.0,
          ),
        ),
      ],
    );
  }
}
