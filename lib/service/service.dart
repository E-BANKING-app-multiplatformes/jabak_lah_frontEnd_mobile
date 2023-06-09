


import 'dart:convert';
import 'dart:io';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:e_banking_app/Controller/auth_controller.dart';
import 'package:e_banking_app/views/auth_screen/login_screen.dart';
import 'package:e_banking_app/views/otp_number/otp.screen.dart';
import'package:shared_preferences/shared_preferences.dart';
import 'package:e_banking_app/Consts/const.dart';
import 'package:e_banking_app/views/home_screen/Home.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:jwt_decoder/jwt_decoder.dart';
//import 'package:jwt_decode/jwt_decode.dart';
//import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:flutter/material.dart';
import 'package:cookie_jar/cookie_jar.dart';


class Client {
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? address;
  final String? cin;
  final String? phoneNumber;
  final String clientId;

  Client({required this.clientId,this.firstName,this.lastName,this.email,this.address,this.cin,this.phoneNumber});

}



class Service{
  //static Client? client;
    // Variables globales pour stocker les informations du client
  static bool isFirstLogin = true;
  
  static int? clientId;
  static int? accountId;
   String? otpNumber;
  static String? accessToken;

  static String? getAccessToken() {
    return accessToken;
  }
  static int? getAccountId() {
    return accountId;
  }
  static int? getClientId() {
    return clientId;
  }
   String? getOtpNumber() {
    return otpNumber;
  }

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController adressController = TextEditingController();
  TextEditingController CINController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  //------------login
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  //-----------otp
  TextEditingController otpController = TextEditingController();
  //-----------credit card infos
  var phonecontroller = TextEditingController();


 // final ClientController clientController = Get.put(ClientController());
//****************** */

  //*************login 
  static Future<void> login( TextEditingController emailController,TextEditingController passwordController ) async {

    
    final url = Uri.parse('http://192.168.43.36:8084/api/v1/auth/authenticate');
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode({
      'email': emailController.text,
      'password': passwordController.text,
    });

    final response = await http.post(url, headers: headers, body: body).timeout(Duration(seconds: 10));

    if (response.statusCode == 200) {
      
      print("requette a le status 200 dans ça marche");
      final responseData = jsonDecode(response.body);
      print("voici notre responseData");
      print(responseData);
      final token = responseData['access_token'];
      print("voici notre token");
      print(token);
      //Store the token in shared preferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', token);

      // Decode the token and extract the role, accountId, and clientId
      Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
      String role = decodedToken['role'];
      print("voici le role");
      print(role);
      //
     
      int clientId = decodedToken['id'];
      print("voici notre clientid");
      print(clientId);

      // Store the role, accountId, and clientId as cookies
     
      if (role == 'CLIENT') {
       final cookieJar = CookieJar();
  if (response.headers.containsKey('set-cookie')) {
    final setCookies = response.headers['set-cookie']!;
    final cookies = <Cookie>[];
    final individualCookies = setCookies.split(',');
    for (var setCookie in individualCookies) {
      final cookie = Cookie.fromSetCookieValue(setCookie);
      cookies.add(cookie);
    }
    cookies.add(Cookie('client_id', clientId.toString()));
      var i = cookieJar.saveFromResponse(url, cookies);
      print(i);
  }

        Service.clientId = clientId;
        print("ligne 105");
        print(cookieJar);
        print("Affiche de cookies ");
        // Afficher les cookies
    
        // Redirect to the Home screen
        Service.clientId = clientId;
        Service.accessToken= token;
         Get.offAll(() => Home());
        // Get.offAll(() => OtpScreen());
        
      } else {
        // Handle other roles or scenarios
        print("You are not a client");
        Get.offAll(() => LoginScreen());
      }

     
      } else {
      print('Login failed');
      print('Response status code: ${response.statusCode}');
      }
  }
 

/*
  Future<void> login() async {
  final url = Uri.parse('http://192.168.100.157:8084/api/v1/auth/authenticate');
  final headers = {'Content-Type': 'application/json'};
  final body = jsonEncode({
    'email': emailController.text,
    'password': passwordController.text,
  });

  final response = await http.post(url, headers: headers, body: body).timeout(Duration(seconds: 10));;

  if (response.statusCode == 200) {
    final responseData = jsonDecode(response.body);
    final token = responseData['access_token'];

    // Store the token in shared preferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
    print(body);

    // Decode the token and extract the role, accountId, and clientId
    Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
    String role = decodedToken['role'];
    String accountId = decodedToken['accountId'];
    String clientId = decodedToken['id'];
    // Store the role, accountId, and clientId as cookies
    final cookie = '${role};${clientId}';
    final cookieHeader = {'Set-Cookie': cookie};

    // Send the cookie back to the server in subsequent requests by adding it to the headers
    final headersWithCookie = {'Cookie': cookie};
    if (role == 'CLIENT') {
      // Redirect to the Home screen
      Get.offAll(() => Home());
      
    } else {
      // Handle other roles or scenarios
      print("your are not client");
    }

    // Set the variables as global variables or store them in shared preferences for later use

    print('Token: $token');
    print('Role: $role');
    print('Account ID: $accountId');
    print('Client ID: $clientId');
  } else {
    print('Login failed');
    print('Response status code: ${response.statusCode}');
  }
}
*/

  //**********OTP*********************
  Future<void> verifyOtp( int? clientId) async {
    String accessToken = Service.getAccessToken()!;
    print("voici accessToken");
    print(accessToken);
    String id = clientId.toString();
    print(id);
   final url = Uri.parse('http://192.168.43.36:8084/fim/est3Dgate/sendVerificationCode/$id');
    //final headers = {'Content-Type': 'application/json'};
    

    final response = await http.get(url, headers: {'Authorization': 'Bearer $accessToken'});

    if (response.statusCode == 200) {
      print("requette a le status 200 ça marche");
      print("voici notre responseData of otp");
      print(response);
      } else {
        print("You are not a client");
      }

     
    
  }
//-----------------credit cart informations
  Future<Map<String, dynamic>> fetchData() async {
    final response = await http.get(Uri.parse('https://votre-api.com/donnees'));
    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      return responseData;
    } else {
      throw Exception('Erreur lors de la récupération des données: ${response.statusCode}');
    }
  }
  //---------------------------data balance 
  //Future<double> fetchBalance(int accountId) async {
  Future<double> fetchBalance(int? clientId) async {
  try {
    String accessToken = Service.getAccessToken()!;
    print("voici accessToken");
    print(accessToken);
    String id = clientId.toString();
    String apiUrl = 'http://192.168.43.36:8084/fim/est3Dgate/getAccountBalance/$id';
    
    final response = await http.get(
      Uri.parse(apiUrl),
      headers: {'Authorization': 'Bearer $accessToken'} );
    
    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      final accountBalance = responseData['balance'];
      print(accountBalance);
      return double.parse(accountBalance.toString());
    } else {
      throw Exception('Erreur lors de la récupération de la balance: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Erreur lors de la récupération de la balance: $e');
  }
}
Future<int> fetchAccountId(int? clientId) async {
  try {
    String accessToken = Service.getAccessToken()!;
    print("voici accessToken");
    print(accessToken);
    String id =clientId.toString();
    String apiUrl = 'http://192.168.43.36:8084/client/getAccountId/$id';
    
    final response = await http.get(
      Uri.parse(apiUrl),
      headers: {'Authorization': 'Bearer $accessToken'});
    
    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      final accountId = responseData['accountId'];
      print("accountId detecter");
      print(accountId);
      return int.parse(accountId.toString());
    } else {
      throw Exception('Erreur lors de la récupération de la accountId: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Erreur lors de la récupération de la AccountId: $e');
  }
}
  /*
  Future<double> fetchBalance(int accountId) async {
  try {
    String id = accountId.toString();
    String apiUrl = 'http://192.168.1.7:8084/fim/est3Dgate/getAccountBalance/$id';
    
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      final accountBalance = responseData['balance'];
      print(accountBalance);
      return double.parse(accountBalance.toString());
    } else {
      throw Exception('Erreur lors de la récupération de la balance: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Erreur lors de la récupération de la balance: $e');
  }
} */
//-----------------history data 
Future<List<Transaction>> fetchHistoryData(int? clientId) async {
  String id = clientId.toString();
  String accessToken = Service.getAccessToken()!;
    String apiUrl = 'http://192.168.43.36:8084/fim/est3Dgate/getTransactionHistories/$id';
  //final response = await http.get(Uri.parse(apiUrl,headers: {'Authorization': 'Bearer $accessToken'} ));
  final response = await http.get(
      Uri.parse(apiUrl),
      headers: {'Authorization': 'Bearer $accessToken'} );

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      final List<Transaction> transactions = []; // Empty list of transactions

      if (responseData == null) return []; // Return empty list if responseData is null

      for (var data in responseData) {
      final transaction = Transaction(
        date: data['date'],
        creditor: data['creditor'],
        amount: data['amount'],
        description: data['description'],
        transactionStatus: data['transactionStatus'],
        creditorType: data['creditorType'],
        phoneNumber: data['phoneNumber'],
      );
      transactions.add(transaction);
      }
      List<Transaction> reversedTransactions = transactions.reversed.toList();

      print("les donnees de transaction");
      print(reversedTransactions);
      return reversedTransactions;
    } else {
      throw Exception('Erreur lors de la récupération des données: ${response.statusCode}');
    }
  }
  //---------------Profile information-----------
  Future<Client> fetchProfileData(String clientId) async {
  String clientId = Service.clientId.toString();
  print("je suis dans le profile ");
  print("clientid");
  print(clientId);
  String accessToken = Service.getAccessToken()!;
  print(accessToken);
  print(accessToken);
  String apiUrl = 'http://192.168.43.36:8084/client/profile/getAccount/$clientId';
  print("je suis apres apiUrl");

  final response = await http.get(
    Uri.parse(apiUrl),
    headers: {'Authorization': 'Bearer $accessToken'},
  );
  print("je suis apres headers");
  if (response.statusCode == 200) {
    final responseData = json.decode(response.body);

    if (responseData.isNotEmpty) {
      print("avant data");
      //final data = responseData[0]; // Prendre seulement le premier élément
      print("apres data");
      // if (data != null) {
      final client = Client(
        clientId: clientId,
        firstName: responseData['firstName'],
        lastName: responseData['lastName'],
        email:responseData['email'],
        phoneNumber: responseData['phoneNumber'],
        cin: responseData['cin'],
      );

      print("Données du client");
      print(client);
      print("Données du client :");
      print("First Name: ${client.firstName}");
      print("Last Name: ${client.lastName}");
      print("Email: ${client.email}");

      return client; // Retourne le premier client trouvé
      // } else {
    // throw Exception('Données du client vides.'); // Gérer le cas où data est null
  // }
    } else {
      throw Exception('Aucun client trouvé.');
    }
  } else {
    throw Exception('Erreur lors de la récupération des données: ${response.statusCode}');
  }
}

    /*Future<Client> fetchProfileData(int accountId) async {
      String id = accountId.toString();
      String accessToken = Service.getAccessToken()!;
        String apiUrl = 'http://100.94.242.29:8084/fim/est3Dgate/getTransactionHistories/$id';
      //final response = await http.get(Uri.parse(apiUrl,headers: {'Authorization': 'Bearer $accessToken'} ));
      final response = await http.get(
          Uri.parse(apiUrl),
          headers: {'Authorization': 'Bearer $accessToken'} );

        if (response.statusCode == 200) {
          final responseData = json.decode(response.body);
          //final List<Client> clients = []; // Empty list of transactions

          //if (responseData == null) return ; // Return empty list if responseData is null

          for (var data in responseData) {
          final client = Client(
            clientId:id ,
            firstName: data['firstName'],
            lastName: data['lastName'],
            email: data['email'],
            phoneNumber: data['phoneNumber'],
            cin: data['cin'],
          );
          //transactions.add(transaction);
          }
          //List<Transaction> reversedTransactions = transactions.reversed.toList();

          print("les donnees de transaction");
          
          return client;
        } else {
          throw Exception('Erreur lors de la récupération des données: ${response.statusCode}');
        }
      }*/
  //-------------------change password
  /*
  static Future<void> changePassword(String currentPassword, String newPassword) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
             //Service.client != null au lieu du condition suivante
    if (Service.accountId != null && Service.clientId != null) {
      final url = Uri.parse('http://votre-url-de-changement-de-mot-de-passe');
      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };
      final body = jsonEncode({
        'currentPassword': currentPassword,
        'newPassword': newPassword,
      });

      try {
        final response = await http.put(url, headers: headers, body: body).timeout(Duration(seconds: 10));

        if (response.statusCode == 200) {
          print('Le mot de passe a été changé avec succès');
        } else {
          print('Échec du changement de mot de passe');
          print('Code de statut de la réponse: ${response.statusCode}');
        }
      } catch (error) {
        print('Une erreur s\'est produite lors du changement de mot de passe: $error');
      }
    } else {
      print('L\'utilisateur n\'est pas un client');
    }
  }*/

//*****************************recharge */
   Future<void> sendDataToBackend(Map<String, dynamic> jsonData,String? otpNumber) async {
    try {
      String accessToken = Service.getAccessToken()!;

      //String otpNumber = getOtpNumber()!;
      print("voici otp dans sendataBackend");
      print(otpNumber);
      print(accessToken);
      print(jsonData);
      String apiUrl =
          'http://192.168.43.36:8084/fim/est3Dgate/$otpNumber/makeTransaction';
      final body = jsonEncode(jsonData);
      /*var headers = {
        //'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken'
      };*/
      print(apiUrl);
      print("je suis apres headers");
      var url = Uri.parse(apiUrl);
      print("je suis apres url");
      /* http.Response response = await http.post(
        url,
        body: jsonEncode(jsonData),
        headers: headers,
      );*/
      final response = await http.post(
          Uri.parse(apiUrl),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $accessToken',
          },
          body: body);
      print("je suis apres body");
      print(jsonData);

      if (response.statusCode == 200) {
        print('Data sent successfully car satatus 200');
        var responseData = jsonDecode(response.body);
        // Handle the response data as needed

        print('voici reponce');
        print('Response: $responseData');
      } else {
        // Registration failed
        print('Recharging failed');
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (e) {
      Get.back();
      showDialog(
        context: Get.context!,
        builder: (context) {
          return SimpleDialog(
            title: Text("Error"),
            titlePadding: EdgeInsets.all(20),
            children: [Text(e.toString())],
          );
        },
      );
    }
  }


}

class Transaction {
  final String date;
  final String creditor;
  final double amount;
  final String? description;
  final String? transactionStatus;
  final String? creditorType;
  final String? phoneNumber;

  Transaction({required this.date, required this.creditor, required this.amount, this.description, this.transactionStatus,this.creditorType,this.phoneNumber});
  
}
