import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(location: 'Dubai', flag: '', url: 'Asia/Dubai'),
    WorldTime(location: 'Colombo', flag: '', url: 'Asia/Colombo'),
    WorldTime(location: 'Singapore', flag: '', url: 'Asia/Singapore'),
    WorldTime(location: 'Melbourne', flag: '', url: 'Australia/Melbourne'),
    WorldTime(location: 'Sydney', flag: '', url: 'Australia/Sydney'),
    WorldTime(location: 'London', flag: '', url: 'Europe/London'),
    WorldTime(location: 'Rome', flag: '', url: 'Europe/Rome'),
    WorldTime(location: 'Bangkok', flag: '', url: 'Asia/Bangkok'),
    WorldTime(location: 'Hong_Kong', flag: '', url: 'Asia/Hong_Kong'),
    WorldTime(location: 'Tokyo', flag: '', url: 'Asia/Tokyo'),
    WorldTime(location: 'Lisbon', flag: '', url: 'Europe/Lisbon'),
    WorldTime(location: 'Maldives', flag: '', url: 'Indian/Maldives'),
    WorldTime(location: 'Samara', flag: '', url: 'Europe/Samara'),
    WorldTime(location: 'Istanbul', flag: '', url: 'Europe/Istanbul'),
    WorldTime(location: 'Lisbon', flag: '', url: 'Europe/Lisbon'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time':instance.time,
      'isDayTime' : instance.isDayTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              onTap: () {
                updateTime(index);
              },
              title: Text(locations[index].location),
            ),
          );
        },
      ),
    );
  }
}
