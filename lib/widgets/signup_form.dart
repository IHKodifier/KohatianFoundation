import 'package:flutter/foundation.dart';

import '../widget_export.dart';

class SignupForm extends ConsumerStatefulWidget {
  const SignupForm({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignupFormState();
}

class _SignupFormState extends ConsumerState<SignupForm> {
  bool isSignupWithGoogle = false;
  bool isSignUpWithEmail = false;
  TextEditingController kitno = TextEditingController();
  TextEditingController house = TextEditingController();
  TextEditingController domicile = TextEditingController();
  TextEditingController mobileNumber = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  bool passwordIsHidden = true;
  var cadetFormKey = GlobalKey<FormState>();
  var emailFormKey = GlobalKey<FormState>();
  AuthService authService = AuthService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isSignUpWithEmail = false;
    isSignupWithGoogle = false;
    kitno.text = '';
    name.text = '';
    house.text = '';
    email.text = '';
    password.text = '';
    confirmpassword.text = '';
    domicile.text = '';
    mobileNumber.text = '';
  }

  @override
  void dispose() {
    kitno.dispose();
    name.dispose();
    house.dispose();
    email.dispose();
    password.dispose();
    confirmpassword.dispose();
    domicile.dispose();
    mobileNumber.dispose();
    super.dispose();
  }

//cadet Details Form
  Widget cadetDetailsForm() {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Form(
          key: cadetFormKey,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(),
                  //Kit No Form Field
                  SizedBox(
                    // width: constraints.maxWidth / 2,
                    width: 210,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: kitno,
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
                              .titleMedium
                              ?.copyWith(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.bold),
                          label: const Text('Kit No'),
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
                    // width: constraints.maxWidth / 2,
                    width: 210,
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
                  Spacer(),
                ],
              ),
              // Name FormField
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 400,
                  child: TextFormField(
                    controller: name,
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
                  width: 400,
                  child: TextFormField(
                    controller: domicile,
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
                  width: 400,
                  child: TextFormField(
                    controller: mobileNumber,
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
            ],
          ),
        );
      },
    );
  }

//Email Form
  Widget emailDetailsForm() {
    return Form(
      key: emailFormKey,
      child: Column(
        children: [
          emailFormField(),
          passwordFormField(),
          confirmPasswordFormField(),
        ],
      ),
    );
  }

// Email Form Field
  Padding emailFormField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 400,
        child: TextFormField(
          controller: email,
          validator: (value) {
            final isValid = EmailValidator.validate(value!);
            if (!isValid) {
              return 'badly formatted email';
            }
            return null;
          },
          decoration: InputDecoration(
            hintStyle: Theme.of(context)
                .textTheme
                .labelSmall
                ?.copyWith(fontStyle: FontStyle.italic, color: Colors.grey),
            labelStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold),
            hintText: 'Email address',
            border: const OutlineInputBorder(),
            label: const Text('Email'),
          ),
        ),
      ),
    );
  }

//Password FormField
  Padding passwordFormField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 400,
        child: TextFormField(
            obscureText: passwordIsHidden,
            controller: password,
            decoration: InputDecoration(
              hintStyle: Theme.of(context)
                  .textTheme
                  .labelSmall
                  ?.copyWith(fontStyle: FontStyle.italic, color: Colors.grey),
              labelStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold),
              hintText: 'at least 8 characters',
              border: const OutlineInputBorder(),
              label: const Text('Password'),
              suffixIcon: IconButton(
                icon: Icon(
                    passwordIsHidden ? Icons.visibility : Icons.visibility_off),
                onPressed: () {
                  setState(() {
                    passwordIsHidden = !passwordIsHidden;
                  });
                },
              ),
            ),
            validator: (value) {
              return password.text == '' ? ' password is required' : '';
            }),
      ),
    );
  }

//Confirm Password Form Field
  Padding confirmPasswordFormField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 400,
        child: TextFormField(
          obscureText: passwordIsHidden,
          controller: confirmpassword,
          decoration: InputDecoration(
            hintStyle: Theme.of(context)
                .textTheme
                .labelSmall
                ?.copyWith(fontStyle: FontStyle.italic, color: Colors.grey),
            labelStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                ),
            suffixIcon: IconButton(
              icon: Icon(
                  passwordIsHidden ? Icons.visibility : Icons.visibility_off),
              onPressed: () {
                setState(() {
                  passwordIsHidden = !passwordIsHidden;
                });
              },
            ),
            hintText: 'confirm Password',
            border: const OutlineInputBorder(),
            label: const Text('Confirm Password'),
          ),
          validator: (value) {
            if (password.text != confirmpassword.text) {
              return 'passwords do not macth';
            }

            return confirmpassword.text == ''
                ? 'confirm password is required'
                : '';
          },
        ),
      ),
    );
  }

//Signup With Gmail  Button Bar
  Widget gmailButtonBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        signUpWithGoogleButton(),
        formRestButton(),
      ],
    );
  }

  //Signup with Email Button Bar
  Widget emailButtonBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        signUpWithEmailButton(),
        formRestButton(),
      ],
    );
  }

  //form reset button
  Widget formRestButton() {
    return SizedBox(
      height: 50,
      child: ElevatedButton(
        onPressed: () {},
        child: const Text('Reset '),
      ),
    );
  }

//signup With GoogleButton
  Widget signUpWithGoogleButton() {
    return SizedBox(
      height: 50,
      child: ElevatedButton.icon(
        icon: FaIcon(
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

            if (userCredential != null) {
              if (kDebugMode) {
                print('User created: ${userCredential.user}');
              }

              final result = await authService.createAppUserInDb(AppUser(
                  uuid: userCredential.user!.uid,
                  name: name.text,
                  email: email.text,
                  isValidated: false,
                  roles: [UserRole.cadet()]));

              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const SignUpSucess(),
              ));
            } else {
              print('cadet Form is not valid');
            }
          }
        },
        label: const Text('Signup with Google '),
      ),
    );
  }

//signup with Email Button
  Widget signUpWithEmailButton() {
    return SizedBox(
      height: 50,
      child: ElevatedButton.icon(
        icon: FaIcon(
          FontAwesomeIcons.envelope,
          // color: Colors.red,
        ),
        onPressed: () async {
          if (cadetFormKey.currentState!.validate() &&
              emailFormKey.currentState!.validate()) {
            print('cadet Form is valid');
            print('Email Form is valid');

            // Get email and password
            final emailValue = email.text.trim();
            final passwordValue = password.text.trim();
//TODO write code for this
            try {
              // Create user with email and password
              final userCredential =
                  await FirebaseAuth.instance.createUserWithEmailAndPassword(
                email: emailValue,
                password: passwordValue,
              );

              // User created successfully
              print('User created: ${userCredential.user}');

              // You can now redirect the user to a different screen or perform other actions.
            } on FirebaseAuthException catch (e) {
              // Handle errors during sign-up
              if (e.code == 'weak-password') {
                print('The password provided is too weak.');
              } else if (e.code == 'email-already-in-use') {
                print('The account already exists for that email.');
              }
            } catch (e) {
              print('Error during sign-up: $e');
            }
          }
        },
        label: const Text('Signup with Email '),
      ),
    );
  }

//signup USING Google Button
  Widget signUpUsingGoogleButton() {
    return SizedBox(
      height: 50,
      child: ElevatedButton.icon(
        icon: FaIcon(
          FontAwesomeIcons.google,
        ),
        onPressed: () {
          setState(() {
            isSignupWithGoogle = true;
            isSignUpWithEmail = false;
          });
        },
        label: const Text('Signup Using Google '),
      ),
    );
  }

//signup USING  Email Button
  Widget signUpUsingEmailButton() {
    return SizedBox(
      height: 50,
      child: ElevatedButton.icon(
        icon: FaIcon(
          FontAwesomeIcons.envelope,
          // color: Colors.red,
        ),
        onPressed: () {
          setState(() {
            isSignupWithGoogle = false;
            isSignUpWithEmail = true;
          });
        },
        label: const Text('Signup Using Email '),
      ),
    );
  }

  //Sign Up With Google Form
  Widget gForm() {
    return Column(
      children: [
        // const Text('Sign up using Gmail'),
        cadetDetailsForm(),
        const SizedBox(height: 30),
        gmailButtonBar(),
        const SizedBox(height: 30),
      ],
    );
  }

//Sign up Using Email Form
  Widget emailForm() {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Text('Sign up using Email/Password'),
          cadetDetailsForm(),
          emailDetailsForm(),
          const SizedBox(height: 30),
          emailButtonBar(),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //Signup Mode selector Gmailvs Email mode
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            //Signup with Google Button
            signUpUsingGoogleButton(),
            //Signup with Email Button
            signUpUsingEmailButton(),
          ],
        ),

        isSignupWithGoogle ? gForm() : Container(),

        //Signup with Email Button
        isSignUpWithEmail ? emailForm() : Container(),
        // cadetDetailsForm(),

        SizedBox(
          height: 8,
        ),
      ],
    );
  }
}
