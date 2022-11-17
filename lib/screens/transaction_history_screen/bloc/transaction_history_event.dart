part of 'transaction_history_bloc.dart';

@immutable
abstract class TransactionHistoryEvent {}

class GetTransactionHistoryEvent extends TransactionHistoryEvent {}
