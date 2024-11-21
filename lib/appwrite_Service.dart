import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';

class AppwriteService {
  late Client client;
  late Account account;

  static const endpoint="https://cloud.appwrite.io/v1";
  static const projectId="673d913b000efce9c8e4";
  AppwriteService(){
    client=Client();
    client.setEndpoint(endpoint).setProject(projectId);
    account=Account(client);
  }

  Future<void> registerUser(String email, String name,String Password) async{
    try {
      final response=await account.create(userId: ID.unique(),
       email: email,
        password: Password,
        name: name,);
        print('User registered:${response.$id}');
            } catch (e) {
              print('Error:${e}');
      
    }
  }

  Future<void> loginUser(String email,String password)async{
    try {
      final Session=await account.createEmailPasswordSession(email: email,
       password: password);
       print("User logged in:${Session.userId}");
       
    }on AppwriteException  
    catch (e) {
      if (e.code==401){
        print("Error:Incorrect email or password");
        throw Exception('Icorrect email or password');
      } else{
        print('Error:${e.message}');
        throw Exception(e.message);

      }
      
    } catch (e){
      print("Unexpected error:$e");
      throw Exception('An unexpected error occurred');
    }
  }
  Future <void> logoutUser()async{
    try {
      await account.deleteSession(sessionId: 'current');
      print('User logged out');
    } catch (e) {
      print('Error:${e}');
    }
  }
}