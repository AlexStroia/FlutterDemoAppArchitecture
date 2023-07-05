import 'package:demo_app_architecture/core/domain/model/cat.dart';
import 'package:demo_app_architecture/features/cats_list/widgets/cat_list_item.dart';
import 'package:flutter/material.dart';

class CatsList extends StatelessWidget {
  final List<Cat> cats;

  const CatsList({Key? key, required this.cats}) : super(key: key);

  @override
  Widget build(BuildContext context) => ListView.builder(
        shrinkWrap: true,
        itemCount: cats.length,
        itemBuilder: (context, index) {
          final cat = cats[index];
          return CatListItem(cat: cat);
        },
      );
}
