import 'package:cartlist/APICALLBACK/callBackFunction.dart';
import 'package:cartlist/RESOURCE/colorFile.dart';
import 'package:cartlist/SERVICE/createUserApi.dart';
import 'package:cartlist/SHAREDDPREFERENCE/cartListsSharedPref.dart';
import 'package:cartlist/WIDGETS/alertDialogBox.dart';
import 'package:cartlist/WIDGETS/buttonWidgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class RegisterUser extends StatefulWidget {
  const RegisterUser({super.key});

  @override
  State<RegisterUser> createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {
  bool keybordAction = false;
  String? phoneNumber;

  bool passwordShow = true;

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController controllUserName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final widgetSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: colorWhite,
      body: Form(
        key: _formKey,
        child: Center(
          child: SingleChildScrollView(
            child: SizedBox(
              height: widgetSize.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: TextFormField(
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp("[0-9a-zA-Z]")),
                      ],
                      showCursor: keybordAction,
                      readOnly: keybordAction,
                      controller: controllUserName,
                      decoration: const InputDecoration(
                        labelText: 'User Name',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(),
                        ),
                      ),
                      validator: ((value) {
                        if (value!.isEmpty) {
                          return "Enter Valid User Name";
                        }
                      }),
                    ),
                  ),
                  const SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: IntlPhoneField(
                      showCursor: keybordAction,
                      readOnly: keybordAction,
                      decoration: const InputDecoration(
                        labelText: 'Phone Number',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(),
                        ),
                      ),
                      validator: (number) {
                        if (number!.completeNumber.isEmpty) {
                          return "Enter Your Phone Number";
                        }
                      },
                      initialCountryCode: 'IN',
                      onChanged: (phone) {
                        setState(() {
                          phoneNumber = phone.completeNumber;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  loginButton(
                    context: context,
                    buttonText: "REGISTER",
                    buttonAction: () async {
                      if (!_formKey.currentState!.validate()) {
                        return;
                      }
                      _formKey.currentState!.save();
                      showAlertDialogCommon(
                        context: context,
                        loading: true,
                        message: 'Loading...',
                      );
                      final response = await Authentication.authentication(
                        context: context,
                        userName: controllUserName.text,
                        phoneNumber: phoneNumber.toString(),
                        userLat: '',
                        userLong: '',
                      );

                      if (response.message ==
                          "Unable to reach the internet! Ple ase try again in  a minutes or two") {
                        // ignore: use_build_context_synchronously
                        Navigator.pushNamed(context, '/lossConnection');
                      } else if (response.data == null) {
                        showAlertInternetWarningMessage(
                            message: "Invalid Credentials", context: context);
                      } else if (response.data!.success == "login success") {
                        showAlertDialogCommon(
                          context: context,
                          loading: false,
                          message: response.data!.message,
                        );
                        getCategoryResponse(context: context);
                        getFavCategoryResponse(
                            context: context,
                            profileUserID: response.data!.userData.userId);
                        getStockProductResponse(
                            context: context,
                            profileUserID: response.data!.userData.userId);
                        getSponsorProductResponse(context: context);
                        getMainBannerResponse(context: context);
                        getSecondBannerResponse(context: context);

                        setUserCredentials(
                          userName: response.data!.userData.userName,
                          userPhone: response.data!.userData.userPhone,
                          userId: response.data!.userData.userId,
                          registerStatus: true,
                        );
                        // ignore: use_build_context_synchronously
                        Navigator.pushNamed(context, '/homeNavigation');
                      } else {
                        showAlertDialogCommon(
                          context: context,
                          loading: false,
                          message: response.data!.message,
                        );
                        getCategoryResponse(context: context);
                        getFavCategoryResponse(
                            context: context,
                            profileUserID: response.data!.userData.userId);
                        getStockProductResponse(
                            context: context,
                            profileUserID: response.data!.userData.userId);
                        getSponsorProductResponse(context: context);
                        getMainBannerResponse(context: context);
                        getSecondBannerResponse(context: context);

                        setUserCredentials(
                          userName: response.data!.userData.userName,
                          userPhone: response.data!.userData.userPhone,
                          userId: response.data!.userData.userId,
                          registerStatus: true,
                        );
                        // ignore: use_build_context_synchronously
                        Navigator.pushNamed(context, '/homeNavigation');
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
