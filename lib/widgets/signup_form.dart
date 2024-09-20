import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kohatian_foundation/pages/sign-in_page.dart';

import '../widget_export.dart';

class SignupForm extends ConsumerStatefulWidget {
  final String? kitNoParam; // Receive kitNo as argument
  const SignupForm({this.kitNoParam, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignupFormState();
}

class _SignupFormState extends ConsumerState<SignupForm> {
  bool isSignupUsingGoogle = false;
  bool isSignUpUsingEmail = false;
  TextEditingController kitNoController = TextEditingController();
  TextEditingController house = TextEditingController();
  TextEditingController domicileController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
  bool passwordIsHidden = true;
  var cadetFormKey = GlobalKey<FormState>();
  var emailFormKey = GlobalKey<FormState>();
  AuthService authService = AuthService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isSignUpUsingEmail = false;
    isSignupUsingGoogle = false;
    kitNoController.text = widget.kitNoParam ?? ''; // Get kitNo from widget
    nameController.text = '';
    house.text = '';
    emailController.text = '';
    passwordController.text = '';
    confirmpasswordController.text = '';
    domicileController.text = '';
    mobileNumberController.text = '';
  }

  @override
  void dispose() {
    kitNoController.dispose();
    nameController.dispose();
    house.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmpasswordController.dispose();
    domicileController.dispose();
    mobileNumberController.dispose();
    super.dispose();
  }

//cadet Details Form
  Widget cadetDetailsForm(BuildContext) {
    double mediaWidth = MediaQuery.of(context).size.width;
    double formWidth = 0;

    if ((ResponsiveBreakpoints.of(context).isDesktop) && (mediaWidth > 1100)) {
      formWidth = mediaWidth * .4;
    } else if ((ResponsiveBreakpoints.of(context).isDesktop) &&
        (mediaWidth < 1000)) {
      formWidth = 200;
    } else {
      formWidth = mediaWidth * .6;
    }


    return Form(
      key: cadetFormKey,
      child: Center(
        // elevation: 6.5,
        child: SizedBox(
          // height: 300,
          width: formWidth,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Cadet Details',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Spacer(),
                  //Kit No Form Field
                  SizedBox(
                    width: formWidth * .3,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: kitNoController,
                        decoration: InputDecoration(
                          hintText: 'e.g. 2924',
                          border: const OutlineInputBorder(),
                          hintStyle: Theme.of(context)
                              .textTheme
                              .labelSmall
                              ?.copyWith(
                                  fontStyle: FontStyle.italic,
                                  color: Colors.grey),
                          labelStyle: Theme.of(context)
                              .textTheme
                              .titleSmall
                              ?.copyWith(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.bold),
                          label: const Text('Kit #'),
                        ),
                        validator: (value) {
                          if (value == '') {
                            return 'Valid Kit Number is required';
                          }
                          return null;
                        },
                        onFieldSubmitted: (value) {},
                      ),
                    ),
                  ),

                  //House FormField
                  SizedBox(
                    width: formWidth * .3,
                    // width: 80,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: house,
                        // maxLengthEnforcement: MaxLengthEnforcement.enforced,
                        decoration: InputDecoration(
                          hintText: 'e.g. KH',
                          border: const OutlineInputBorder(),
                          hintStyle: Theme.of(context)
                              .textTheme
                              .labelSmall
                              ?.copyWith(
                                  fontStyle: FontStyle.italic,
                                  color: Colors.grey),
                          labelStyle: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.bold),
                          label: const Text('House'),
                        ),
                        validator: (value) {
                          if (value != '') {
                            value = value!.toUpperCase();
                          }

                          if (value == '' ||
                              !(value == 'JH' ||
                                  value == 'KH' ||
                                  value == 'IH' ||
                                  value == 'AH' ||
                                  value == 'MH' ||
                                  value == 'RH')) {
                            return 'valid input = KH,JH,IH,MH,RH';
                          }
                          return null;
                        },
                        onFieldSubmitted: (value) {},
                      ),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
              // Name FormField
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: formWidth * .58,
                  child: TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                      hintText: 'e.g. Imtiaz Hussain Baloch',
                      border: const OutlineInputBorder(),
                      hintStyle: Theme.of(context)
                          .textTheme
                          .labelSmall
                          ?.copyWith(
                              fontStyle: FontStyle.italic, color: Colors.grey),
                      labelStyle: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold),
                      label: const Text('Cadet Name'),
                    ),
                    validator: (value) {
                      if (value == '') {
                        return 'Name is required';
                      }
                      return null;
                    },
                    onFieldSubmitted: (value) {},
                  ),
                ),
              ),
              //Domicile
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: formWidth * .58,
                  child: TextFormField(
                    controller: domicileController,
                    decoration: InputDecoration(
                      hintText: 'e.g. Swat',
                      border: const OutlineInputBorder(),
                      hintStyle: Theme.of(context)
                          .textTheme
                          .labelSmall
                          ?.copyWith(
                              fontStyle: FontStyle.italic, color: Colors.grey),
                      labelStyle: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold),
                      label: const Text('Domicile'),
                    ),
                    validator: (value) {
                      if (value == '') {
                        return 'Domicile is required';
                      }
                      return null;
                    },
                    onFieldSubmitted: (value) {},
                  ),
                ),
              ),
              //mobile number
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: formWidth * .58,
                  child: TextFormField(
                    controller: mobileNumberController,
                    decoration: InputDecoration(
                      hintText: 'e.g. 0333 5364111',
                      border: const OutlineInputBorder(),
                      hintStyle: Theme.of(context)
                          .textTheme
                          .labelSmall
                          ?.copyWith(
                              fontStyle: FontStyle.italic, color: Colors.grey),
                      labelStyle: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold),
                      label: const Text('Mobile (preferebaly WhatsApp)'),
                    ),
                    validator: (value) {
                      if (value == '' ||
                          RegExp(r'[a-zA-Z]').hasMatch(value!) ||
                          value.length != 11) {
                        return 'invalid mobile number';
                      }
                      return null;
                    },
                    onFieldSubmitted: (value) {},
                  ),
                ),
              ),
          Padding(
            padding: const EdgeInsets.all(8), 
            child: SizedBox(
               width: formWidth * .58,
              child: gmailButtonBar()),
          ),
            ],
          ),
        ),
      ),
    );
    // },
    // );
  }

//Email Form
  // Widget emailDetailsForm() {
  //   return Form(
  //     key: emailFormKey,
  //     child: SizedBox(
  //       width: 500,
  //       child: Card(
  //         elevation: 15,
  //         child: Column(
  //           children: [
  //             Text(
  //               'Email & Password Details',
  //               style: Theme.of(context).textTheme.titleLarge,
  //             ),
  //             // emailFormField(),
  //             // passwordFormField(),
  //             // confirmPasswordFormField(),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

// Email Form Field
  // Padding emailFormField() {
  //   return Padding(
  //     padding: const EdgeInsets.all(8.0),
  //     child: SizedBox(
  //       width: 400,
  //       child: TextFormField(
  //         controller: emailController,
  //         validator: (value) {
  //           final isValid = EmailValidator.validate(value!);
  //           if (!isValid) {
  //             return 'badly formatted email';
  //           }
  //           return null;
  //         },
  //         decoration: InputDecoration(
  //           hintStyle: Theme.of(context)
  //               .textTheme
  //               .labelSmall
  //               ?.copyWith(fontStyle: FontStyle.italic, color: Colors.grey),
  //           labelStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
  //               color: Theme.of(context).primaryColor,
  //               fontWeight: FontWeight.bold),
  //           hintText: 'Email address',
  //           border: const OutlineInputBorder(),
  //           label: const Text('Email'),
  //         ),
  //       ),
  //     ),
  //   );
  // }

// //Password FormField
//   Padding passwordFormField() {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: SizedBox(
//         width: 400,
//         child: TextFormField(
//             obscureText: passwordIsHidden,
//             controller: passwordController,
//             decoration: InputDecoration(
//               hintStyle: Theme.of(context)
//                   .textTheme
//                   .labelSmall
//                   ?.copyWith(fontStyle: FontStyle.italic, color: Colors.grey),
//               labelStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
//                   color: Theme.of(context).primaryColor,
//                   fontWeight: FontWeight.bold),
//               hintText: 'at least 8 characters',
//               border: const OutlineInputBorder(),
//               label: const Text('Password'),
//               suffixIcon: IconButton(
//                 icon: Icon(
//                     passwordIsHidden ? Icons.visibility : Icons.visibility_off),
//                 onPressed: () {
//                   setState(() {
//                     passwordIsHidden = !passwordIsHidden;
//                   });
//                 },
//               ),
//             ),
//             validator: (value) {
//               return passwordController.text == ''
//                   ? ' password is required'
//                   : '';
//             }),
//       ),
//     );
//   }

//Confirm Password Form Field
  // Padding confirmPasswordFormField() {
  //   return Padding(
  //     padding: const EdgeInsets.all(8.0),
  //     child: SizedBox(
  //       width: 400,
  //       child: TextFormField(
  //         obscureText: passwordIsHidden,
  //         controller: confirmpasswordController,
  //         decoration: InputDecoration(
  //           hintStyle: Theme.of(context)
  //               .textTheme
  //               .labelSmall
  //               ?.copyWith(fontStyle: FontStyle.italic, color: Colors.grey),
  //           labelStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
  //                 color: Theme.of(context).primaryColor,
  //                 fontWeight: FontWeight.bold,
  //               ),
  //           suffixIcon: IconButton(
  //             icon: Icon(
  //                 passwordIsHidden ? Icons.visibility : Icons.visibility_off),
  //             onPressed: () {
  //               setState(() {
  //                 passwordIsHidden = !passwordIsHidden;
  //               });
  //             },
  //           ),
  //           hintText: 'confirm Password',
  //           border: const OutlineInputBorder(),
  //           label: const Text('Confirm Password'),
  //         ),
  //         validator: (value) {
  //           if (passwordController.text != confirmpasswordController.text) {
  //             return 'passwords do not macth';
  //           }

  //           return confirmpasswordController.text == ''
  //               ? 'confirm password is required'
  //               : '';
  //         },
  //       ),
  //     ),
  //   );
  // }

//Signup With Gmail  Button Bar
  Widget gmailButtonBar() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(child: signUpWithGoogleButton()),
            // const SizedBox(width: 10),
            // Expanded(child: formResetButton()),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          children: [
            Expanded(
              child: SizedBox(
                  height: 40,
                  child: TextButton(
                      onPressed: () =>
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const PublicHomePage(),
                          )),
                      child: const Text('Back'))),
            ),
          ],
        ),
      ],
    );
  }

  //Signup with Email Button Bar
  // Widget emailButtonBar() {
  //   return Column(
  //     children: [
  //       Row(
  //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //         children: [
  //           // Expanded(child: signUpWithEmailButton()),
  //           const SizedBox(width: 10),
  //           Expanded(child: formResetButton()),
  //           const SizedBox(width: 10),
  //         ],
  //       ),
  //       const SizedBox(
  //         height: 8,
  //       ),
  //       Row(
  //         children: [
  //           Expanded(
  //             child: SizedBox(
  //                 height: 40,
  //                 child: ElevatedButton(
  //                     onPressed: () =>
  //                         Navigator.of(context).push(MaterialPageRoute(
  //                           builder: (context) => const PublicHomePage(),
  //                         )),
  //                     child: const Text('Back'))),
  //           ),
  //         ],
  //       ),
  //     ],
  //   );
  // }

  //form reset button
  // Widget formResetButton() {
  //   return SizedBox(
  //     height: 40,
  //     child: ElevatedButton(
  //       onPressed: () {},
  //       child: const Text('Reset '),
  //     ),
  //   );
  // }

//signup With GoogleButton
  Widget signUpWithGoogleButton() {
    return SizedBox(
      height: 40,
      child: ElevatedButton.icon(
        icon: const FaIcon(
          FontAwesomeIcons.google,
          // color: Colors.red,
        ),
        onPressed: () async {
          //TODO  add autho code here

          if (cadetFormKey.currentState!.validate()) {
            if (kDebugMode) {
              print('cadet Form is valid');
            }

            final userCredential = await authService.signupWithGoogle();

            if (kDebugMode) {
              print('User created: ${userCredential.user}');
            }
            try {
               final int? kitNoInt = int.tryParse(kitNoController.text);

               //check if user profile already exists
              final result = await authService.createAppUserInDb(UserProfile(
                  uuid: userCredential.user!.uid,
                  name: nameController.text,
                  kitNo: kitNoInt!,
                  house: house.text.toUpperCase(),
                  domicile: domicileController.text,
                  mobileNumber: mobileNumberController.text,
                  email: userCredential.user!.email!,
                  profileImageUrl: userCredential.user!.photoURL!,
                  isValidated: false,
                  roles: [UserRole.cadet()]));

              final cadetData = {
                'domicile': domicileController.text,
                'hasSignedUp': true,
                'house': house.text.toUpperCase(),
                'kitNo': int.tryParse(kitNoController.text),
                'mobileNumber': mobileNumberController.text,
                'name': nameController.text,
                'profileImageUrl': userCredential.user!.photoURL,
                'email': userCredential.user!.email,
              };
              // Get the entryName from Firestore
              getEntryName(kitNoController.text).then(
                (value) {
                  FirebaseFirestore.instance
                      .collection('entrys')
                      .doc(value) 
                      .collection('cadets')
                      .doc(kitNoInt.toString())
                      .set(cadetData, SetOptions(merge: true));
                },
              );
              // Create a document in the Firestore collection
            } on FirebaseException catch (e) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(e.message!),
                ),
              );
            } catch (e) {
              ScaffoldMessenger.maybeOf(context)?.showSnackBar(
                SnackBar(
                  content: Text(e.toString()),
                ),
              );
            }

            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const SignUpSucess(),
            ));
          }
        },
        label: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('Signup  '),
        ),
      ),
    );
  }

  // Function to get entryName from Firestore based on kitNo
  Future<String?> getEntryName(String kitNo) async {
    // Extract the first two digits of the kit number
    final firstTwoDigits = int.tryParse(kitNo.substring(0, 2));

    // Query the 'entrys' collection based on the first two digits
    final querySnapshot = await FirebaseFirestore.instance
        .collection('entrys')
        .where('number', isEqualTo: firstTwoDigits.toString())
        .get();

    // If a document is found, return the entryName
    if (querySnapshot.docs.isNotEmpty) {
      return querySnapshot.docs.first['name'];
    }

    // If no document is found, return null
    return null;
  }



  //Sign Up With Google Form
  Widget gForm(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 300,
      child: Column(
        children: [
          // const SizedBox(height: 20),
          cadetDetailsForm(context),
          // const SizedBox(height: 30),
          // gmailButtonBar(),
          // const SizedBox(height: 30),
        ],
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return ResponsiveRowColumn(
      layout: ResponsiveBreakpoints.of(context).smallerThan('DESKTOP')
          ? ResponsiveRowColumnType.COLUMN
          : ResponsiveRowColumnType.ROW,
      //  rMainAxisAlignment: MainAxisAlignment.center,
      rowMainAxisAlignment: MainAxisAlignment.center,
      rowSpacing: 50,
      // colSpacing: 10,
      children: [
        ResponsiveRowColumnItem(
          child: signupArt(context),
        ),
        // ResponsiveRowColumnItem(child: Spacer(),),
        ResponsiveRowColumnItem(
          child: cadetDetailsForm(context),
        ),
        // ResponsiveRowColumnItem(child: Spacer(),),
      ],
    );
  }

  Widget signupArt(BuildContext context) => CachedNetworkImage(
      // height: 500,
      fit: BoxFit.fill,
      fadeInCurve: Curves.easeInCubic,
      placeholder: (context, url) => Container(
            color: Colors.grey.shade50,
          ),
      imageUrl:
          'https://st3.depositphotos.com/35530942/37682/v/450/depositphotos_376824262-stock-illustration-online-registration-sign-concept-young.jpg');

  SizedBox alreadyHaveAccount(BuildContext context) {
    return SizedBox(height: 30, child: _alternateStyle1(context));
  }

  ElevatedButton _elevatedButton(BuildContext context) {
    return ElevatedButton.icon(
        icon: const Icon(
          Icons.info_outline_rounded,
          // color: Colors.red,
        ),
        onPressed: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const SignInPage(),
            )),
        label: const Text('Already have an Account!    Proceed to Login'));
  }

  Widget _alternateStyle1(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const SignInPage(),
      )),
      child: Material(
        color: Colors.blueGrey.shade200,
        elevation: 5,
        child: const Center(
            child: Text('Already have an Account!    Proceed to Login')),
      ),
    );
    // ElevatedButton.icon(
    //     icon: const Icon(
    //       Icons.info_outline_rounded,
    //       // color: Colors.red,
    //     ),
    //     onPressed: () => Navigator.of(context).push(MaterialPageRoute(
    //           builder: (context) => SignInPage(),
    //         )),
    //     label: Text());
  }
}
