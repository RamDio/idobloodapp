// import 'package:flutter/material.dart';
// import 'login.dart';

// class Registration extends StatefulWidget {
//   Registration({Key key}) : super(key: key);
//   static String tag='signup';
//   @override
//   _RegistrationState createState() => _RegistrationState();
// }

// String dropdownStr='A';

// class _RegistrationState extends State<Registration> {
//   @override
//   Widget build(BuildContext context) {
//     final text=Text(
//       'Sign Up',
//       style: TextStyle(
//         color:Colors.red,fontSize:70.0,
//       ),
//     );
//     final firstname = TextFormField(
//         keyboardType:TextInputType.emailAddress,
//         autofocus:false,
//         decoration: InputDecoration(
//           hintText:'firstname',
//           contentPadding:EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
//           border: OutlineInputBorder(
    
//           ),
//         ),
//       );
//       final lastname = TextFormField(
//         keyboardType:TextInputType.text,
//         autofocus:false,
//         decoration: InputDecoration(
//           hintText:'lastname',
//           contentPadding:EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
//           border: OutlineInputBorder(
      
//           ),
//         ),
//       );
//       final username = TextFormField(
//         keyboardType:TextInputType.text,
//         autofocus:false,
//         decoration: InputDecoration(
//           hintText:'username',
//           contentPadding:EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
//           border: OutlineInputBorder(
 
//           ),
//         ),
//       );
//       final address = TextFormField(
//         autofocus:false,
//         decoration: InputDecoration(
//           hintText:'address',
//           contentPadding:EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
//           border: OutlineInputBorder(
   
//           ),
//         ),
//       );

//         final bloodtype=DropdownButton<String>(
//   items: <String>['A', 'B', 'C', 'D'].map((String value) {
//     return new DropdownMenuItem<String>(
//       value: value,
//       child: new Text(value),
//     );
//   }).toList(),
//   onChanged: (_) {},
// );

//       // final bloodtype = TextFormField(
//       //   keyboardType:TextInputType.text,
//       //   autofocus:false,
//       //   decoration: InputDecoration(
//       //     hintText:'bloodtype',
//       //     contentPadding:EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
//       //     border: OutlineInputBorder(
         
//       //     ),
//       //   ),
//       // );
//       final cpnumber = TextFormField(
//         keyboardType:TextInputType.phone,
//         autofocus:false,
//         decoration: InputDecoration(
//           hintText:'cell phone number',
//           contentPadding:EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
//           border: OutlineInputBorder(
           
//           ),
//         ),
//       );
//       final password = TextFormField(
//         autofocus:false,
//         decoration: InputDecoration(
//           hintText:'password',
//           contentPadding:EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
//           border: OutlineInputBorder(
         
//           ),
//         ),
//       );
//        final signupButton=Padding(
//         padding: EdgeInsets.symmetric(vertical: 10.0),
//          child: RaisedButton(
           
//            onPressed: (){
//              Navigator.of(context).pushNamed(Login.tag);
//            },
//            padding: EdgeInsets.all(12),
//            color:Colors.green,
//            child: Text("Log In",style:TextStyle(
//              color: Colors.white,fontSize: 17.0)),
           
//            ),
         
         
//          );
//       final signin = FlatButton(
//            child:Text(
//              'Have an account? Signin',
//              style: TextStyle(
//                color:Colors.purple,fontSize: 15),
//            ),
           
//            onPressed: (){
//              Navigator.push(
//                context, 
//                MaterialPageRoute(builder: (context){
//                  return new Login();
//                })  
//            );
//            },
//       );

//       return Center(
//         child: Container(

               
//                  child:ListView(shrinkWrap: true,
//                  padding: EdgeInsets.only(left:24.0,right:24.0),
//                  children: <Widget>[
//                    Center(child: text),
//                    SizedBox(height: 50.0,),
//                    firstname,
//                    SizedBox(height: 20.0,),
//                    lastname,
//                    SizedBox(height: 20.0,),
//                    address,
//                    SizedBox(height: 20.0,),
//                    cpnumber,
//                    SizedBox(height: 20.0,),
//                    bloodtype,
                   
//                    SizedBox(height: 20.0,),
//                    username,
//                    SizedBox(height: 20.0,),
//                    password,
//                    SizedBox(height: 50.0,),
//                    signupButton,signin
//                  ],
//                  )
               
//              ),
//       );
//   }}