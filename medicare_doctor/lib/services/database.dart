
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medicare_doctor/models/appointment.dart';
import 'package:medicare_doctor/models/doctor.dart';


class DatabaseService {

  final String uid;

  DatabaseService({this.uid});

  final CollectionReference _collectionReference = Firestore.instance
      .collection('users');

  final CollectionReference _doctorsReference = Firestore.instance
      .collection('doctors');

  final CollectionReference _appointmentsReference = Firestore.instance
      .collection('appointments');

  Future updateUserData(String name, String email, int age) async {
    print("inside updateUserData");
    return await _collectionReference.document(uid).setData({
      'name': name,
      'email': email,
      'age': age
    }).then((value){
      print("Successful");
    }).catchError((error) => print("Failed to add user: $error"));
  }

  //get users and data
  Stream<List<Doctor>> get doctors {

    return _doctorsReference.snapshots().map(_convertToBrewList);
  }

  List<Doctor> _convertToBrewList(QuerySnapshot snapshot){

    return snapshot.documents.map((doc) {
      return Doctor(

        /*
          final String name;
          final String email;
          final String specialist;
          final int experience;
          final int rating;
         */
          name: doc.data['name'] ?? '',
          experience:  doc.data['experience'] ?? 0,
          specialist: doc.data['specialist'] ?? '0',
          rating: doc.data['rating'] ?? 0
      );
    }).toList();
  }

  //get users and data
  Stream<List<AppointmentBooking>> get appointmentBookings {

    return _appointmentsReference.snapshots().map(_convertToAppointmentList);
  }

  List<AppointmentBooking> _convertToAppointmentList(QuerySnapshot snapshot) {

    return snapshot.documents.map((doc) {

         return AppointmentBooking(

           /*
          final String docName;
          final String docSpecialization;
          final String patUid;
          final String time;
         */
             docName: doc.data['docName'] ?? '',
             docSpecialization:  doc.data['docSpecialization'] ?? '0',
             patUid: doc.data['patUid'] ?? '0',
             patName: doc.data['patName'] ?? '0',
             time: doc.data['time'] ?? '0'
         );



    }).toList();
  }




}
/*




//convert user data to user model
  UserData convertToUserDataFromDocumentSnapshot(DocumentSnapshot snapshot){

    return UserData(
        uid: uid,
        name: snapshot.data['name'],
        sugar: snapshot.data['sugar'],
        strength: snapshot.data['strength']
    );
  }
//get users and data
  Stream<List<Brew>> get brew {

    return _collectionReference.snapshots().map(_convertToBrewList);
  }


//get user data stream
  Stream<UserData> get userData {
    return _collectionReference.document(uid).snapshots().map(convertToUserDataFromDocumentSnapshot);
  }



}
*/