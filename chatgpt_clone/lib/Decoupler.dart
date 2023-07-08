import 'package:rxdart/rxdart.dart';

typedef Update<PState, PAction, PControlId, PPayload> = PState Function(
  PState state,
  CAction<PAction, PControlId, PPayload> action,
);

class TId {
  final String? id;
  final String? uuid;

  TId({this.id, this.uuid});
}

class CAction<PAction, PControlId, PPayload> {
  final PAction type;
  final TId id;
  final PPayload? payload;

  CAction({
    required this.type,
    required this.id,
    this.payload,
  });
}

class Decoupler<PState, PAction, PControlId, PPayload> {
  final BehaviorSubject<PState> _stateSubject;
  final BehaviorSubject<List<CAction<PAction, PControlId, PPayload>>>
      _ioQueueSubject = BehaviorSubject.seeded([]);
  final PublishSubject<CAction<PAction, PControlId, PPayload>> _actionSubject =
      PublishSubject();

  List<void Function(PState)> _ioHandlers = [];
  Update<PState, PAction, PControlId, PPayload> _update;

  Decoupler({
    required PState initialState,
    required Update<PState, PAction, PControlId, PPayload> update,
  })  : _update = update,
        _stateSubject = BehaviorSubject.seeded(initialState) {
    _actionSubject.listen((action) {
      _ioQueueSubject.add([..._ioQueueSubject.value, action]);
    });
  }

  void registerIOHandler(void Function(PState) handler) {
    _ioHandlers.add(handler);
  }

  Future<CAction<PAction, PControlId, PPayload>> io(PState state) async {
    _ioHandlers.forEach((handler) => handler(state));
    final queue =
        await _ioQueueSubject.stream.firstWhere((queue) => queue.isNotEmpty);
    final nextQueue = queue.sublist(1);
    _ioQueueSubject.add(nextQueue);
    return queue[queue.length - 1];
  }

  void sendAction(CAction<PAction, PControlId, PPayload> action) {
    _actionSubject.add(action);
  }

  void init() async {
    var state = _stateSubject.value;
    while (true) {
      try {
        final action = await io(state);
        state = _update(state, action);
      } catch (e) {
        print(e);
        continue;
      }
    }
  }
}
