import 'package:flutter/material.dart';
import 'package:free_flutter_ui_kits/screen/BankingChangePasword.dart';
import 'package:free_flutter_ui_kits/utils/BankingContants.dart';
import 'package:nb_utils/nb_utils.dart';

import '../apicall.dart';
import '../utils/BankingColors.dart';
import '../utils/BankingImages.dart';
import '../utils/BankingStrings.dart';
import '../utils/BankingWidget.dart';
import 'BankingContact.dart';
import 'BankingLocation.dart';
import 'BankingNews.dart';
import 'BankingQuestionAnswer.dart';
import 'BankingRateInfo.dart';
import 'BankingShareInformation.dart';
import 'BankingTermsCondition.dart';

class BankingMenu extends StatefulWidget {
  static var tag = "/BankingMenu";

  @override
  _BankingMenuState createState() => _BankingMenuState();
}

class _BankingMenuState extends State<BankingMenu> {
  final _apiCall = ApiCall(); // Initialize your API call instance here

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Banking_app_Background,
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              10.height,
              Text(Banking_lbl_Menu,
                  style:
                      boldTextStyle(color: Banking_TextColorPrimary, size: 35)),
              16.height,
              Container(
                padding: EdgeInsets.all(8),
                decoration: boxDecorationWithShadow(
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CircleAvatar(
                        backgroundImage: AssetImage(Banking_ic_user1),
                        radius: 40),
                    10.width,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        5.height,
                        Text("Sasith Wickramasinghe",
                            style: boldTextStyle(
                                color: Banking_TextColorPrimary, size: 18)),
                        5.height,
                        Text("123 456 789",
                            style: primaryTextStyle(
                                color: Banking_TextColorSecondary,
                                size: 16,
                                fontFamily: fontMedium)),
                        5.height,
                        Text(Banking_lbl_app_Name,
                            style: primaryTextStyle(
                                color: Banking_TextColorSecondary,
                                size: 16,
                                fontFamily: fontMedium)),
                      ],
                    ).expand()
                  ],
                ),
              ),
              16.height,
              Container(
                padding: EdgeInsets.all(8),
                decoration: boxDecorationWithShadow(
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: <Widget>[
                    bankingOption(Banking_ic_Setting, Banking_lbl_Setting,
                        Banking_blueColor),
                    bankingOption(Banking_ic_security,
                            Banking_lbl_Change_Password, Banking_pinkColor)
                        .onTap(() {
                      BankingChangePassword().launch(context);
                    }),
                    bankingOption(
                            Banking_ic_Share,
                            Banking_lbl_Share_Information_account,
                            Banking_greenLightColor)
                        .onTap(() {
                      BankingShareInformation().launch(context);
                    }),
                  ],
                ),
              ),
              16.height,
              Container(
                padding: EdgeInsets.all(8),
                decoration: boxDecorationWithShadow(
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: <Widget>[
                    10.height,
                    bankingOption(Banking_ic_News, Banking_lbl_News,
                            Banking_blueColor)
                        .onTap(() {
                      BankingNews().launch(context);
                    }),
                    bankingOption(
                            Banking_ic_Chart,
                            Banking_lbl_Rate_Information,
                            Banking_greenLightColor)
                        .onTap(() {
                      BankingRateInfo().launch(context);
                    }),
                    bankingOption(Banking_ic_Pin, Banking_lbl_Location,
                            Banking_greenLightColor)
                        .onTap(() {
                      BankingLocation().launch(context);
                    }),
                    10.height,
                  ],
                ),
              ),
              16.height,
              Container(
                padding: EdgeInsets.all(8),
                decoration: boxDecorationWithShadow(
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: spacing_middle,
                    ),
                    bankingOption(Banking_ic_TC, Banking_lbl_Term_Conditions,
                            Banking_greenLightColor)
                        .onTap(() {
                      BankingTermsCondition().launch(context);
                    }),
                    bankingOption(Banking_ic_Question,
                            Banking_lbl_Questions_Answers, Banking_palColor)
                        .onTap(() {
                      BankingQuestionAnswer().launch(context);
                    }),
                    bankingOption(Banking_ic_Call, Banking_lbl_Contact,
                            Banking_blueColor)
                        .onTap(() {
                      BankingContact().launch(context);
                    }),
                    SizedBox(
                      height: spacing_middle,
                    ),
                  ],
                ),
              ),
              16.height,
              Container(
                padding: EdgeInsets.all(8),
                decoration: boxDecorationWithShadow(
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: <Widget>[
                    bankingOption(Banking_ic_Logout, Banking_lbl_Logout,
                            Banking_pinkColor)
                        .onTap(() {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) =>
                            CustomDialog(_apiCall),
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomDialog extends StatelessWidget {
  final ApiCall _apiCall;

  CustomDialog(this._apiCall);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: const Offset(0.0, 10.0)),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            16.height,
            Text(Banking_lbl_Confirmation_for_logout,
                    style: primaryTextStyle(size: 18))
                .paddingOnly(top: 8, bottom: 8),
            Divider(height: 10, thickness: 1.0, color: Banking_greyColor),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text("Cancel", style: primaryTextStyle(size: 18)).onTap(() {
                  finish(context);
                }).paddingRight(16),
                Container(width: 1.0, height: 40, color: Banking_greyColor)
                    .center(),
                Text("Logout",
                        style:
                            primaryTextStyle(size: 18, color: Banking_Primary))
                    .onTap(() {
                  _apiCall.buttonClickcap(
                    startTime: DateTime.now(),
                    endTime: DateTime.now(),
                    startDate: DateTime.now(),
                    endDate: DateTime.now(),
                    screenName: 'Transfer Screen',
                    isFinalGoal: true,
                    buttonName: 'Transfer Button',
                    sequence: '',
                    property1: '',
                    property2: '',
                  );
                  finish(context);
                }).paddingLeft(16)
              ],
            ),
            16.height,
          ],
        ));
  }
}
