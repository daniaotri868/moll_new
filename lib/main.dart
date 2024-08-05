import 'package:firebase_core/firebase_core.dart';
import 'package:remy/services/notification_service/push_notification_handler.dart';

import 'common/models/localization_config.dart';
import 'feature/app/presentation/pages/app.dart';
import 'firebase_options.dart';
import 'generated/codegen_loader.g.dart';
import 'initialization.dart';

@pragma('vm:entry-point')


Future<void> main() async {

  
  await initialization(
    () => const App(),
    localizationConfig: LocalizationConfig(assetLoader: const CodegenLoader()),
  );
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await PushNotificationsHandler().init();
}
