import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ShowContest extends StatefulWidget {
  @override
  _ShowContestState createState() => _ShowContestState();
}

class _ShowContestState extends State<ShowContest> {

  Future<Map<String, dynamic>> contestInfo() async {
    String url = "https://codeforces.com/api/contest.list";
    http.Response data = await http.get(url);
    return json.decode(data.body);
  }

  String startTime(timestamp) {
    var _format = new DateFormat('EEE d-MM-y hh:mm a');
    var date = new DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    var time = _format.format(date);
    return time;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('Upcoming Contests'),
      ),

      body: FutureBuilder(
        future: contestInfo(),
        builder: (context,snapshot){
          return ListView.separated(
              itemBuilder: (context,index){
                if(snapshot.data['result'][index]['phase']=='BEFORE')
                {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 2,
                          spreadRadius: 3,
                          color: Colors.green.withOpacity(0.2),
                        ),
                      ],
                    ),
                    margin: EdgeInsets.fromLTRB(20,12,20,12),
                    padding: EdgeInsets.fromLTRB(8,8,8,8),
                    child: Row(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Container(
                              child:Text(
                                'Contest Name',
                                style: TextStyle(fontFamily: 'Robooto',fontSize: 15),
                              ),
                            ),
                            Container(
                              child:Text(
                                'Platform',
                                style: TextStyle(fontFamily: 'Robooto',fontSize: 15),
                              ),
                            ),
                            Container(
                              child:Text(
                                'Duration',
                                style: TextStyle(fontFamily: 'Robooto',fontSize: 15),
                              ),
                            ),
                            Container(
                              child:Text(
                                'StartTime',
                                style: TextStyle(fontFamily: 'Robooto',fontSize: 15),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 15,),
                        Column(
                          children: <Widget>[
                            Container(child: Text(':',style: TextStyle(fontSize: 16),),),
                            Container(child: Text(':',style: TextStyle(fontSize: 16),),),
                            Container(child: Text(':',style: TextStyle(fontSize: 16),),),
                            Container(child: Text(':',style: TextStyle(fontSize: 16),),),
                          ],
                        ),
                        SizedBox(width: 15,),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                child:Text(
                                  snapshot.data['result'][index]['name'],
                                  style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue),
                                ),
                              ),
                              Container(
                                child:Text(
                                  snapshot.data['result'][index]['type'],
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                child:Text(
                                  (snapshot.data['result'][index]['durationSeconds']/3600).toString()+' Hr',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                child:Text(
                                  startTime(snapshot.data['result'][index]['startTimeSeconds']),
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  );
                }
                return null;
              },
              separatorBuilder: (_, __) => Divider(height: 0.5),
              itemCount: snapshot.data['result']==null ? 0 : snapshot.data['result'].length,
          );
        },
      ),
    );
  }
}
