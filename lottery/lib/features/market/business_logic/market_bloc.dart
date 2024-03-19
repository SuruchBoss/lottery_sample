import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lottery/features/market/model/lottery_model.dart';

part 'market_bloc.freezed.dart';

part 'market_event.dart';

part 'market_state.dart';

class MarketBloc extends Bloc<MarketEvent, MarketState> {
  MarketBloc() : super(const MarketState.success()) {
    on<_Clear>(_onCleared);
    on<_AddNewLottery>(_onAddNewLottery);
  }

  Future<void> _onCleared(
    _Clear event,
    Emitter<MarketState> emit,
  ) async {
    emit(
      const MarketState.success(
        marketLotteries: [],
        myLotteries: [],
      ),
    );
  }

  Future<void> _onAddNewLottery(
    _AddNewLottery event,
    Emitter<MarketState> emit,
  ) async {
    emit(
      const MarketState.success(
        marketLotteries: [],
        myLotteries: [],
      ),
    );
  }
}
