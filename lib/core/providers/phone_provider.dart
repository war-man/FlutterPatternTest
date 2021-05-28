import 'dart:io';

import 'package:flutter/material.dart';
import 'package:untitled/core/Repository/ContactService.dart';
import 'package:untitled/core/models/Contact.dart';

class PhoneProvider extends ChangeNotifier {
  Future<List<Contact>> _futureContacts;
  Future<List<Contact>> getAllProducts() async {
    _futureContacts = (await ContactService.contactService.getContacts())
        as Future<List<Contact>>;
    ;
    notifyListeners();
  }
}
