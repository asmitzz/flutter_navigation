import 'package:flutter/material.dart';
import 'package:flutter_navigation/widgets/big_app_text.dart';

class PopularMountains extends StatefulWidget {
  const PopularMountains({Key? key}) : super(key: key);

  @override
  State<PopularMountains> createState() => _PopularMountainsState();
}

class _PopularMountainsState extends State<PopularMountains>
    with TickerProviderStateMixin {
  List images = [
    "mountain4.jpeg",
    "mountain8.jpeg",
    "mountain9.jpeg",
  ];
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 50,
            ),
            Container(
                padding: const EdgeInsets.only(left: 20),
                child: const BigAppText(text: "Discover", size: 30)),
            const SizedBox(
              height: 30,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                controller: _tabController,
                isScrollable: true,
                labelPadding: const EdgeInsets.only(left: 20, right: 20),
                labelColor: Colors.blue.shade900,
                unselectedLabelColor: Colors.grey,
                indicator:
                    CircleTabIndicator(color: Colors.blue.shade900, radius: 4),
                tabs: const [
                  Tab(text: "Places"),
                  Tab(text: "Itenary"),
                  Tab(text: "Description"),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20),
              width: double.maxFinite,
              height: 300,
              child: TabBarView(
                controller: _tabController,
                children: [
                  ListView.builder(
                      itemCount: 3,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (_, index) {
                        return Container(
                          height: 300,
                          width: 200,
                          margin: const EdgeInsets.only(right: 10, top: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image: AssetImage("img/" + images[index]),
                                fit: BoxFit.cover),
                          ),
                        );
                      }),
                  ListView.builder(
                      itemCount: 3,
                      itemBuilder: (_, index) {
                        return Container(
                          height: 300,
                          width: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image: AssetImage("img/" + images[index]))),
                        );
                      }),
                  ListView.builder(
                      itemCount: 3,
                      itemBuilder: (_, index) {
                        return Container(
                          height: 300,
                          width: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image: AssetImage("img/" + images[index]))),
                        );
                      }),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
                padding: const EdgeInsets.only(left: 20),
                child: const BigAppText(text: "Explore more", size: 20)),
          ],
        ),
      ),
    );
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;

  CircleTabIndicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final double radius;
  late Color color;
  _CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    late Paint _paint;
    _paint = Paint()..color = color;
    _paint = _paint..isAntiAlias = true;
    final Offset circleOffset =
        offset + Offset(cfg.size!.width / 2, cfg.size!.height - radius);
    canvas.drawCircle(circleOffset, radius, _paint);
  }
}
