import 'package:socket_io_client/socket_io_client.dart' as IO;

class Conexion {
  Conexion() {
    final client = IO.io(
      'ws://127.0.0.1:4000', // Reemplaza con la URL de tu servidor WebSocket
      <String, dynamic>{
        'transports': ['websocket'],
      },
    );

    client.on('connect', (_) {
      print('Conexión exitosa');
    });

    client.on('msg', (data) {
      print('Mensaje llegado de servidor: $data');
    });

    // Conectar al servidor
    client.connect();
  }
}

void main() {
  Conexion();
}
