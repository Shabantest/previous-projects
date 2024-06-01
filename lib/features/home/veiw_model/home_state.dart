part of 'home_cubit.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}
final class SearchAttractionsLoadingState extends HomeState {}
final class SearchAttractionsSuccessState extends HomeState {}
final class SearchAttractionsErorrState extends HomeState {}
final class SearchCategoriesLoadingState extends HomeState {}
final class SearchCategoriesSuccessState extends HomeState {}
final class SearchCategoriesErorrState extends HomeState {}
final class SearchSingleCategoriesLoadingState extends HomeState {}
final class SearchSingleCategoriesSuccessState extends HomeState {}
final class SearchSingleCategoriesErorrState extends HomeState {}
