import 'package:flutter/material.dart';

class edited extends StatefulWidget {
  static const String routeName = 'edit';

  @override
  State<edited> createState() => _editedState();
}

class _editedState extends State<edited> {
  GlobalKey<FormState> key = GlobalKey();
  TextEditingController clear=TextEditingController();
  TextEditingController clearPhone=TextEditingController();
  String name = '';
  String number = '';
  List<Map<String, String>> details = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          title: Text('Contacts Screen'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: key,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Name can't be empty";
                      }
                    },
                    onChanged: (text) {
                      setState(() {
                        name = text;
                      });
                    },
                   controller: clear,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Colors.white)),
                        labelText: 'Enter Your Name',
                        labelStyle: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                        suffixIcon: Icon(Icons.edit),
                        suffixIconColor: Colors.blue),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) return "phone can't be empty";
                    },
                    onChanged: (text) {
                      number = text;
                      setState(() {});

                    },
                    controller: clearPhone,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Colors.white)),
                        labelText: 'Enter Your Number',
                        labelStyle: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                        suffixIcon: Icon(Icons.phone),
                        suffixIconColor: Colors.blue),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            empty();
                            addContact();
                            key.currentState!.validate();
                            setState(() {});
                          },
                          child: Text(
                            'Add',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30))),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  for (int i = 0; i < details.length; i++)
                    Container(
                      padding: EdgeInsets.all(15),
                      margin: EdgeInsets.all(8),
                      height: 70,
                      width: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    'Name:${details[i]['name']}',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  Text(
                                    'Phone: ${details[i]['number']}',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ]),
                          ),
                          IconButton(
                              onPressed: () {
                                deleteContact(i);
                                setState(() {});
                              },
                              icon: Icon(
                                Icons.delete,
                                color: Colors.red,
                              )),
                        ],
                      ),
                    ),
                ]),
          ),
        ));
  }
  void addContact() {
    if (name.isNotEmpty && number.isNotEmpty)
      details.add({'name': name, 'number': number});
  }

  void deleteContact(int i) {
    details.removeAt(i);
  }
  void empty(){
    clear.clear();
    clearPhone.clear();
  }
}
