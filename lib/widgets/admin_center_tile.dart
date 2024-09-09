import 'package:flutter/material.dart';
import 'package:kohatian_foundation/pages/create_entry_page.dart';
import 'package:kohatian_foundation/widget_export.dart';

class AdminCenterTile extends ConsumerWidget {
  final double maxWidth;
  final Widget routeTarget;
  final String title;
  final String subtitle;
  final Icon icon;

  const AdminCenterTile(
      {required this.maxWidth,
      required this.routeTarget,
      required this.title,
      required this.subtitle,
      required this.icon,
      super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: maxWidth * 0.3,
      height: 180,
      child: InkWell(
        hoverColor: Theme.of(context).colorScheme.secondaryContainer,
        onTap: () {
          //TODO
        },
        child: Card(
          elevation: 5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child:
                    //  Text('Create Entry '),
                    adminCenterTileContent(context),
              ),
            ],
          ),
          //TODO  Entry creation content
        ),
      ),
    );
  }

  adminCenterTileContent(BuildContext context) {
    return InkWell(
      hoverColor: Theme.of(context).colorScheme.secondaryContainer,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => routeTarget, // New screen for Entry creation
          ),
        );
      },
      child:     
         
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                 icon,  
              FittedBox(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(),
                ),
              ),
              FittedBox(
                child: Text(
                  subtitle,
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        fontStyle: FontStyle.italic,
                      ),
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
       
       
    );
  }
}
