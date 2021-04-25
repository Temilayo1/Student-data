//Author: Adeboye

//dart library for input
import 'dart:io';

import 'registration.dart';

//import registration method from registration.dart
// import 'registration.dart';

//the method to greet the admin

void welcome() {
  var hello = 'Hello!!!';
  var welcome = 'Do you want to register a New Student?';
  var res = 'Y/N';
  var userResponse = '';
  print(hello);
  print(welcome);
  print(res);
  userResponse = stdin.readLineSync();
  if (userResponse.contains('Y') ||
      userResponse.contains('y') ||
      userResponse.contains('YES') ||
      userResponse.contains('yes')) {
    deptEnquiry();
  } else {
    print('Thank you, Goodbye!');
  }
}


//method to ask the admin to input student depsrtment
void deptEnquiry() {
  print('Enter Department');
  // ignore: omit_local_variable_types
  String department = stdin.readLineSync();
  deptCheck(department);
}
//check if the department entered is correct or not
void deptCheck(String department) {
  var dept = 'SBSC-Unique';
  var dept2 = 'SBSC-Awesome';
  var dept3 = 'SBSC-Lit';

  if (department.contains(dept.toLowerCase())||
      department.contains(dept2.toLowerCase()) ||
      department.contains(dept3.toLowerCase())) {

        //if department is correct, it starts registr
    var registration = Registration(department);
    registration.ansEnquiry();
  } else if (department == 'exit') {
    print('Thank you, Goodbye!!!.');
  } else {
    print(
        "The department you entered does not exist.\n Please enter a correct department or type \'exit\' to exit the program");
  }
  deptEnquiry();
}
