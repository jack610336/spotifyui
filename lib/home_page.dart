import 'package:flutter/material.dart';
import 'package:spotify/cover_playlist.dart';
import 'package:spotify/pdata.dart';
import 'package:spotify/player_animation.dart';
import 'package:spotify/playlist.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomNavigationBar(),
      backgroundColor: PData.blackColor,
      body: CustomScrollView(
        slivers: [
          // 客製化 AppBar
          customAppBar(),

          /// 上方六格清單
          recommandTop6PlayList(),

          // New release 新發行
          newReleaseSong(),

          // 推薦播放清單
          recommandPlayList()
        ],
      ),
    );
  }

  Widget recommandTop6PlayList() {
    return SliverPadding(
      padding: EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 16),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return PlayList(
              icon: PData.top6ListIcon[index],
              name: PData.top6ListName[index],
            );
          },
          childCount: 6,
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          crossAxisCount: 2,
          childAspectRatio: 4 / 1.5,
        ),
      ),
    );
  }

  Widget customAppBar() {
    return SliverAppBar(
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
        background: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(
                  'asset/profile_img.jpg',
                  width: 40,
                ),
              ),
              SizedBox(
                width: 16,
              ),
              Text(
                'Good evening',
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Spacer(),
              IconButton(
                icon: Icon(
                  Icons.notifications_none_sharp,
                  size: 30,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
      pinned: true,
      floating: true, // 設置此屬性為 true
      bottom: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: Row(
                  children: [
                    Text(
                      'Music',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 16,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: Row(
                  children: [
                    Text(
                      'Podcasts & Shows',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        centerTitle: false,
      ),
    );
  }

  Widget bottomNavigationBar() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
            icon:
                Icon((_selectedIndex == 0) ? Icons.home : Icons.home_outlined),
            label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(
                (_selectedIndex == 1) ? Icons.search : Icons.search_outlined),
            label: 'Search'),
        BottomNavigationBarItem(
            icon: Icon((_selectedIndex == 2)
                ? Icons.library_music
                : Icons.library_music_outlined),
            label: 'Your Library'),
      ],
      currentIndex: _selectedIndex,
      unselectedItemColor: Colors.grey[400],
      selectedItemColor: Colors.white,
      backgroundColor: PData.blackColor,
      onTap: _onItemTapped,
    );
  }

  Widget newReleaseSong() {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 32, right: 16),
            child: Container(
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage:
                        AssetImage('asset/spotify/marshmello.jpeg'),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('New release from',
                          style:
                              TextStyle(fontSize: 14, color: Colors.grey[300])),
                      Text('Marshmello',
                          style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ],
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.18,
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10)),
                      child: Image.asset('asset/spotify/msong.jpeg')),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 16.0, bottom: 16.0, right: 16.0, left: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Fell In Love',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                          SizedBox(
                            height: 4,
                          ),
                          Text('Single ∙ Marshmello, Brent Faiyaz',
                              overflow: TextOverflow.clip,
                              maxLines: 3,
                              softWrap: true,
                              style: TextStyle(
                                  fontSize: 14, color: Colors.grey[300])),
                          Spacer(),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add_circle_outline,
                                color: Colors.grey,
                                size: 32,
                              ),
                              Spacer(),
                              Icon(
                                Icons.play_circle,
                                color: Colors.white,
                                size: 46,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget recommandPlayList() {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 26, left: 16, right: 16),
            child: Text('Base on your recent listening',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          ),
          Container(
            width: double.infinity,
            height: 280,
            child: CustomScrollView(
              scrollDirection: Axis.horizontal,
              slivers: [
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(
                            top: 0, bottom: 0, left: 16, right: 8),
                        child: CoverPlaylist(
                          coverPath: PData.coverList[index],
                        ),
                      );
                    },
                    childCount: PData.coverList.length,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
