import 'dart:convert';
import 'package:contact_app/pages/info.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/contact_model.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  List<ContactModel> contactsList = [];
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder(
          future: fetchData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              return Scaffold(
                appBar: appBar(),
                backgroundColor: Colors.white,
                body: ListView.separated(
                  itemCount: contactsList.length,
                  shrinkWrap: true,
                  separatorBuilder: (context, index) => SizedBox(height: 10),
                  itemBuilder: (context, index) {
                    return Container(
                        height: 100,
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => InfoPage(
                                          firstName:
                                              contactsList[index].firstName,
                                          lastName:
                                              contactsList[index].lastName,
                                          largeProfile:
                                              contactsList[index].largeProfile,
                                          phone: contactsList[index].phone,
                                          email: contactsList[index].email,
                                        )));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                  radius: 40,
                                  backgroundColor: Colors.transparent,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(40),
                                    child: Image.network(
                                        contactsList[index].mediumProfile,
                                        width: 100,
                                        height: 100,
                                        fit: BoxFit.cover),
                                  )),
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${contactsList[index].firstName} ${contactsList[index].lastName}',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                          fontSize: 22),
                                    ),
                                    Text(
                                      contactsList[index].phone,
                                      style: const TextStyle(
                                          color: Color(0xff7B6F72),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      contactsList[index].email,
                                      style: const TextStyle(
                                          color: Color(0xff7B6F72),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ));
                  },
                ),
              );
            }
          }),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: const Text('รายชื่อผู้ติดต่อ',
          style: TextStyle(
              fontFamily: 'rsu',
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold)),
      backgroundColor: const Color.fromARGB(255, 8, 23, 31),
      centerTitle: true,
      elevation: 0.0,
    );
  }

  Future<List<ContactModel>> fetchData() async {
    final uri = Uri.parse('https://randomuser.me/api/?results=100');
    final response = await http.get(uri);
    List<ContactModel> _contactslist = [];
    if (response.statusCode == 200) {
      final jsonresponse = response.body;
      final jsonArray = json.decode(jsonresponse)['results'];
      jsonArray.forEach((row) {
        var converted = ContactModel.fromJson(row);
        _contactslist.add(converted);
      });
      contactsList = _contactslist;
      return _contactslist;
    } else {
      throw Exception('Failed to load api');
    }
  }
}
