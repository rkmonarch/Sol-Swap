import 'package:flutter/material.dart';
import 'package:flutter_phantom_demo/main.dart';
import 'package:flutter_phantom_demo/resources/app_assets.dart';
import 'package:flutter_phantom_demo/resources/ui_helpers.dart';

class CreateContactScreen extends StatefulWidget {
  CreateContactScreen({super.key});

  @override
  State<CreateContactScreen> createState() => _CreateContactScreenState();
}

class _CreateContactScreenState extends State<CreateContactScreen> {
  TextEditingController nameController = new TextEditingController();
  TextEditingController pubkeyController = new TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _formkey = GlobalKey<FormState>();
  List contacts = [];
  @override
  void initState() {
    var contact = storage.read("contacts");
    print("before contact is $contact");
    contacts.add(contact);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Create Contact"),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
          icon: Center(
            child: ElevatedButton(
              onPressed: () {
                if (pubkeyController.text.length > 1 &&
                    nameController.text.isNotEmpty) {
                  contactsGloble.add({
                    "address": pubkeyController.text.trim(),
                    "name": nameController.text.trim()
                  });
                  showInfoMessage(
                      message: "Contact Added Successfully", title: "Info");
                  Navigator.pop(context);
                } else {
                  showInfoMessage(
                      message: "Please submit required fields", title: "Error");
                }
              },
              child: Text("Save Wallet Contact"),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(500, 50),
                elevation: 4,
              ),
            ),
          ),
        ),
      ]),
      key: _scaffoldKey,
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              vSpaceMedium,
              TextFormField(
                  controller: pubkeyController,
                  validator: (value) {
                    if (value!.isNotEmpty) {
                      return null;
                    } else {
                      showInfoMessage(
                          message: "Please submit required fields",
                          title: "Error");
                    }
                  },
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                    labelText: "Enter PubKey to add in contact",
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 0.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 0.0),
                    ),
                    labelStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.normal),
                  )),
              vSpaceMedium,
              TextFormField(
                  controller: nameController,
                  validator: (value) {
                    if (value!.isNotEmpty) {
                      return null;
                    } else {
                      showInfoMessage(
                          message: "Please submit required fields",
                          title: "Error");
                    }
                  },
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                    labelText: "Enter Name",
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 0.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 0.0),
                    ),
                    labelStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.normal),
                  )),
              vSpaceLarge,
            ],
          ),
        ),
      ),
    );
  }
}
