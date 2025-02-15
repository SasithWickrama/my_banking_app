import 'package:flutter/material.dart';

import '../apicall.dart';
import '../utils/BankingBottomNavigationBar.dart';
import '../utils/BankingColors.dart';
import '../utils/BankingImages.dart';
import '../utils/BankingStrings.dart';
import 'BankingHome1.dart';
import 'BankingMenu.dart';
import 'BankingPayment.dart';
import 'BankingSaving.dart';
import 'BankingTransfer.dart';

class BankingDashboard extends StatefulWidget {
  static var tag = "/BankingDashboard";

  @override
  _BankingDashboardState createState() => _BankingDashboardState();
}

class _BankingDashboardState extends State<BankingDashboard> {
  var selectedIndex = 0;
  var pages = [
    BankingHome1(),
    BankingTransfer(),
    BankingPayment(),
    BankingSaving(),
    BankingMenu(),
  ];

  final ApiCall _apiCall = ApiCall();

  @override
  void initState() {
    super.initState();
    _apiCall.buttonClick("Sampath_Bank"); // Call API with argument "HNB" when the widget is initialized
  }

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
    //_apiCall.buttonClick("HNB"); // Call API with different argument
    _apiCall.buttonClickcap(
      startTime: DateTime.now(),
      endTime: DateTime.now(),
      startDate: DateTime.now(),
      endDate: DateTime.now(),
      screenName: 'Transfer Screen',
      isFinalGoal: false,
      buttonName: 'Transfer Button',
      sequence: '',
      property1: '',
      property2: '',
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Banking_app_Background,
        bottomNavigationBar: BankingBottomNavigationBar(
          selectedItemColor: Banking_Primary,
          unselectedItemColor: Banking_greyColor.withOpacity(0.5),
          items: <BankingBottomNavigationBarItem>[
            BankingBottomNavigationBarItem(
                icon: Banking_ic_Home, title: Text(Banking_lbl_Home)),
            BankingBottomNavigationBarItem(
                icon: Banking_ic_Transfer, title: Text(Banking_lbl_Transfer)),
            BankingBottomNavigationBarItem(
                icon: Banking_ic_Payment, title: Text(Banking_lbl_Payment)),
            BankingBottomNavigationBarItem(
                icon: Banking_ic_Saving, title: Text(Banking_lbl_Saving)),
            BankingBottomNavigationBarItem(
                icon: Banking_ic_Menu, title: Text(Banking_lbl_Menu)),
          ],
          currentIndex: selectedIndex,
          unselectedIconTheme: IconThemeData(
              color: Banking_greyColor.withOpacity(0.5), size: 28),
          selectedIconTheme: IconThemeData(color: Banking_Primary, size: 28),
          onTap: _onItemTapped,
          type: BankingBottomNavigationBarType.fixed,
        ),
        body: SafeArea(
          child: pages[selectedIndex],
        ),
      ),
    );
  }
}
