part of 'getcompanies_cubit.dart';

@immutable
abstract class GetcompaniesState {}

class GetcompaniesInitial extends GetcompaniesState {}

class GetcompaniesLoadingState extends GetcompaniesState {}

class GetcompaniesSuccessState extends GetcompaniesState {}

class GetcompaniesErrorState extends GetcompaniesState {
  final String? message;

  GetcompaniesErrorState({this.message});
}
