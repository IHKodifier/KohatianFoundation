import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kohatian_foundation/widget-export.dart';

class SignupForm extends ConsumerStatefulWidget {
  const SignupForm({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignupFormState();
}

class _SignupFormState extends ConsumerState<SignupForm> {
  bool signupWithGoogle = false;
  bool signUpWithEmail = false;
  TextEditingController kitno = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController house = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();

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
  }

  @override
  Widget build(BuildContext context) {
    // Textediti
    return SliverToBoxAdapter(
      child: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        width: double.infinity,
        height: MediaQuery.of(context).size.height + 50,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            Text(
              'Sign Up',
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const Spacer(),
            SizedBox(
              width: MediaQuery.of(context).size.width / 3,
              child: Text(
                'As an ex Cadet, you are welcome to Sign up for the Kohatian Band of Brothers. Your signup will be reviewed by your "Entry Coordinator". Once validated, you will also receive an email on your email confirmation. ',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            const Spacer(),
            SizedBox(
              width: MediaQuery.of(context).size.width / 3,
              child: Card(
                elevation: 15,
                // color: Colors.pink,
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

  gForm() {
    return Column(
      children: [
        Text('Sign up using Gmail'),
        cadetDetails(),
        gmailButtonBar(),
      ],
    );
  }

  emailForm() {
    //TODO  update this
    return Column(
      children: [
        Text('Sign up using Email/Password'),
        cadetDetails(),
        emailDetails(),
        gmailButtonBar(),
      ],
    );
  }

  cadetDetails() {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
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
                        border: OutlineInputBorder(),
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
                        label: Text('Kit No'),
                      ),
                      validator: (value) {
                        return 'Valid Kit Numberis required';
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
                      // maxLength: 2,
                      decoration: InputDecoration(
                        hintText: 'e.g. KH',
                        border: OutlineInputBorder(),
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
                        label: Text('House'),
                      ),
                      validator: (value) {
                        return 'enter house in the format KH,JH,IH,MH,RH etc';
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
            SizedBox(
              // width: constraints.maxWidth / 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: house,
                  // maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  // maxLength: 2,
                  decoration: InputDecoration(
                    hintText: 'e.g. Imtiaz Hussain Baloch',
                    border: OutlineInputBorder(),
                    hintStyle: Theme.of(context).textTheme.labelSmall?.copyWith(
                        fontStyle: FontStyle.italic, color: Colors.grey),
                    labelStyle: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold),
                    label: Text('Cadet Name'),
                  ),
                  validator: (value) {
                    return 'Name is required';
                  },
                  onFieldSubmitted: (value) {
                    //TODO implement this
                  },
                ),
              ),
            ),
            //Domicile
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: house,
                decoration: InputDecoration(
                  hintText: 'e.g. Swat',
                  border: OutlineInputBorder(),
                  hintStyle: Theme.of(context).textTheme.labelSmall?.copyWith(
                      fontStyle: FontStyle.italic, color: Colors.grey),
                  labelStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold),
                  label: Text('Domicile'),
                ),
                validator: (value) {
                  return 'Name is required';
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
                controller: house,
                decoration: InputDecoration(
                  hintText: 'e.g. 0333 5364111',
                  border: OutlineInputBorder(),
                  hintStyle: Theme.of(context).textTheme.labelSmall?.copyWith(
                      fontStyle: FontStyle.italic, color: Colors.grey),
                  labelStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold),
                  label: Text('Mobile (preferebaly WhatsApp)'),
                ),
                validator: (value) {
                  return 'Mobile  is required';
                },
                onFieldSubmitted: (value) {
                  //TODO implement this
                },
              ),
            ),
          ],
        );
      },
    );
  }

  Widget gmailButtonBar() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            onPressed: () {},
            child: Text('Signup with Google '),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text('Reset '),
          ),
        ],
      ),
    );
  }

  Widget emailDetails() {
    return Column(
      children: [
        //email FormField
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: email,
            decoration: InputDecoration(
               hintStyle: Theme.of(context)
                  .textTheme
                  .labelSmall
                  ?.copyWith(fontStyle: FontStyle.italic, color: Colors.grey),
              labelStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold),
              hintText: 'Email address',
              border: OutlineInputBorder(),
              label: Text('Email'),
            ),
          ),
        ),
        //Password Form Field
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            obscureText: true,
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
              border: OutlineInputBorder(),
              label: Text('Password'),
               suffixIcon: IconButton(
                icon: Icon(Icons.visibility),
                onPressed: () {},
              ),
            ),
          ),
        ),
        //Confirm Password Form Field 
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            obscureText: true,
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
                icon: Icon(Icons.visibility),
                onPressed: () {},
              ),
              hintText: 'confirm Password',
              border: OutlineInputBorder(),
              label: Text('Confirm Password'),
            ),
          ),
        ),
      ],
    );
  }
}
