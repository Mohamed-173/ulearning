// ignore_for_file: public_member_api_docs, sort_constructors_first
class HomePageState {
  HomePageState({this.index = 0});
  final int index;

  HomePageState copyWith({int? index}) {
    return HomePageState(
      index: index ?? this.index,
    );
  }
}
