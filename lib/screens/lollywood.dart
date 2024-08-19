import 'package:flutter/material.dart';
import 'package:musichub/screens/library.dart';
import 'package:musichub/screens/editing.dart';
import 'package:musichub/screens/musicplayer.dart';
import 'package:musichub/screens/search.dart';
import 'package:musichub/screens/home.dart';

class LollywoodSongScreen extends StatelessWidget {
  final List<String> songs = List.generate(20, (index) => "Song ${index + 1}");

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4, // The number of tabs
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            'Lollywood Songs',
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
          centerTitle: true,
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
            child: ListView.builder(
              itemCount: songs.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    leading: Icon(Icons.music_note, color: Colors.white),
                    title: Text(
                      songs[index],
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      // Action to play the song or navigate to a detailed view
                      print("Tapped on ${songs[index]}");
                    },
                  ),
                );
              },
            ),
          ),
        ),
        bottomNavigationBar: SafeArea(
          child: Container(
            color: Colors.black,
            child: TabBar(
              unselectedLabelColor: Colors.grey,
              labelColor: Colors.white,
              indicatorColor: Colors.white,
              tabs: [
                Tab(icon: Icon(Icons.home_outlined, color: Colors.white), text: 'Home'),
                Tab(icon: Icon(Icons.library_music, color: Colors.white), text: 'Library'),
                Tab(icon: Icon(Icons.edit_outlined, color: Colors.white), text: 'Edit'),
                Tab(icon: Icon(Icons.search_outlined, color: Colors.white), text: 'Search'),
              ],
              onTap: (index) {
                switch (index) {
                  case 0:
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage()));
                    break;
                  case 1:
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LibraryScreen()));
                    break;
                  case 2:
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SeparateVocalsBeatsScreen()));
                    break;
                  case 3:
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SearchScreen()));
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
              Navigator.push(context, MaterialPageRoute(builder: (context) => MusicPlayer()));
            },
            shape: CircleBorder(),
          ),
        ),
      ),
    );
  }
}
