import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/auth.dart';
import 'package:shop/views/products_overview.dart';
import 'package:shop/views/auth.dart' as authView;

class AuthOrHome extends StatelessWidget {
  const AuthOrHome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Auth auth = Provider.of(context);
    return FutureBuilder(
      future: auth.tryAutoLogin(),
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (snapshot.error != null) {
          return Center(child: Text('Error inesperado'));
        }

        return auth.isAuth ? ProductOverView() : authView.Auth();
      },
    );
  }
}
