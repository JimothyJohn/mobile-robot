import 'dart:io';
import 'dart:convert';
import 'dart:async'; // Add this line
import 'package:logging/logging.dart';

final Logger _logger = Logger('MyLogger');

void main() async {
  Logger.root.level = Level.ALL; // Log all events
  Logger.root.onRecord.listen((record) {
    print('${record.level.name}: ${record.time}: ${record.message}');
  });

  // Create a socket connection.
  final socket = await Socket.connect('dev.aws', 29999);

  // Send data
  // socket.write('running');
  socket.write('popup Hello world');
  await socket.flush();
  socket.destroy();

  /*
  // Listen for responses from the server
  var controller = StreamController<List<int>>();
  StreamSubscription<List<int>> subscription = controller.stream.listen(null);

  subscription = socket.listen(
    (List<int> event) async {
      _logger.info(utf8.decode(event));
      socket.write('popup Dart says hello');
      await socket.flush();
      socket.destroy();
    },
    onError: (error) {
      _logger.severe(error);
    },
    onDone: () {
      _logger.info('Connection closed by server');
      subscription.cancel();
      socket.destroy();
    },
  );
  */
}
