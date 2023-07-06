import 'package:demo_app_architecture/core/domain/model/cat.dart';
import 'package:demo_app_architecture/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CatListItem extends StatelessWidget {
  const CatListItem({
    Key? key,
    required this.cat,
  }) : super(key: key);

  final Cat cat;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<AppTheme>()!;
    final fonts = theme.fonts;
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cat.createdAt,
              style: fonts.h2,
            ),
            const SizedBox(height: 8),
            Text(
              cat.updatedAt.toString(),
              style: fonts.h3,
            ),
            const SizedBox(height: 8),
            Text(
              cat.id,
              style: fonts.p1,
            ),
            const SizedBox(height: 8),
            Text(
              cat.owner,
              style: fonts.p2,
            ),
            Text(
              cat.tags.toString(),
              style: fonts.p2,
            )
          ],
        ),
      ),
    );
  }
}
