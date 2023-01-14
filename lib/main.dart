import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(fontFamily: 'Nunito'),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late PageController _pageController;
  int totalPage = 4;

  void _onScroll() {}

  @override
  void initState() {
    _pageController = PageController(
      initialPage: 0,
    )..addListener(_onScroll);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          makePage(
            page: 1,
            image: 'assets/images/one.jpg',
            title: 'Canggu Beach',
            description:
                'The uniqueness of Canggu Beach is that the stretch of rice field across the beach. Canggu Beach has a fairly high waves so, it is one of the destination for local as well as foreign surfers who want to try these waves. This beach is one line with Batu Mejan Beach or Echo Beach',
          ),
          makePage(
            page: 2,
            image: 'assets/images/two.jpg',
            title: 'Borobudur Temple',
            description:
                'The Mandala architectural style, which is a reflection of Buddhist cosmology, was used to construct Borobudur. The shape of this structure is a box with four entrances and a round center. It is separated into two sections when viewed from the outside inward: the natural world.',
          ),
          makePage(
            page: 3,
            image: 'assets/images/three.jpg',
            title: 'Raja Ampat',
            description:
                'The seas of Raja Ampat are among the top diving locations in the world for Pesona pals who enjoy scuba diving and snorkeling. based on a study by a global social-environmental group.',
          ),
          makePage(
            page: 4,
            image: 'assets/images/four.jpg',
            title: 'Labuan Bajo',
            description:
                'This location serves as the entrance to the Komodo National Park, which is home to numerous extinct creatures and breathtaking natural beauty. Starting with a string of unique islands that are home to the Komodo dragon\'s endemic species, Rinca Island and Komodo Island.',
          ),
        ],
      ),
    );
  }

  Widget makePage({page, image, title, description}) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            stops: const [0.8, 1.5],
            colors: [
              Colors.black.withOpacity(.85),
              Colors.black.withOpacity(.2),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: <Widget>[
                  Text(
                    page.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '/' + totalPage.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(right: 3),
                          child: const Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 15,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 3),
                          child: const Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 15,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 3),
                          child: const Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 15,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 3),
                          child: const Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 15,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 3),
                          child: const Icon(
                            Icons.star,
                            color: Colors.grey,
                            size: 15,
                          ),
                        ),
                        const Text(
                          '4.0',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 15,
                          ),
                        ),
                        const Text(
                          '(1400)',
                          style: TextStyle(
                            color: Colors.white38,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Text(
                        description,
                        style: TextStyle(
                          color: Colors.white.withOpacity(.7),
                          height: 1.9,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'READ MORE',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
