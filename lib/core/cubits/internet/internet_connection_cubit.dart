import 'dart:async';
import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

part 'internet_connection_state.dart';

class InternetConnectionCubit extends Cubit<InternetConnectionState> {
  final Connectivity connectivity;
  late final StreamSubscription<List<ConnectivityResult>> _subscription;

  InternetConnectionCubit({
    required this.connectivity,
  }) : super(InternetConnectionInitial()) {
    _subscription =
        connectivity.onConnectivityChanged.listen(_onConnectivityChanged);
    _checkInitialConnection();
  }

  Future<void> _checkInitialConnection() async {
    final result = await connectivity.checkConnectivity();
    _onConnectivityChanged(result);
  }

  void _onConnectivityChanged(List<ConnectivityResult> results) {
    final hasConnection = !results.contains(ConnectivityResult.none);
    log("listen on internet");
    if (hasConnection) {
      emit(InternetConnectionConnected());
    } else {
      emit(InternetConnectionDisconnected());
    }
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}
