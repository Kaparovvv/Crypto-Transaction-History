part of 'transaction_history_bloc.dart';

@immutable
abstract class TransactionHistoryState {}

class TransactionHistoryInitial extends TransactionHistoryState {}

class LoadingTransactionHistoryState extends TransactionHistoryState {}

class LoadedTransactionHistoryState extends TransactionHistoryState {
  final TransactionHistoryModel historyModel;

  LoadedTransactionHistoryState({required this.historyModel});
}

class ErrorTransactionHistoryState extends TransactionHistoryState {
  final String? message;

  ErrorTransactionHistoryState({required this.message});
}
