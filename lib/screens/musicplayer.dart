import 'package:flutter/material.dart';
import 'package:musichub/screens/home.dart';
import 'package:musichub/screens/login_signup.dart';
import 'package:musichub/screens/library.dart';
import 'package:musichub/screens/editing.dart';
import 'package:musichub/screens/search.dart';
import 'package:musichub/screens/setting.dart';

class MusicPlayer extends StatefulWidget {
  @override
  _MusicPlayerState createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> with TickerProviderStateMixin {
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

  Widget _buildAnimatedSongTile(String title, IconData icon) {
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
            color: Colors.black,
            borderRadius: BorderRadius.circular(10),
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
    return DefaultTabController(
      length: 4,
    child:Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text('Music Player', style: TextStyle(color: Colors.white, fontSize: 24)),
        leading: IconButton(
          icon: Icon(Icons.settings, color: Colors.white),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsScreen()),
            );
          },
        ),
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
        color:Colors.amber,
         child: Container(
    decoration: BoxDecoration(
    image: DecorationImage(
    image: AssetImage('resources/images/appbg2.png'),
    fit: BoxFit.cover,
    colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),
    ),
    ),
          child:Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                FadeTransition(
                  opacity: _animationController!,
                  child: Column(
                    children: [
                      Icon(Icons.music_note, size: 100, color: Colors.black),
                      Slider(
                        value: 0.5,
                        onChanged: (value) {},
                        activeColor: Colors.black,
                        inactiveColor: Colors.grey,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: Icon(Icons.shuffle, color: Colors.black, size: 30),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: Icon(Icons.skip_previous, color: Colors.black, size: 30),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: Icon(Icons.play_arrow, color: Colors.black, size: 40),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: Icon(Icons.skip_next, color: Colors.black, size: 30),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: Icon(Icons.repeat, color: Colors.black, size: 30),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 32),
                Expanded(
                  child: ListView(
                    children: [
                      _buildAnimatedSongTile('Song Name', Icons.music_note_rounded),
                      SizedBox(height: 16),
                      _buildAnimatedSongTile('Song Name', Icons.music_note_rounded),
                      SizedBox(height: 16),
                      _buildAnimatedSongTile('Song Name', Icons.music_note_rounded),
                      SizedBox(height: 16),
                      _buildAnimatedSongTile('Song Name', Icons.music_note_rounded),
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyHomePage()),
                  );
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
    )
    );
  }
}

void _showLogoutDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.black,
        title: Text('Logout', style: TextStyle(color: Colors.white)),
        content: Text('Are you sure you want to logout?', style: TextStyle(color: Colors.white)),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => login_signup()),
              );
            },
            child: Text('Yes', style: TextStyle(color: Colors.black)),
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
