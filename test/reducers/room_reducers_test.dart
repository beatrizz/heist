import 'package:test/test.dart';
import 'package:heist/main.dart';

void main() {
  test('increment numPlayers', () {
    Room room = new Room(numPlayers: maxPlayers - 1);
    room = reduce(room, new IncrementNumPlayersAction());
    expect(room.numPlayers, maxPlayers);
    room = reduce(room, new IncrementNumPlayersAction());
    expect(room.numPlayers, maxPlayers);
  });

  test('decrement numPlayers', () {
    Room room = new Room(numPlayers: minPlayers + 1);
    room = reduce(room, new DecrementNumPlayersAction());
    expect(room.numPlayers, minPlayers);
    room = reduce(room, new DecrementNumPlayersAction());
    expect(room.numPlayers, minPlayers);
  });

  test('enter code', () {
    Room room = new Room(numPlayers: 5);
    Room updatedRoom = reduce(room, new EnterCodeAction('ABCD'));
    expect(updatedRoom.code, 'ABCD');
  });
}
