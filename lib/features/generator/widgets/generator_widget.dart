import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get_it/get_it.dart';
import '../controllers/generator_controller.dart';

final getIt = GetIt.instance;

class GeneratorWidget extends StatelessWidget {
  const GeneratorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => getIt<GeneratorController>(),
      child: Consumer<GeneratorController>(
        builder: (context, controller, child) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Генератор ГЕТ',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      const Text('Частота ГЕТ:'),
                      const SizedBox(width: 8),
                      Expanded(
                        child: TextField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            suffixText: 'МГц',
                          ),
                          keyboardType: TextInputType.number,
                          controller: TextEditingController(
                            text: controller.frequency.toStringAsFixed(4),
                          ),
                          onChanged: (value) {
                            final freq = double.tryParse(value);
                            if (freq != null) {
                              controller.setFrequency(freq);
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}