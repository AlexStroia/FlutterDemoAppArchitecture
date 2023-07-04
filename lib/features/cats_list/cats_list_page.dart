import 'package:bloc/bloc.dart';
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

class _CatsListPageState extends State<CatsListPage> with PresenterStateMixin<CatsListViewModel, CatsListPresenter, CatsListPage> {

  @override
  Widget build(BuildContext context) => const Scaffold(
      body: Center(
        child: Text("CatsListPage\n(NOT IMPLEMENTED YET)"),
      ),
    );

}
