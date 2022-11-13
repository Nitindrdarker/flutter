import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)?.settings.arguments as Map;
    print(data);
    String bgimage = data['isDaytime'] ? 'a.jpg' : 'b.jpg';
    Color bgcolor = data['isDaytime'] ? Colors.blue : Colors.indigo;
    return Scaffold(
      backgroundColor: bgcolor,
      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/$bgimage'),
          fit: BoxFit.cover,
        )),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
          child: Column(
            children: [
              FloatingActionButton(
                onPressed: () async {
                  dynamic result =
                      await Navigator.pushNamed(context, "/location");
                  setState(() {
                    data = {
                      'time': result['time'],
                      'location': result['location'],
                      'isDaytime': result['isDaytime'],
                      'flag': result['flag']
                    };
                  });
                },
                child: Icon(Icons.edit_location),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data['location'],
                    style: TextStyle(fontSize: 20, letterSpacing: 2),
                  )
                ],
              ),
              SizedBox(height: 20),
              Text(
                data['time'],
                style: TextStyle(
                  fontSize: 66,
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
