import 'package:agenda_app/pages/Calendario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class PaginaCalendario extends StatefulWidget {
  @override
  _PaginaCalendarioState createState() => _PaginaCalendarioState();
}

class _PaginaCalendarioState extends State<PaginaCalendario> {
  Calendario calendarClient = Calendario();
  DateTime startTime = DateTime.now();
  DateTime endTime = DateTime.now().add(Duration(days: 1));
  TextEditingController _eventName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context),
    );
  }

  _body(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
              FlatButton(
                  onPressed: () {
                    DatePicker.showDateTimePicker(context,
                        showTitleActions: true,
                        minTime: DateTime(2020, 3, 5),
                        maxTime: DateTime(2200, 6, 7), onChanged: (date) {
                          print('change $date');
                        }, onConfirm: (date) {
                          setState(() {
                            this.startTime = date;
                          });
                        }, currentTime: DateTime.now(), locale: LocaleType.en);
                  },
                  child: Text(
                    'Início do Evento',
                    style: TextStyle(color: Colors.blue),
                  )),
              Text('$startTime'),
            ],
          ),
          Row(
            children: <Widget>[
              FlatButton(
                  onPressed: () {
                    DatePicker.showDateTimePicker(context,
                        showTitleActions: true,
                        minTime: DateTime(2019, 3, 5),
                        maxTime: DateTime(2200, 6, 7), onChanged: (date) {
                          print('change $date');
                        }, onConfirm: (date) {
                          setState(() {
                            this.endTime = date;
                          });
                        }, currentTime: DateTime.now(), locale: LocaleType.en);
                  },
                  child: Text(
                    'Final do Evento',
                    style: TextStyle(color: Colors.blue),
                  )),
              Text('$endTime'),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: _eventName,
              decoration: InputDecoration(hintText: 'Digite nome do evento'),
            ),
          ),
          RaisedButton(
              child: Text(
                'Insira Evento',
              ),
              color: Colors.grey,
              onPressed: () {
                calendarClient.insert(
                  _eventName.text,
                  startTime,
                  endTime,
                );
          }),
          // ListView.builder(
          //   itemCount: calendarClient.length,
          //   itemBuilder: (BuildContext context, int i) {
          //   var doc = snapshot.data.docs[i];
          //   //var item = doc.data;
          //
          //   print('agenda/${doc.reference.id}');
          //
          //   return Container(
          //     decoration: BoxDecoration(
          //       color: Colors.white,
          //       borderRadius: BorderRadius.circular(10),
          //     ),
          //     margin: const EdgeInsets.all(5),
          //     child: ListTile(
          //       title: Text(doc['Nome']),
          //       subtitle: Text(doc['Email']),
          //       trailing: CircleAvatar(
          //         backgroundColor: Colors.red[300],
          //         foregroundColor: Colors.white,
          //     ),
          //   ));
          // }),
        ],
      ),
    );
  }
}