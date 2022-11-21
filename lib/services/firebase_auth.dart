import 'package:firebase_auth/firebase_auth.dart';

class FireAuth{
  static Future<User?> registerUSingEmailPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    try{
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(email: email, password: password);

      user = userCredential.user;
      await user!.updateProfile(
        displayName: name
      );
      await user.reload();
    } on FirebaseAuthException catch (e){
      if(e.code == 'weak-password'){
        print('The password provided is weak');
      }else if(e.code == 'email-already-in-use'){
        print('The account already exist for that email');
      }
    }catch(e){
      print(e);
    }

    return user;
  }

  static Future<User?> signInWithEmailPassword({
    required String email,
    required String password,
  }) async{
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    try{
      UserCredential userCredential = await auth.signInWithEmailAndPassword(email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch(e){
      if(e.code == 'user-not-found'){
        print('No user found for that email');
      }else if(e.code == 'wrong-password'){
        print('Wrong password provided');
      }
    }
    return user;
  }

  static Future<User?> refreshUser(User user) async{
    FirebaseAuth auth = FirebaseAuth.instance;

    await user.reload();
    User? refresedhUser = auth.currentUser;

    return refresedhUser;
  }
}