import 'package:flutter/foundation.dart';
import 'package:idnet/view_models/helpers.dart';

class AppViewModel extends ChangeNotifier {
  ViewState _viewState = ViewState.idle;
  bool _disposed = false;
  //

  ViewState get viewState => _viewState;
  bool get hasEncounteredError =>
      _viewState == ViewState.error || _viewState == ViewState.noConnection;
  bool get isBusy => _viewState == ViewState.busy;

  @override
  void dispose() {
    super.dispose();
    _disposed = true;
  }

  void setState([ViewState? viewState]) {
    if (viewState != null) _viewState = viewState;
    if (!_disposed && hasListeners) notifyListeners();
  }

  @protected
  void handleErrorAndSetVmState([String? error]) {
    if (hasListeners) {}
    setState(ViewState.error);
  }
}
