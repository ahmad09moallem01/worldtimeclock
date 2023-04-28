import 'package:flutter/material.dart';
 class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {

  };


  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ?data : ModalRoute.of(context)!.settings.arguments as Map;

 print('$data');

 String bgimage=data['isDaytime'] ? 'day.jpg' : 'night.jpg';
 Color? bgcolor= data['isDaytime'] ? Colors.blue[500] : Colors.black;



    return Scaffold(
      backgroundColor: bgcolor,
      body:

SafeArea(child:
      Container(decoration: BoxDecoration(
        image: DecorationImage(image:
        AssetImage('images/$bgimage'),
        fit: BoxFit.cover),
      ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0,120,0,0),
          child: SafeArea(child:Column(
            children: <Widget>[

              ElevatedButton.icon(onPressed: () async {

            setState(() async {

  dynamic result= await Navigator.pushNamed(context, '/choose_location');
setState(() {
  data = {
    'time':result['time'],
    'location':result['location'],
    'isDaytime':result['isDaytime'],
    'flag':result['flag'],
  };

});
                  });




              },
                icon: Icon(Icons.location_on,color: Colors.white,),

                label: Text('Edit Location',style: TextStyle(fontWeight:FontWeight.bold),),



              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    data['location'],style: TextStyle(
                    color: Colors.red,
                    fontSize: 28,letterSpacing: 2),

                  )



                ],
              ),
SizedBox(height: 20,),
              Text(
                data['time'],style: TextStyle(
                color: Colors.white,
                fontSize: 66
              ),
              )

            ],
          )),
        ),
      ),




    )
    );
  }
}
