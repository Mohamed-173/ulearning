class HomePageEvent {
  final int index;

  HomePageEvent({this.index = 0});
  HomePageEvent copyWith({int? index}) {
    return HomePageEvent(
      index: index ?? this.index,
    );
  }
}
