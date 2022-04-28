import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class TodoSearchState extends Equatable {
  final String searchTerm;

  TodoSearchState({
    required this.searchTerm,
  });

  // 1.모든 state class를 다룰 때 일관성을 지키기 위함
  // 2. type의 충돌을 빌리기 위함
  // factory => 기존에 생성된 인스턴스가 아니라면 새롭게 생성, 기존 인스턴스가 있다면 기존 것 리턴
  factory TodoSearchState.initial() {
    return TodoSearchState(searchTerm: '');
  }

  @override
  List<Object> get props => [searchTerm];

  @override
  bool get stringify => true;

  TodoSearchState copyWith({
    String? searchTerm,
  }) {
    return TodoSearchState(searchTerm: searchTerm ?? this.searchTerm);
  }
}

class TodoSearch with ChangeNotifier {
  TodoSearchState _state = TodoSearchState.initial();
  TodoSearchState get state => _state;

  void setSearchTerm(String newSearchTerm) {
    _state = _state.copyWith(searchTerm: newSearchTerm);
    notifyListeners();
  }
}


