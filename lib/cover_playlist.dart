import 'package:flutter/material.dart';

class CoverPlaylist extends StatelessWidget {
  final String coverPath;
  const CoverPlaylist({super.key, required this.coverPath});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            // color: Colors.redAccent,
            child: Image(
              width: 200,
              height: 200,
              image: AssetImage(coverPath),
            ),
          ),
          Container(
            height: 8,
          ),
          Container(
            width: 200,
            child: Text(
              'Ariana Grande, Nicki Minaj, Ed Sheeran m Anne In, Taylor swift, Salena Gomez, Justin Bieber, Charlie Puth, Shawn Mendes, Dua Lipa, Camila Cabello, Maroon 5, The Weeknd, Katy Perry, Rihanna, Imagine Dragons, Bruno Mars, Adele, One Direction, Billie Eilish, Lady Gaga, Eminem, Sia, Coldplay, Khalid, Demi Lovato, Zayn, Selena Gomez, Justin Bieber, Charlie Puth, Shawn Mendes, Dua Lipa, Camila Cabello, Maroon 5, The Weeknd, Katy Perry, Rihanna, Imagine Dragons, Bruno Mars, Adele, One Direction, Billie Eilish, Lady Gaga, Eminem, Sia, Coldplay, Khalid, Demi Lovato, Zayn',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 12, color: Colors.grey[300]),
            ),
          )
        ],
      ),
    );
  }
}
