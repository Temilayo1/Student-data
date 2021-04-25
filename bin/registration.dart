//Author Abdullahi & Ayodele & Simi

import 'dart:io';

import 'welcome.dart';
class Registration{
  String department;
  Registration(this.department){

  }
var bioStore = [
  ' Full Name',
  ' Gender',
  ' Phone Number',
  ' Email Address',
  ' Residential Address',
  ' BIO',
  ' School Fee'
];
// ignore: unnecessary_new
// ignore: deprecated_member_use
var res =  List(7);

void questions(userInfo) {
  print('Enter  $userInfo');
}

int i = 0;

void ansEnquiry() {
  print('Enter' + bioStore[i]);
  var answer = stdin.readLineSync();
  ansCheck(answer);
}

//check user response method
void ansCheck(String ansDetail) {
  if (ansDetail.isEmpty && ansDetail.isEmpty) {
    query('You need an input to continue');
  } else if (ansDetail == 'exit')
    // ignore: prefer_single_quotes
    // ignore: curly_braces_in_flow_control_structures
    print('goodbye.');
  else {
    switch (i) {
      case 1:
        if (!(ansDetail.toLowerCase() == 'female' ||
            ansDetail.toLowerCase() == 'male')) {
          query('Wrong input. Expected: Female, male, other');
        }
        break;
      case 2:
        if (!_validateNumber(ansDetail)) {
          query('Phone Number invalid');
        }
        break;
      case 3:
        if (!_validateEmail(ansDetail)) {
          query('Email invalid');
        }
        break;
      case 6:
        if (double.tryParse(ansDetail) == null) {
          query('Input invalid. Digits only required');
        }
        break;
    }

    res[i] = ansDetail;
    if (i < 6) {
      i++;
      ansEnquiry();
    } else {
      print('\n Registration Summary');
      print(' Full Name: ' +
          res[0] +
          ' \n Gender: ' +
          res[1] +
          ' \n Phone Number: ' +
          res[2] +
          ' \n Email Address: ' +
          res[3] +
          ' \n Residential Address: ' +
          res[4] +
          ' \n Bio: ' +
          res[5] +
          ' \n School fees: ' +
          res[6]+ 
          '\n Department:'
          +department);
      print('\n Registration Succesful!!!');

      print('Would You Like To Register A New Student?');
      print('Y/N');
      var resUser = stdin.readLineSync();
      if (resUser.toLowerCase() == 'yes' || resUser.toLowerCase() == 'y') {
        welcome();
      } else {
        print('\n Thank You, GoodBye!!! ');
        exit(0);
      }
    }
  }
}

//email validation method
bool _validateEmail(String value) {
  // This is just a regular expression for email addresses
  var p = '[a-zA-Z0-9\+\.\_\%\-\+]{1,256}' +
      '\\@' +
      '[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}' +
      '(' +
      '\\.' +
      '[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}' +
      ')+';
  // ignore: omit_local_variable_types
  RegExp regExp = RegExp(p);

  if (regExp.hasMatch(value)) {
    // So, the email is valid
    return true;
  } else {
    return false;
  }
}

//number validation method
bool _validateNumber(String value) {
  var pattern = r'^(?:[+0][1-9])?[0-9]{10,12}$';
  // ignore: omit_local_variable_types
  RegExp regExp = RegExp(pattern);

  if (regExp.hasMatch(value)) {
    // So, the number is valid
    return true;
  } else {
    return false;
  }
}

void query(String errorMessage) {
  print(errorMessage);
  ansEnquiry();
}
}