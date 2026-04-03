import 'package:get_it/get_it.dart';
import 'event_bus.dart';
import 'command_executor.dart';
import '../core/interfaces.dart';
import '../core/connection.dart';
import '../features/generator/generator.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  getIt.registerLazySingleton<IEventBus>(() => AppEventBus());
  getIt.registerLazySingleton<IConnection>(() => MockConnection());
  getIt.registerFactory<CommandExecutor>(
  () => CommandExecutor(
    getIt<IConnection>(),
    getIt<IEventBus>(),
  ),
);
  getIt.registerFactory<GeneratorService>(
    () => GeneratorService(getIt<CommandExecutor>()),
  );
  getIt.registerFactory<GeneratorController>(
    () => GeneratorController(
      eventBus: getIt<IEventBus>(),
      service: getIt<GeneratorService>(),
    ),
  );
}