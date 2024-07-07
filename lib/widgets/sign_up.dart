
// ignore_for_file: avoid_print

import 'package:kohatian_foundation/widget-export.dart';
import 'package:email_validator/email_validator.dart';

class SignupForm extends ConsumerStatefulWidget {
  const SignupForm({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignupFormState();
}

class _SignupFormState extends ConsumerState<SignupForm> {
  bool signupWithGoogle = false;
  bool signUpWithEmail = false;
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    signUpWithEmail = false;
    signupWithGoogle = false;
    kitno.text = '';
    name.text = '';
    house.text = '';
    email.text = '';
    password.text = '';
    confirmpassword.text = '';
    domicile.text = '';
    mobileNumber.text = '';
  }

 
  Widget gForm() {
    return Column(
      children: [
        const Text('Sign up using Gmail'),
        cadetDetails(),
        const SizedBox(height: 30),
        gmailButtonBar(),
        const SizedBox(height: 30),
      ],
    );
  }

  Widget emailForm() {
    //TODO  update this
    return SingleChildScrollView(
      child: Column(
        children: [
          const Text('Sign up using Email/Password'),
          cadetDetails(),
          emailDetails(),
          const SizedBox(height: 30),
          emailButtonBar(),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget cadetDetails() {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Form(
          key: cadetFormKey,
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //Kit No Form Field
                  SizedBox(
                    width: constraints.maxWidth / 2,
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
                        },
                        onFieldSubmitted: (value) {
                          //TODO implement this
                        },
                      ),
                    ),
                  ),
                  //House FormField
                  SizedBox(
                    width: constraints.maxWidth / 2,
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
                            return 'e.g. KH,JH,IH,MH,RH';
                          }
                        },
                        onFieldSubmitted: (value) {
                          //TODO implement this
                        },
                      ),
                    ),
                  ),
                ],
              ),
              // Name FormField
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: name,
                  decoration: InputDecoration(
                    hintText: 'e.g. Imtiaz Hussain Baloch',
                    border: const OutlineInputBorder(),
                    hintStyle: Theme.of(context).textTheme.labelSmall?.copyWith(
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
                  },
                  onFieldSubmitted: (value) {
                    //TODO implement this
                  },
                ),
              ),
              //Domicile
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: domicile,
                  decoration: InputDecoration(
                    hintText: 'e.g. Swat',
                    border: const OutlineInputBorder(),
                    hintStyle: Theme.of(context).textTheme.labelSmall?.copyWith(
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
                  },
                  onFieldSubmitted: (value) {
                    //TODO implement this
                  },
                ),
              ),
              //mobile number
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: mobileNumber,
                  decoration: InputDecoration(
                    hintText: 'e.g. 0333 5364111',
                    border: const OutlineInputBorder(),
                    hintStyle: Theme.of(context).textTheme.labelSmall?.copyWith(
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
                  },
                  onFieldSubmitted: (value) {
                    //TODO implement this
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget gmailButtonBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        signUpWithGoogleButton(),
        formRestButton(),
      ],
    );
  }

  Widget formRestButton() {
    return Container(
      height: 50,
      child: ElevatedButton(
        onPressed: () {},
        child: const Text('Reset '),
      ),
    );
  }

  Widget signUpWithGoogleButton() {
    return Container(
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          if (cadetFormKey.currentState!.validate()) {
            print('cadet Form is valid');
      
            //TODO implement FirebaseAuth code
          }
        },
        child: const Text('Signup with Google '),
      ),
    );
  }

  Widget emailButtonBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        signUpWithEmailButton(),
        formRestButton(),
      ],
    );
  }

  Widget signUpWithEmailButton() {
    return Container(
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          if (cadetFormKey.currentState!.validate()) {
            print('cadet Form is valid');
           
      
            //TODO implement FirebaseAuth code
          }
 if (emailFormKey.currentState!.validate()) {
              print('Email Form is valid');
            }

        },
        child: const Text('Signup with Email '),
      ),
    );
  }

  Widget emailDetails() {
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

  Padding emailFormField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: email,
        validator: (value) {
          final isValid =  EmailValidator.validate(value!);
          if (!isValid) { 
            return 'badly formatted email';
          }
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
    );
  }

  Padding confirmPasswordFormField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
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
              fontWeight: FontWeight.bold),
          suffixIcon: IconButton(
            icon: Icon(
                passwordIsHidden ? Icons.visibility_off : Icons.visibility),
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
      ),
    );
  }

  Padding passwordFormField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
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
                passwordIsHidden ? Icons.visibility_off : Icons.visibility),
            onPressed: () {
              setState(() {
                passwordIsHidden = !passwordIsHidden;
              });
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Textediti
    return SliverToBoxAdapter(
      child: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        width: double.infinity,
        height: MediaQuery.of(context).size.height + 250,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            signUpHeaderText(context),
            const Spacer(),
            SizedBox(
              width: MediaQuery.of(context).size.width / 3,
              child: signupSubHeaderText(context),
            ),
            const Spacer(),
            SizedBox(
              width: MediaQuery.of(context).size.width / 3,
              child: Card(
                elevation: 15,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              signupWithGoogle = true;
                              signUpWithEmail = false;
                            });
                          },
                          icon: CachedNetworkImage(
                            imageUrl:
                                'https://cdn.iconscout.com/icon/free/png-256/free-google-152-189813.png',
                            width: 50,
                            height: 50,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              signUpWithEmail = true;
                              signupWithGoogle = false;
                            });
                          },
                          icon: CachedNetworkImage(
                            imageUrl:
                                'https://banner2.cleanpng.com/20190404/bwl/kisspng-computer-icons-email-clip-art-portable-network-gra-front-office-staff-colorado-eagles-5ca5a147867bf4.2168492915543585995509.jpg',
                            width: 50,
                            height: 50,
                          ),
                        ),
                      ],
                    ),
                    signupWithGoogle
                        ? gForm()
                        : signUpWithEmail
                            ? emailForm()
                            : Container(),
                    Container(),
                  ],
                ),
              ),
            ),
            const Spacer(
              flex: 4,
            ),
          ],
        ),
      ),
    );
  }

  Text signupSubHeaderText(BuildContext context) {
    return Text(
              'As an ex Cadet, you are welcome to Sign up for the Kohatian Band of Brothers. Your signup will be reviewed by your "Entry Coordinator". Once validated, you will also receive aconfirmation  email on your email. ',
              style: Theme.of(context).textTheme.bodyLarge,
            );
  }

  Text signUpHeaderText(BuildContext context) {
    return Text(
            'Sign Up',
            style: Theme.of(context).textTheme.displayLarge,
          );
  }
}
