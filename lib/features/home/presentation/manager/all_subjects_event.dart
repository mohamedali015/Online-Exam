sealed class AllSubjectsEvent {}

class GetAllSubjectsEvent extends AllSubjectsEvent{}
class GetSearchSubjectsEvent extends AllSubjectsEvent{
  final String query;
  GetSearchSubjectsEvent({required this.query});
}