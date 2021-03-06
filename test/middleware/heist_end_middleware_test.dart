import 'package:heist/db/database_model.dart';
import 'package:heist/middleware/heist_middleware.dart';
import 'package:heist/selectors/selectors.dart';
import 'package:heist/state.dart';
import 'package:redux/redux.dart';
import 'package:test/test.dart';

import '../test_utils.dart';

void main() {
  test('test complete heist', () async {
    Store<GameModel> store = await initGame();

    expect(getHeists(store.state).length, 1);
    await handle(store, new CompleteHeistAction());
    expect(getHeists(store.state).length, 2);
    expect(getRounds(store.state).values.length, 2);

    Heist previousHeist = getHeists(store.state).singleWhere((h) => h.order == 1);
    expect(previousHeist.completedAt, isNotNull);
  });
}
