import 'package:flutter/material.dart';

class contacts extends StatefulWidget {
  static const String routeName='contacts';

  @override
  State<contacts> createState() => _contactsState();
}

class _contactsState extends State<contacts> {
  String name='';
  String number='';
  List<Map<String,String>> details=[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(title: Text('Contacts Screen'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              onChanged: (text){
                setState(() {
                  name=text;
                });
              },
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(30),borderSide:BorderSide(color: Colors.white)),
                  labelText: 'Enter Your Name Here',
                  labelStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                  suffixIcon: Icon(Icons.edit),
                  suffixIconColor: Colors.blue
              ),
            ),
            SizedBox(height: 25,),
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (text){
                setState(() {
                  number=text;
                });
              },
             decoration: InputDecoration(
               filled: true,
              fillColor: Colors.white,
               border: OutlineInputBorder(borderRadius: BorderRadius.circular(30),borderSide:BorderSide(color: Colors.white)),
               labelText: 'Enter Your Number Here',
               labelStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
               suffixIcon: Icon(Icons.phone),
               suffixIconColor: Colors.blue
             ),
            ),
            SizedBox(height: 25,),
            Row(
              children: [
               Expanded(child:  ElevatedButton(onPressed: (){
                addContact();
                 setState(() {

                 });
               },
                 child: Text('Add',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
                 style: ElevatedButton.styleFrom(backgroundColor: Colors.blue,
                     shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(30))
                 ),

               ),),

                Expanded(
                  child: ElevatedButton(onPressed: (){
                    deleteContact();
                    setState(() {

                    });
                  },
                    child: Text('Delete',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(30))
                    ),

            ),
                ),
          ],
        ),
            SizedBox(height: 25,),
            for(var c in details)
            Container(
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.all(8),
              height: 70,
              width: 150,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: Colors.white),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text('Name:${c['name']}',style: TextStyle(fontSize: 15),),
                Text('Phone: ${c['number']}',style: TextStyle(fontSize: 15),),
              ]),
            )
      ]),
      ) );
  }
  void addContact(){
    details.add({'name':name,'number':number});
  }
  void deleteContact(){
    details.removeLast();
  }
}


