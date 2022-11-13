import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_phantom_demo/main.dart';
import 'package:flutter_phantom_demo/resources/ui_helpers.dart';

class ContactsListScreen extends StatefulWidget {
  const ContactsListScreen({super.key});

  @override
  State<ContactsListScreen> createState() => _ContactsListScreenState();
}

class _ContactsListScreenState extends State<ContactsListScreen> {
  List contactList = storage.read("contacts");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Contacts"),
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              vSpaceMedium,
              ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: contactList.length,
                  itemBuilder: (BuildContext, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                            hSpaceSmall,
                            Container(
                              width: 190,
                              child: Text(
                                contactList.elementAt(index)['name'],
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                            ),
                            hSpaceMassive,
                            InkWell(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(50)),
                              splashColor: Colors.white12,
                              child: Center(
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 0,
                                    ),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(20)),
                                  ),
                                  child: const Icon(Icons.copy,
                                      color: Colors.white),
                                ),
                              ),
                              onTap: () {
                                Clipboard.setData(ClipboardData(
                                    text: (contactList
                                        .elementAt(index)['address'])));
                              },
                            ),
                          ],
                        ),
                        vSpaceTiny,
                        Text(
                          (contactList.elementAt(index)['address']),
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                        vSpaceSmall,
                        Divider(
                          color: Colors.white,
                          thickness: 1,
                        )
                      ],
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
