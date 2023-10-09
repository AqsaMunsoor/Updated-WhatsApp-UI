import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whatsapp_ui/helpers/app_colors.dart';
import 'package:whatsapp_ui/screens/calls_screen.dart';
import 'package:whatsapp_ui/screens/chat_screen.dart';
import 'package:whatsapp_ui/screens/community_screen.dart';
import 'package:whatsapp_ui/screens/newchat_screen.dart';
import 'package:whatsapp_ui/screens/profile_screen.dart';
import 'package:whatsapp_ui/screens/updates_screen.dart';
import 'package:flutter_gutter/flutter_gutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      theme: ThemeData(
        brightness: Brightness.light,
        useMaterial3: true,
      ),
      themeMode: ThemeMode.system,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  int initialIndex = 1;

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: 4, vsync: this, initialIndex: initialIndex);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget buildFloatingActionButton() {
    final theme = Theme.of(context);
    final primaryColor = AppColors.getPrimaryColor(theme);
    if (_tabController.index == 2) {
      return Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        direction: Axis.vertical,
        children: [
          FloatingActionButton.small(
            backgroundColor: theme.brightness == Brightness.dark
                ? Color(0xFF3C4A55)
                : Color(0xFFE0FEF2),
            onPressed: () {},
            child: Icon(
              Icons.create,
              color: theme.brightness == Brightness.dark
                  ? Colors.white
                  : Color(0xFF027F69),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            backgroundColor: primaryColor,
            onPressed: () {},
            child: Icon(
              Icons.photo_camera,
              color: theme.brightness == Brightness.dark
                  ? Colors.black
                  : Colors.white,
            ),
          )
        ],
      );
    } else if (_tabController.index == 3) {
      return FloatingActionButton(
        onPressed: () {},
        backgroundColor: primaryColor,
        child: Icon(
          Icons.add_call,
          color:
              theme.brightness == Brightness.dark ? Colors.black : Colors.white,
        ),
      );
    } else if (_tabController.index == 1) {
      return FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const NewChatScreen()));
        },
        backgroundColor: primaryColor,
        child: Icon(
          Icons.message,
          color:
              theme.brightness == Brightness.dark ? Colors.black : Colors.white,
        ),
      );
    } else {
      return const SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appBarColor = AppColors.getAppBarColor(theme);
    final unselectedLabelColor = theme.brightness == Brightness.dark
        ? const Color(0xFF84939A)
        : Color(0xFF309784);
    final labelColor = theme.brightness == Brightness.dark
        ? const Color(0xFF3AB69B)
        : Color(0xFFFFFFFF);

    return DefaultTabController(
      initialIndex: initialIndex,
      length: 4,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: appBarColor,
            title: Text(
              'WhatsApp',
              style: GoogleFonts.roboto(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
            actions: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    Icons.photo_camera_outlined,
                    color: Colors.white,
                  ),
                  const Gutter(),
                  const Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  const Gutter(),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ProfileScreen(),
                          ));
                    },
                    child: const CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.grey,
                      backgroundImage: NetworkImage(
                          'https://img.freepik.com/free-photo/young-bearded-man-with-striped-shirt_273609-5677.jpg?size=626&ext=jpg'),
                    ),
                  ),
                  const Gutter()
                ],
              )
            ],
            bottom: TabBar(
              controller: _tabController,
              unselectedLabelColor: unselectedLabelColor,
              unselectedLabelStyle: GoogleFonts.roboto(
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: theme.brightness == Brightness.dark
                  ? Color(0xFF3AB69B)
                  : Colors.white,
              labelStyle: GoogleFonts.roboto(
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
              labelColor: labelColor,
              dividerColor: Colors.transparent,
              tabs: const [
                Tab(
                  icon: Icon(Icons.groups),
                ),
                Tab(
                  text: "Chats",
                ),
                Tab(
                  text: "Updates",
                ),
                Tab(
                  text: "Calls",
                ),
              ],
            ),
          ),
          body: TabBarView(
            controller: _tabController,
            children: const [
              CommunityScreen(),
              ChatScreen(),
              UpdatesScreen(),
              CallsScreen()
            ],
          ),
          floatingActionButton: buildFloatingActionButton()),
    );
  }
}
