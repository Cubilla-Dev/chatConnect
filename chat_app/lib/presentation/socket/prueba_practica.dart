import 'package:socket_io_client/socket_io_client.dart' as IO;

main() {
  // Dart client
  print('Se ejecuto');
  IO.Socket socket = IO.io('ws://192.168.0.14:4000');
  socket.onConnect((_) {
    print('connect');
    socket.emit('msg', 'test');
  });
  socket.on('event', (data) => print(data));
  socket.onDisconnect((_) => print('disconnect'));
  socket.on('fromServer', (_) => print(_));
}
