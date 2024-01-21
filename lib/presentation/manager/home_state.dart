part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class GetUsersLoading extends HomeState {}
class GetUsersDone extends HomeState {}
