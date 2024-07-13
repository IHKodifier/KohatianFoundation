import '../widget-export.dart';

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
                          return null;
                        },
                        onFieldSubmitted: (value) {},
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
                            return 'valid input = KH,JH,IH,MH,RH';
                          }
                          return null;
                        },
                        onFieldSubmitted: (value) {},
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
                    return null;
                  },
                  onFieldSubmitted: (value) {},
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
                    return null;
                  },
                  onFieldSubmitted: (value) {},
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
                    return null;
                  },
                  onFieldSubmitted: (value) {},
                ),
              ),
            ],
          ),
        );
      },
    );
  }

// Email Form Field
  Padding emailFormField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
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
    );
  }

//Email Form
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

//Password FormField
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
          validator: (value) {
            return password.text == '' ? ' password is required' : '';
          }),
    );
  }

//Confirm Password Form Field
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
                fontWeight: FontWeight.bold,
              ),
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
        validator: (value) {
          if (password.text != confirmpassword.text) {
            return 'passwords do not macth';
          }

          return confirmpassword.text == ''
              ? 'confirm password is required'
              : '';
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        cadetDetails(),
      ],
    );
  }
}