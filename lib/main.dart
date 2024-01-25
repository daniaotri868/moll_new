import 'common/models/localization_config.dart';
import 'feature/app/presentation/pages/app.dart';
import 'generated/codegen_loader.g.dart';
import 'initialization.dart';

@pragma('vm:entry-point')


Future<void> main() async {

  await initialization(
    () => const App(),
    localizationConfig: LocalizationConfig(assetLoader: const CodegenLoader()),
  );
}
