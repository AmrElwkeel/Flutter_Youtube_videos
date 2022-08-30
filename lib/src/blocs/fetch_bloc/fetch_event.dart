part of 'fetch_bloc.dart';

abstract class FetchEvent extends Equatable {}

class GetData extends FetchEvent{
  @override
  List<Object?> get props =>[];

}

