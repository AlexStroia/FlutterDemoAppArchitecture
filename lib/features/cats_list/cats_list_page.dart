import 'package:demo_app_architecture/features/cats_list/widgets/cats_list.dart';
import 'package:flutter/material.dart';
import 'package:demo_app_architecture/core/utils/mvp_extensions.dart';
import 'package:demo_app_architecture/features/cats_list/cats_list_presentation_model.dart';
import 'package:demo_app_architecture/features/cats_list/cats_list_presenter.dart';

class CatsListPage extends StatefulWidget with HasPresenter<CatsListPresenter> {
  const CatsListPage({
    super.key,
    required this.presenter,
  });

  @override
  final CatsListPresenter presenter;

  @override
  State<CatsListPage> createState() => _CatsListPageState();
}

class _CatsListPageState extends State<CatsListPage>
    with
        PresenterStateMixin<CatsListViewModel, CatsListPresenter,
            CatsListPage> {
  @override
  void initState() {
    super.initState();
    presenter.getCatsList();
  }

  @override
  Widget build(BuildContext context) => stateObserver(
      builder: (context, state) => Scaffold(
          body: state.isLoading
              ? const Center(child: CircularProgressIndicator())
              : CatsList(cats: state.catsList)));
}
