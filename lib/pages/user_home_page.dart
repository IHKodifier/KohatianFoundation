import 'package:kohatian_foundation/pages/sign-in_page.dart';
import 'package:kohatian_foundation/widget_export.dart';

class UserHomePage extends ConsumerWidget {
  UserHomePage({super.key});
  var _ref;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hasUser = ref.watch(authStateChangesProvider);
    _ref = ref;
    return hasUser.when(
      data: onData,
      error: onError,
      loading: () => Center(child: CircularProgressIndicator()),
    );

    //  Scaffold(
    // body: CustomScrollView(
    //   slivers: [
    //      const AppBarWidget(),
    //     SliverFillRemaining(

    //       child: Column(
    //         children: [
    //           // Add your content here

    //           Expanded(
    //             child: Container(
    //               color: Colors.yellow,
    //               child: const Center(
    //                 child: Text('User Home Content goes here'),
    //               ),
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //     const SliverToBoxAdapter(
    //       child: SiteFooter(),
    //     )
    //   ],
    // ),
    // ):SignInPage();
  }

  Widget onData(User? data) {
    final userProfileAsync = _ref.watch(userProfileProvider);
    return userProfileAsync.when(
      data: (data){
        return UserFeedWidget();
      },
      error: (error, stackTrace) => Text('Error: $error'),
      loading: () => CircularProgressIndicator(),
    );
  
   
  }

 
  Widget onError(Object error, StackTrace stackTrace) {
    return Column(
      children: [
        Text(error.toString()),
        Text(stackTrace.toString()),
      ],
    );
  }
}
