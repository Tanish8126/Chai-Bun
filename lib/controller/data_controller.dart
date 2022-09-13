// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:get_state_manager/get_state_manager.dart';
// import 'package:http/http.dart';

// class DataController extends GetxController {
//   final firebaseInstance = FirebaseFirestore.instance;
//   Map userData = {'userName': '', 'email': ''};

//   AuthController authController= AuthController ();

//   void onReady() {
//     super.onReady();

//     getUserData();
//   }


//   Future<void>   getUserData () async{
//     try{
//       var response=await firebaseInstance.collection('user_data').where('name', isEqualTo: autController.name).get();
//       if (response.docs.length>0){
//         userData['name']=response.docs[0]['name'];
//         userData['email']=response.docs[0]['email'];

//       }
//     }
//   }

// }
