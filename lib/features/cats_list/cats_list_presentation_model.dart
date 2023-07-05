import 'package:demo_app_architecture/core/domain/model/cat.dart';
import 'package:demo_app_architecture/features/cats_list/cats_list_initial_params.dart';

/// Model used by presenter, contains fields that are relevant to presenters and implements ViewModel to expose data to view (page)
class CatsListPresentationModel implements CatsListViewModel {
  /// Creates the initial state
  CatsListPresentationModel.initial(
    // ignore: avoid_unused_constructor_parameters
    CatsListInitialParams initialParams,
  )   : catsList = const [],
        isLoading = true;

  /// Used for the copyWith method
  CatsListPresentationModel._(
      {required this.catsList, required this.isLoading});

  CatsListPresentationModel copyWith({List<Cat>? catsList, bool? isLoading}) {
    return CatsListPresentationModel._(
        catsList: catsList ?? this.catsList,
        isLoading: isLoading ?? this.isLoading);
  }

  @override
  final List<Cat> catsList;

  @override
  final bool isLoading;
}

/// Interface to expose fields used by the view (page).
abstract class CatsListViewModel {
  List<Cat> get catsList;

  bool get isLoading;
}
