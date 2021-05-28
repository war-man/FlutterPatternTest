import 'package:flutter/material.dart';
import 'package:untitled/core/Repository/ContactService.dart';
import 'dart:async';

import 'package:untitled/core/models/Contact.dart';
import 'package:untitled/screens/add_contacts/add_contacts_screen.dart';

// ignore: must_be_immutable
class Body extends StatefulWidget {
  final int contactID;
  Body({this.contactID});

  @override
  _BodyPageState createState() => new _BodyPageState();
}

class _BodyPageState extends State<Body> {
  var _scaffoldKey = new GlobalKey<ScaffoldState>();

  Future<Contact> _futureContact;

  Future refreshPage() async => setState(() {
        _futureContact =
            ContactService.contactService.getContact(widget.contactID);
      });

  @override
  void initState() {
    refreshPage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
        builder: (context) => Scaffold(
            key: _scaffoldKey,
            appBar: _buildAppBar(),
            body: _buildBody(_futureContact)));
  }

  Widget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.blue,
      centerTitle: false,
      title: Text('Contact',
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600)),
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.star_border_outlined,
            color: Colors.white,
            size: 28,
          ),
        ),
        IconButton(
          icon: Icon(Icons.edit, color: Colors.white),
          onPressed: () {
            Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            AddContactsScreen(contactID: widget.contactID)))
                .then((result) {
              if (result != null) {
                return ScaffoldMessenger.of(context)
                  ..removeCurrentSnackBar()
                  ..showSnackBar(SnackBar(
                    content: Text(result, style: TextStyle(fontSize: 15)),
                    action: SnackBarAction(
                      label: 'Update',
                      onPressed: refreshPage,
                    ),
                  ));
              }
              return refreshPage;
            });
          },
        ),
        IconButton(
            icon: Icon(Icons.delete, color: Colors.white),
            onPressed: () {
              return showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        title: Row(children: [
                          Text('Warning',
                              style:
                                  TextStyle(fontSize: 22, color: Colors.black)),
                        ]),
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: <Widget>[
                              Text('Do you really want to delete this contact?',
                                  style: TextStyle(fontSize: 17))
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          TextButton(
                              child: Row(
                                children: <Widget>[
                                  Icon(Icons.delete, color: Colors.red),
                                  Text("Delete",
                                      style: TextStyle(
                                          color: Colors.red, fontSize: 20)),
                                ],
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                                ContactService.contactService
                                    .deleteContact(widget.contactID)
                                    .then((result) {
                                  Navigator.of(context).pop(result);
                                });
                              }),
                          TextButton(
                            child: Text(
                              "Cancel",
                              style: TextStyle(fontSize: 20),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      ));
            }),
      ],
    );
  }

  Widget _buildBody(Future<Contact> future) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(10),
      child: FutureBuilder<Contact>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(children: <Widget>[
              CircleAvatar(
                child: Text(
                    snapshot.data.firstname[0].toUpperCase() +
                        snapshot.data.lastname[0].toUpperCase(),
                    style: TextStyle(color: Colors.white, fontSize: 70)),
                backgroundColor: Colors.blue,
                radius: 70,
              ),
              Padding(
                padding: EdgeInsets.only(top: 15, bottom: 15),
                child: Text(
                    snapshot.data.firstname + " " + snapshot.data.lastname,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
              ),
              Card(
                  child: ListTile(
                      title: Text(
                        snapshot.data.phone,
                        style: TextStyle(),
                      ),
                      subtitle: Text(
                        "Phone",
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      leading: IconButton(
                        icon: Icon(Icons.phone, size: 30, color: Colors.blue),
                        onPressed: () {},
                      ))),
              Card(
                child: ListTile(
                  title: snapshot.data.email.isNotEmpty
                      ? Text(
                          snapshot.data.email,
                          style: TextStyle(),
                        )
                      : Text(
                          "E-mail",
                          style: TextStyle(),
                        ),
                  subtitle: Text(
                    "E-mail",
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  leading: IconButton(
                    icon: Icon(Icons.email, size: 30, color: Colors.blue),
                    onPressed: () {},
                  ),
                ),
              )
            ]);
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
