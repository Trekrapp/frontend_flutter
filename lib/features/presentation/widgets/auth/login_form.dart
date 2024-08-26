part of 'widgets_imports.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _isSigningIn = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CredentialCubit, CredentialState>(
      listener: (context, credentialState) {
        if (credentialState is CredentialSuccess) {
          BlocProvider.of<AuthCubit>(context).loggedIn();
          setState(() {
            _isSigningIn = true;
          });
        } else if (credentialState is CredentialLoading) {
          setState(() {
            _isSigningIn = true;
          });
          const CircularProgressIndicator();
        } else {
          setState(() {
            _isSigningIn = false;
          });
          debugPrint('Failure');
        }
      },
      builder: (context, credentialState) {
        if (credentialState is CredentialSuccess) {
          debugPrint("this is state $credentialState");
          return BlocBuilder<AuthCubit, AuthState>(
              builder: (context, authState) {
            if (authState is Authenticated) {
              return MainScreen(
                token: authState.token,
              );
            } else {
              return LoginFormBody(
                isSignIn: _isSigningIn,
              );
            }
          });
        }
        return LoginFormBody(
          isSignIn: _isSigningIn,
        );
      },
    );
  }
}
