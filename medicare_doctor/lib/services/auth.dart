import 'package:firebase_auth/firebase_auth.dart';
import 'package:medicare_doctor/models/user.dart';


class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  User _createUserFromFB(FirebaseUser user) {
    return user != null ? User(uId: user.uid) : null;
  }


  //register
  Future<FirebaseUser> registerWithEmaillAndPassword(String email, String password) async{

    try{
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return user;

     // DatabaseService _database = DatabaseService(uid:user.uid);

      //_database.updateUserData('0', 'New Brew Crew Member', 100);

      //return _createUserFromFB(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }


}