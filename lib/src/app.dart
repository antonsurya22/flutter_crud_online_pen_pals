import 'package:flutter/material.dart';
import 'about.dart';
import 'ui/formadd/form_add_screen.dart';
import 'ui/home/home_screen.dart';

GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Online Pen Pals',
      theme: ThemeData(primarySwatch: Colors.pink, accentColor: Colors.pinkAccent),
      home: App(),
    );
  }
}



class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.pink,
        accentColor: Colors.pinkAccent,
      ),
      home: Scaffold(
        key: _scaffoldState,
        appBar: AppBar(
          leading: Padding(
            padding: EdgeInsets.only(left: 12),
            child: IconButton(
              icon: Icon(Icons.star_border_outlined),
              color: Colors.white,
              onPressed: (){
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Suka dengan Aplikasi ini?"),
                        content: Text("Kirimkan kritik dan saran Anda ke surel " "\n\nanton.surya@undiksha.ac.id"
                            "\n\nTerima Kasih ^^"),
                        actions: <Widget>[
                          FlatButton(
                            child: Text("OK", style: TextStyle(color: Colors.pink),),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          )
                        ],
                      );
                    });
              },
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Online Pen Pals', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
            ],
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.info_outline,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  _scaffoldState.currentContext,
                  MaterialPageRoute(builder: (BuildContext context) {
                    return AboutRoute();
                  }),
                );
              },
            ),
            SizedBox(
              width: 15,
            )
          ],
        ),
        body: HomeScreen(),

        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            var result = await Navigator.push(
              _scaffoldState.currentContext,
              MaterialPageRoute(builder: (BuildContext context) {
                return FormAddScreen();
              }),
            );
            if (result != null) {
              setState(() {});
            }
          },
          child: const Icon(Icons.add),
          backgroundColor: Colors.pink,
        ),
      ),
    );
  }
}
