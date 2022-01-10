import 'package:fetch_time_redux/middleware.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'models/app_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:   const Text("Flutter Redux demo"),
      ),
      body:   Center(
        child:   Container(
          height: 400.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[

              // display time and location
              StoreConnector<AppState, AppState>(
                converter: (store) => store.state,
                builder: (_, state) {
                  return  Text(
                    'The time in ${state.location} is ${state.time}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
                  );
                },
              ),

              // fetch time button
              StoreConnector<AppState, FetchTime>(
                converter: (store) => () => store.dispatch(fetchTime),
                builder: (_, fetchTimeCallback) {
                  return   SizedBox(
                    width: 250,
                    height: 50,
                    child: RaisedButton(
                        color: Colors.amber,
                        textColor: Colors.brown,
                        onPressed: fetchTimeCallback,
                        child:   const Text(
                          "Click to fetch time",
                          style: TextStyle(
                              color: Colors.brown,
                              fontWeight: FontWeight.w600,
                              fontSize: 25
                          ),
                        )),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

typedef FetchTime = void Function();