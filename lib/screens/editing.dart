import 'package:flutter/material.dart';
import 'package:musichub/screens/login_signup.dart';
import 'package:musichub/screens/library.dart';
import 'package:musichub/screens/musicplayer.dart';
import 'package:musichub/screens/home.dart';
import 'package:musichub/screens/search.dart';
import 'package:musichub/screens/setting.dart';

class SeparateVocalsBeatsScreen extends StatefulWidget {
  @override
  _SeparateVocalsBeatsScreenState createState() => _SeparateVocalsBeatsScreenState();
}

class _SeparateVocalsBeatsScreenState extends State<SeparateVocalsBeatsScreen> with TickerProviderStateMixin {
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
            color: Colors.black,
            borderRadius: BorderRadius.circular(15),
          ),
          child: ListTile(
            leading: Icon(icon, color: Colors.white),
            title: Text(title, style: TextStyle(color: Colors.white, fontSize: 18)),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.play_arrow, color: Colors.white),
                  onPressed: () {
                    // Handle play button press
                  },
                ),
                IconButton(
                  icon: Icon(Icons.pause, color: Colors.white),
                  onPressed: () {
                    // Handle pause button press
                  },
                ),
                IconButton(
                  icon: Icon(Icons.download, color: Colors.white),
                  onPressed: () {
                    // Handle download button press
                  },
                ),
              ],
            ),
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
        elevation: 0,
        title: Text('Separate vocals and beats', style: TextStyle(color: Colors.white, fontSize: 20)),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
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
          child:
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              children: [

                SizedBox(height: 40),
                _buildAnimatedListTile('Vocals', Icons.volume_up),
                SizedBox(height: 16),
                _buildAnimatedListTile('Beats', Icons.volume_up),
                SizedBox(height: 16),
                _buildAnimatedListTile('Music', Icons.volume_up),
                SizedBox(height: 32),
                FadeTransition(
                  opacity: _animationController!,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(primary: Colors.black, minimumSize: Size(150, 50)),
                    child: Text('Choose Song', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FadeTransition(
                      opacity: _animationController!,
                      child: IconButton(
                        icon: Icon(Icons.check, color: Colors.black, size: 36),
                        onPressed: () {},
                      ),
                    ),
                    SizedBox(width: 16),
                    FadeTransition(
                      opacity: _animationController!,
                      child: IconButton(
                        icon: Icon(Icons.close, color: Colors.black, size: 36),
                        onPressed: () {},
                      ),
                    ),
                  ],
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
}

void _showLogoutDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.black,
        title: Text('Logout', style: TextStyle(color: Colors.white)),
        content: Text('Are you sure you want to logout?', style: TextStyle(color: Colors.white),),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => login_signup()),
              );
            },
            child: Text('Yes'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('No'),
          ),
        ],
      );
    },
  );
}
