import 'package:flutter/material.dart';
import 'package:testerrr/services/World_time.dart';


class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png', isDaytime: true),
    WorldTime(url: 'Europe/Athens', location: 'Athens', flag: 'greece.png', isDaytime: true),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png', isDaytime: true),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png', isDaytime: true),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa2.png', isDaytime: true),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png', isDaytime: true),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png', isDaytime: true),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png', isDaytime: true),
  ];

  void updatetime(index) async {
    WorldTime instance = locations[index];
    await instance.getData();
Navigator.pop(context, {
  'location':instance.location,
  'flag':instance.flag,
  'time':instance.time,
  'isDaytime':instance.isDaytime,

});




  }

  @override



  @override
  Widget build(BuildContext context) {

    return Scaffold(
backgroundColor: Colors.grey[600],
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        centerTitle: true,
         title: Text('choose Location'),
        elevation: 0,
      ),
      body: ListView.builder(itemCount: locations.length,
        itemBuilder: (context,index){
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 1,horizontal: 4),
          child: Card(
            child: ListTile(

            onTap: (){
             updatetime(index);


            },
            title :Text(locations[index].location,),
              leading: CircleAvatar(
            backgroundImage: AssetImage('images/${locations[index].flag}')),


            ),

          ),
        );

      },
       )
        



    );
  }
}
