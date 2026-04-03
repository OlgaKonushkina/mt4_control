import '../shared/event_bus.dart';
import '../shared/app_events.dart';

abstract class IConnection {
  bool connect();
  void disconnect();
  void sendCommand(String command, dynamic value);
  bool get isConnected;
}

class MockConnection implements IConnection {
  @override
  bool connect() {
    print('MockConnection: connect');
    return true;
  }

  @override
  void disconnect() {
    print('MockConnection: disconnect');
  }

  @override
  void sendCommand(String command, dynamic value) {
    print('MockConnection: sendCommand $command = $value');
    // Имитируем получение подтверждения от устройства
    Future.delayed(const Duration(milliseconds: 100), () {
      eventBus.fire(CommandAcknowledgedEvent('OK $command $value'));
    });
  }

  @override
  bool get isConnected => true;
}