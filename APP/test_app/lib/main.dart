import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String userName = '';
  String result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Name Input App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Enter your name:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            TextField(
              onChanged: (value) {
                setState(() {
                  userName = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Your Name',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle the submission of the name here
                sendNameToServer(userName);
              },
              child: Text('Submit'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle the "Get Results" button click here
                getResultsFromServer();
              },
              child: Text('Get Results'),
            ),
            SizedBox(height: 20),
            Text(
              result,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  void sendNameToServer(String name) async {
    final encodedName = Uri.encodeComponent(name);
    final response = await http
        .get(Uri.parse('http://192.168.10.1:3000/sendme/$encodedName'));

    if (response.statusCode == 200) {
      print('Name submitted successfully: $name');
    } else {
      print('Failed to submit name');
    }
  }

  void getResultsFromServer() async {
    final response =
        await http.get(Uri.parse('http://192.168.10.1:3000/getme'));
    if (response.statusCode == 200) {
      setState(() {
        result = response.body;
      });
    } else {
      print('Failed to get results');
    }
  }
}
