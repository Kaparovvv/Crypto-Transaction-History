import 'package:bloc/bloc.dart';
import 'package:fox_fit_app/models/transaction_history_model.dart';
import 'package:meta/meta.dart';

part 'transaction_history_event.dart';
part 'transaction_history_state.dart';

class TransactionHistoryBloc
    extends Bloc<TransactionHistoryEvent, TransactionHistoryState> {
  TransactionHistoryBloc() : super(TransactionHistoryInitial()) {
    on<GetTransactionHistoryEvent>(
      (event, emit) {
        emit(LoadingTransactionHistoryState());
        try {
          TransactionHistoryModel historyModel = TransactionHistoryModel();
          historyModel.results = [
            Result(
              date: 'Yesterday',
              listTransaction: [
                ListTransaction(
                  isBuy: true,
                  name: 'Sell DOT',
                  date: '1/24/20220',
                  dot: '10.00',
                  usd: '189.82',
                ),
                ListTransaction(
                  isBuy: true,
                  name: 'Sell DOT',
                  date: '1/24/20220',
                  dot: '10.00',
                  usd: '189.82',
                ),
                ListTransaction(
                  name: 'Buy BTC',
                  date: '1/24/20220',
                  dot: '1.00',
                  usd: '44,978.25',
                ),
                ListTransaction(
                  isBuy: true,
                  name: 'Sell DOT',
                  date: '1/24/20220',
                  dot: '10.00',
                  usd: '189.82',
                ),
              ],
            ),
            Result(
              date: 'Monday',
              listTransaction: [
                ListTransaction(
                  isBuy: true,
                  name: 'Buy BTC',
                  date: '1/24/20220',
                  dot: '1.00',
                  usd: '44,978.25',
                ),
                ListTransaction(
                  isBuy: true,
                  name: 'Buy BTC',
                  date: '1/24/20220',
                  dot: '1.00',
                  usd: '44,978.25',
                ),
                ListTransaction(
                  isBuy: true,
                  name: 'Buy BTC',
                  date: '1/24/20220',
                  dot: '1.00',
                  usd: '44,978.25',
                ),
                ListTransaction(
                  isBuy: true,
                  name: 'Buy BTC',
                  date: '1/24/20220',
                  dot: '1.00',
                  usd: '44,978.25',
                ),
              ],
            ),
            Result(
              date: 'Wednesday',
              listTransaction: [
                ListTransaction(
                  isBuy: true,
                  name: 'Buy BTC',
                  date: '1/24/20220',
                  dot: '1.00',
                  usd: '44,978.25',
                ),
                ListTransaction(
                  isBuy: true,
                  name: 'Buy BTC',
                  date: '1/24/20220',
                  dot: '1.00',
                  usd: '44,978.25',
                ),
              ],
            ),
            Result(
              date: 'Thusday, Dec 9, 2021',
              listTransaction: [
                ListTransaction(
                  isBuy: true,
                  name: 'Buy BTC',
                  date: '1/24/20220',
                  dot: '1.00',
                  usd: '44,978.25',
                ),
                ListTransaction(
                  isBuy: true,
                  name: 'Buy BTC',
                  date: '1/24/20220',
                  dot: '1.00',
                  usd: '44,978.25',
                ),
                ListTransaction(
                  isBuy: true,
                  name: 'Buy BTC',
                  date: '1/24/20220',
                  dot: '1.00',
                  usd: '44,978.25',
                ),
              ],
            ),
            Result(
              date: 'Wednesday, Dec 8, 2021',
              listTransaction: [
                ListTransaction(
                  isBuy: true,
                  name: 'Buy BTC',
                  date: '1/24/20220',
                  dot: '1.00',
                  usd: '44,978.25',
                ),
                ListTransaction(
                  isBuy: true,
                  name: 'Buy BTC',
                  date: '1/24/20220',
                  dot: '1.00',
                  usd: '44,978.25',
                ),
                ListTransaction(
                  isBuy: true,
                  name: 'Buy BTC',
                  date: '1/24/20220',
                  dot: '1.00',
                  usd: '44,978.25',
                ),
                ListTransaction(
                  isBuy: true,
                  name: 'Buy BTC',
                  date: '1/24/20220',
                  dot: '1.00',
                  usd: '44,978.25',
                ),
              ],
            ),
          ];

          emit(LoadedTransactionHistoryState(historyModel: historyModel));
        } catch (e) {
          emit(
            ErrorTransactionHistoryState(message: e.toString()),
          );
        }
      },
    );
  }
}
