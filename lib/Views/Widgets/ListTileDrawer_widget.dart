import 'package:flutter/material.dart';

import 'package:gestionresidencial/localstore/sharepreference.dart';

class ListTileDrawer extends StatelessWidget {
  final String title;
  final IconData icon;
  final GestureTapCallback? onTap;
  
    
  const ListTileDrawer({
    super.key,
    required this.prefs,
    required this.title, 
    this.onTap,
    required this.icon
  });

  final PrefernciaUsuario prefs;

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return ListTile(
      leading: Icon(icon, color: colors.primary,), 
      title: Text(title),
      onTap: onTap
    );
  }
}