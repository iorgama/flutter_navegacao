import 'package:flutter/material.dart';

void main() {
  runApp(
    const TodoApp(),
  );
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDo App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  final _controller = PageController(
    initialPage: 0,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          NavigationRail(
            backgroundColor: Colors.purple,
            selectedIndex: _selectedIndex,
            onDestinationSelected: (int index) {
              if (index == 0) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TodoPage(
                      selectedIndex: index,
                    ),
                  ),
                );
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutPage()),
                );
              }

              setState(() {
                _selectedIndex = index;
              });
            },
            labelType: NavigationRailLabelType.none,
            groupAlignment: 0.0,
            destinations: const [
              NavigationRailDestination(
                icon: Icon(
                  Icons.home_rounded,
                  color: Colors.white70,
                ),
                selectedIcon: Icon(
                  Icons.home_rounded,
                  color: Colors.white,
                ),
                label: Text(
                  'Home',
                ),
              ),
              NavigationRailDestination(
                icon: Icon(
                  Icons.info_rounded,
                  color: Colors.white70,
                ),
                selectedIcon: Icon(
                  Icons.info_rounded,
                  color: Colors.white,
                ),
                label: Text(
                  'About',
                ),
              ),
            ],
          ),
          // This is the main content.
          Expanded(
            child: PageView(
              scrollDirection: Axis.vertical,
              controller: _controller,
              children: [
                TodoPage(selectedIndex: _selectedIndex),
                const AboutPage(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class TodoPage extends StatelessWidget {
  const TodoPage({
    Key? key,
    required int selectedIndex,
  })  : _selectedIndex = selectedIndex,
        super(key: key);

  final int _selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Text('Teste SelectedIndex: $_selectedIndex');
  }
}

class AboutPage extends StatelessWidget {
  const AboutPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ornare porta faucibus a, aliquam nisi, accumsan ornare orci. Ultricies amet, maecenas mollis convallis elit magna eu, tempus pulvinar. Adipiscing morbi congue sed eu. Amet vel porttitor odio ut at. In placerat lacus ut tellus. Nibh fermentum cras in nunc, libero vulputate ultrices volutpat. Lobortis enim urna feugiat tellus nec. Feugiat integer tincidunt auctor ac in.\n Amet viverra porttitor netus odio tellus tristique tortor, egestas convallis. Nibh arcu, sed nibh ac suspendisse volutpat. Eget tempus, egestas molestie libero dolor at mauris. Tortor a nunc, id porta. Sit erat ornare duis non. Eu eget bibendum sollicitudin urna. Leo urna posuere risus erat ut. Ac purus morbi auctor elementum consequat maecenas augue penatibus eget. Vulputate diam volutpat a nascetur venenatis imperdiet eget. Non tortor volutpat magna purus, cras. Hac nulla purus eget adipiscing tristique pulvinar quisque sed ut. Eget nunc pellentesque elementum dignissim enim pellentesque lacus, nisi, sit. Feugiat aliquet id tristique nibh purus cras. \n Aliquam cursus ut nisi, morbi ac. Sagittis commodo amet eget ut vulputate velit. Felis, in vitae curabitur dignissim lorem duis dolor, posuere et. Risus semper quam eget sollicitudin porta nulla interdum vestibulum. Tellus egestas scelerisque mauris proin non iaculis velit aliquam, cras. In lectus quis pellentesque turpis tristique venenatis quis quis sit. Viverra odio pretium nam pulvinar velit vitae gravida dui. A ut tincidunt et porta mattis fermentum nunc. Venenatis ac, velit felis eleifend. Consequat purus sed quam lectus nullam velit suscipit ornare cras. Nam id enim vel morbi odio odio.');
  }
}
