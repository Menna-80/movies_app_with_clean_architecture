part of 'search_bloc.dart';
abstract class SearchEvent extends Equatable {
  const SearchEvent();

}
class GetSearchEvent extends SearchEvent{
  final String name;

  const GetSearchEvent(this.name);
  @override
  List<Object> get props => [name];
}