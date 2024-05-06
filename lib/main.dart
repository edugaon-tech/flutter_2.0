import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn_bipul/firebase_options.dart';
import 'package:flutter_learn_bipul/second_screen.dart';
import 'package:flutter_learn_bipul/users/user_provider.dart';
import 'package:flutter_learn_bipul/views/auth/register_screen.dart';
import 'package:provider/provider.dart';
import 'firebase/firestore/crud_screen.dart';
import 'firebase/notification/notification_screen.dart';

void main() async{

  // binding you widgets with package's widgets
  WidgetsFlutterBinding.ensureInitialized();
  // to initialize firebase in the entire app
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(ChangeNotifierProvider(
    create: (_) => UserProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
      home: NotificationScreen(),
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
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
        ),
        body: Column(
          children: [
            Center(
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    icon = Icons.add;
                  });
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SecondScreen()));
                },
                child: Text("Next ddd"),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    icon = Icons.add;
                  });
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SecondScreen()));
                },
                child: Text("Next ddd"),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    icon = Icons.add;
                  });
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SecondScreen()));
                },
                child: Text("Next ddd"),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    icon = Icons.add;
                  });
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SecondScreen()));
                },
                child: Text("Next ddd"),
              ),
            ),
            Icon(icon)
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
