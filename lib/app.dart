import 'package:kohatian_foundation/pages/user_feed_page.dart';
import 'package:kohatian_foundation/services/widget_export.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loggedInUser = ref.watch(loggedInUserProvider);
    print('Material page detected $loggedInUser');
    return MaterialApp(
      title: 'Kohatian Foundation',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Stack(
              children: [
                BannerImage(),
                AppBarWidget(),
                loggedInUser != null ? const UserFeedPage() : Container(),
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
