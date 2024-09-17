part of 'posts_control_cubit.dart';

@immutable
sealed class PostsControlState {}

final class PostsControlInitial extends PostsControlState {}
final class FetchData extends PostsControlState {}