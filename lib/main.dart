import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phantom_demo/Bloc/Accounts/account_bloc.dart';
import 'package:flutter_phantom_demo/providers/screen_provider.dart';
import 'package:flutter_phantom_demo/providers/wallet_state_provider.dart';
import 'package:flutter_phantom_demo/repository/account_repo.dart';
import 'package:flutter_phantom_demo/views/home.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:get_storage/get_storage.dart';

final storage = GetStorage();

void main() async{
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => WalletStateProvider()),
        ChangeNotifierProvider(create: (_) => ScreenProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => AccountBloc(accountRepo: AccountIMPL()))
        ],
        child: GetMaterialApp(
          title: 'Phantom Dart Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: Colors.black,
          ),
          home: const Home(),
        ));
  }
}
