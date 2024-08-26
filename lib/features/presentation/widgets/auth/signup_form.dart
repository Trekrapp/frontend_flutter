part of 'widgets_imports.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  late bool isShow = false;
  bool _isCheckboxChecked = false;
  bool _showCheckboxError = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Nom d'utilisateur",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(
              height: 12.h,
            ),
            TextFormField(
              controller: usernameController,
              validator: Validators.usernameValidator,
              decoration: const InputDecoration(
                hintText: 'Entrer votre Nom',
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            Text(
              "Email",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(
              height: 12.h,
            ),
            TextFormField(
              controller: emailController,
              validator: Validators.emailValidator,
              decoration: const InputDecoration(
                hintText: 'Entrer votre Email',
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            Text(
              "Numéro de téléphone",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(
              height: 12.h,
            ),
            TextFormField(
              controller: phoneController,
              validator: Validators.phoneValidator,
              decoration: const InputDecoration(
                hintText: 'Entrer votre Numéro de téléphone',
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            Text(
              "Mot de passe",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(
              height: 12.h,
            ),
            TextFormField(
              controller: passwordController,
              validator: Validators.passwordValidator,
              obscureText: !isShow,
              decoration: InputDecoration(
                  hintText: 'Entrer votre Mot de passe',
                  suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          isShow = !isShow;
                        });
                      },
                      child: Icon(
                        isShow ? Icons.visibility_off : Icons.visibility,
                        color: AppColors.primaryColor,
                      ))),
            ),
            SizedBox(
              height: 30.h,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20.h,
                  width: 20.w,
                  child: Checkbox(
                    side: BorderSide(
                      color: _showCheckboxError
                          ? Colors.red
                          : AppColors.secondaryColor,
                    ),
                    value: _isCheckboxChecked,
                    checkColor: AppColors.primaryColor,
                    activeColor: AppColors.secondaryColor,
                    onChanged: (value) {
                      setState(() {
                        _isCheckboxChecked = value ?? false;
                        _showCheckboxError = false;
                      });
                    },
                  ),
                ),
                SizedBox(
                  width: 5.w,
                ),
                SizedBox(
                  width: HelperFunctions.screenWidth(context) * .68,
                  child: Text(
                    'I agree with the Terms of Service and Privacy policy',
                    style: GoogleFonts.inter(
                        color: AppColors.primaryColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            if (_showCheckboxError)
              const Padding(
                padding: EdgeInsets.only(left: 5, top: 5),
                child: Text(
                  'Vous devez accepter les termes et conditions.',
                  style: TextStyle(color: Colors.red, fontSize: 12),
                ),
              ),
            SizedBox(
              height: 40.h,
            ),
            PrimaryButton(
                text: "S'inscrire",
                onPressed: () {
                  final requests = RequestBodyRegisterModel(
                      username: usernameController.text,
                      email: emailController.text,
                      password: passwordController.text,
                      phone: phoneController.text);
                  if (_formKey.currentState!.validate() && _isCheckboxChecked) {
                    BlocProvider.of<CredentialCubit>(context)
                        .signUpUser(requests: requests)
                        .whenComplete(() {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text(
                              "Utilisateur enregistré avec succès, vérifiez votre e-mail pour vérification.!")));
                    }).whenComplete(() {
                      Navigator.pushNamed(context, NavigationStrings.location);
                    });
                  } else {
                    setState(() {
                      if (!_isCheckboxChecked) {
                        _showCheckboxError = true;
                      }
                    });
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text(
                        "Veuillez remplir tous les champs et accepter les conditions.",
                      ),
                    ));
                  }
                })
          ],
        ),
      ),
    );
  }
}
