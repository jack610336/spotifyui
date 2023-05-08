import 'package:flutter/material.dart';

import 'player_animation.dart';

class PlayList extends StatelessWidget {
  final String icon;
  final String name;

  const PlayList({super.key, required this.icon, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10)),
              child: Image.asset(icon)),
          SizedBox(
            width: 16,
          ),
          Expanded(
            child: Text(name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          ),
          isPlaying()
        ],
      ),
    );
  }

  Widget isPlaying() {
    print('name = $name');
    if (name == 'Avicii') {
      return Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Column(
          children: [Spacer(), BarChartWidget(), Spacer()],
        ),
      );
    } else {
      return Container();
    }
  }
}
