import 'package:flutter/material.dart';
import '../models/contact_model.dart';

class InfoPage extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String largeProfile;
  final String phone;
  final String email;

  InfoPage(
      {super.key,
      required this.firstName,
      required this.lastName,
      required this.largeProfile,
      required this.phone,
      required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      backgroundColor: Colors.white,
      body: Container(
          width: double.infinity,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(28.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                    radius: 100,
                    backgroundColor: Colors.transparent,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.network(largeProfile,
                          width: 200, height: 200, fit: BoxFit.cover),
                    )),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 40),
                  child: Text(
                    '${firstName} ${lastName}',
                    style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        fontSize: 32),
                  ),
                ),
                textRow(MainAxisAlignment.start,'เบอร์โทรศัพท์: ${phone}',18),
                textRow(MainAxisAlignment.start,'อีเมล: ${email}',18),
              ],
            ),
          )),
    );
  }

  Row textRow(MainAxisAlignment position,String text,double fontsize) {
    return Row(
                mainAxisAlignment: position,
                children: [
                  Column(children: [
                    Text(
                      text,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          fontSize: fontsize),
                    ),
                  ])
                ],
              );
  }

  AppBar appBar(context) {
    return AppBar(
      title: const Text('ข้อมูลผู้ติดต่อ',
          style: TextStyle(
              fontFamily: 'rsu',
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold)),
      backgroundColor: const Color.fromARGB(255, 8, 23, 31),
      centerTitle: true,
      elevation: 0.0,
      leading: GestureDetector(
          onTap: () {
            print('BACK');
            Navigator.pop(context);
          },
          child: Container(
            margin: EdgeInsets.all(10),
            width: 30,
            height: 30,
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(10)),
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 22,
            ),
          )),
    );
  }
}
