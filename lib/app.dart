import 'package:kohatian_foundation/widget-export.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kohatian Foundation',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Stack(
              children: [
                MyHomePage(title: 'Home | Kohatian Foundation '),
                AppBarWidget(),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: SiteFooter(),
          ),
        ],
      ),
    );
  }
}
