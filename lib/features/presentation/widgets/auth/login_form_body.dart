part of 'widgets_imports.dart';

class LoginFormBody extends StatefulWidget {
  bool isSignIn;
  LoginFormBody({super.key, this.isSignIn = false});

  @override
  State<LoginFormBody> createState() => _LoginFormBodyState();
}

class _LoginFormBodyState extends State<LoginFormBody> {
  TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  String _email = '';
  String _password = '';
  bool _rememberMe = false;
  bool isShow = false;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Nom d'utilisateur ou email",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          SizedBox(
            height: 12.h,
          ),
          TextFormField(
            controller: emailController,
            validator: Validators.emailValidator,
            onSaved: (value) => _email = value!,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              hintText: 'Entrer votre Email',
            ),
          ),
          SizedBox(height: 20.h),
          Text(
            "Mot de passe",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          SizedBox(
            height: 12.h,
          ),
          TextFormField(
            controller: passwordController,
            onSaved: (value) => _password = value!,
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
                  child: Icon(isShow == false
                      ? Icons.visibility
                      : Icons.visibility_off),
                )),
          ),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
                    value: _rememberMe,
                    activeColor: AppColors.primaryColor,
                    checkColor: Colors.white,
                    onChanged: (value) {
                      setState(() {
                        _rememberMe = value!;
                      });
                    },
                  ),
                  Text(
                    'Souviens-toi',
                    style: GoogleFonts.manrope(
                        color: AppColors.primaryColor,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              TextButton(
                onPressed: () => Navigator.pushNamed(
                    context, NavigationStrings.forgetPassword),
                child: Text('Mot de passe oublié',
                    style: GoogleFonts.manrope(
                        color: AppColors.secondaryColor,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w700)),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          PrimaryButton(
              text: 'Se connecter',
              onPressed: () {
                if (_formKey.currentState?.validate() ?? false) {
                  _formKey.currentState?.save();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                  _signInUser();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Invalid input')),
                  );
                }
              }),
          SizedBox(height: 20.h),
          Row(
            children: [
              const Expanded(
                child: Divider(
                  thickness: 1,
                  color: AppColors.starDust,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Text(
                  'Ou avec',
                  style: TextStyle(
                      color: AppColors.starDust,
                      fontWeight: FontWeight.w700,
                      fontSize: 14.sp),
                ),
              ),
              const Expanded(
                child: Divider(
                  thickness: 1,
                  color: AppColors.starDust,
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          const SecondaryButton(),
        ],
      ),
    );
  }

  void _signInUser() {
    setState(() {
      widget.isSignIn = true;
    });
    BlocProvider.of<CredentialCubit>(context)
        .signInUser(
          email: emailController.text,
          password: passwordController.text,
        )
        .then((value) => _clear());
    print("this is email ${emailController.text}");
    print("this is password ${passwordController.text}");
    print("isSignIn : ${widget.isSignIn}");
  }

  _clear() {
    setState(() {
      widget.isSignIn = false;
    });
  }
}
