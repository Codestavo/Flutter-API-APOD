import 'package:bloc/bloc.dart';
import 'package:nasa_space_view/features/space_view/presenter/cubits/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(InitialHomeState());
}
