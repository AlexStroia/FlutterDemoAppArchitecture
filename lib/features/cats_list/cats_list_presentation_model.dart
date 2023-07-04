import 'package:demo_app_architecture/features/cats_list/cats_list_initial_params.dart';



/// Model used by presenter, contains fields that are relevant to presenters and implements ViewModel to expose data to view (page)
class CatsListPresentationModel implements CatsListViewModel {
  /// Creates the initial state
  CatsListPresentationModel.initial(
    // ignore: avoid_unused_constructor_parameters
    CatsListInitialParams initialParams,
  );

  /// Used for the copyWith method
  CatsListPresentationModel._();

  CatsListPresentationModel copyWith() {
    return CatsListPresentationModel._();
  }
}

/// Interface to expose fields used by the view (page).
abstract class CatsListViewModel {}
