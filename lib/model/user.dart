// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

List<User> userFromJson(String str) => List<User>.from(json.decode(str).map((x)=>User.fromMap(x)));

String userToJson(List<User> data) => json.encode(List<dynamic>.from(data.map((x)=>x.toMap())));



class User {
    int userid;
    String firstname;
    String lastname;
    String gender;
    String contact;
    String address;
    String username;
    String password;

    User({
        this.userid,
        this.firstname,
        this.lastname,
        this.gender,
        this.contact,
        this.address,
        this.username,
        this.password,
    });

    factory User.fromMap(Map<String, dynamic> json) => User(
        userid: json["userid"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        gender: json["gender"],
        contact: json["contact"],
        address: json["address"],
        username: json["username"],
        password: json["password"],
    );

    Map<String, dynamic> toMap() => {
        "userid": userid,
        "firstname": firstname,
        "lastname": lastname,
        "gender": gender,
        "contact": contact,
        "address": address,
        "username": username,
        "password": password,
    };
}
