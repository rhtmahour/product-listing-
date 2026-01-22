import 'package:flutter/material.dart';
import 'package:flutter_clean_mvvm/presentation/views/product_list_page.dart';
import 'di/injection.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Clean MVVM Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ProductListPage(),
    );
  }
}
