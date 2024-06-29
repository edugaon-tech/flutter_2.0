import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn_bipul/firebase_options.dart';
import 'package:flutter_learn_bipul/views/screens/news/news_screen.dart';
import 'package:flutter_learn_bipul/views/utils/colors.dart';
import 'package:flutter_learn_bipul/views/utils/styles/button_styles.dart';

void main() async {
  // binding you widgets with package's widgets
  WidgetsFlutterBinding.ensureInitialized();
  // to initialize firebase in the entire app
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          iconTheme: IconThemeData(color: Colors.red),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Colors.black,
            iconSize: 20,
          ),
          useMaterial3: false,
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red))),
      home: NewsScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    print("this is init State");
    super.initState();
  }

  @override
  void didChangeDependencies() {
    print("this is didChangeDependencies");
    super.didChangeDependencies();
  }

  var icon = Icons.abc_rounded;

  @override
  Widget build(BuildContext context) {
    print("build");
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: appBarBgColor,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
        ),
        body: Column(
          children: [
            ElevatedButton(
              onPressed: () {},
              style: AppButtonStyles().appButton(),
              child: Text("Default"),
            ),
            ElevatedButton(
              onPressed: () {},
              style: AppButtonStyles().appButton(bgColor: Colors.pink),
              child: Text("Custom"),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void didUpdateWidget(covariant MyHomePage oldWidget) {
    print("didUpdateWidget");
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    print("dispose");
    super.dispose();
  }

  @override
  void setState(VoidCallback fn) {
    print("setState");
    super.setState(fn);
  }

  @override
  void deactivate() {
    print("deactivate");
    super.deactivate();
  }

  @override
  void activate() {
    print("activate");
    super.activate();
  }
}
