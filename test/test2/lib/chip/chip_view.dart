import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test2/chip/chip_controller.dart';

class ChipView extends GetView<ChipController> {
  const ChipView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chip Animation Example')),
      body: Column(
        children: [
          Center(
            child: Container(
              width: 300,
              height: 500,
              padding: const EdgeInsets.all(10),
              color: const Color.fromARGB(255, 231, 102, 102),
              child: Obx(() => Column(
                    children: [
                      for (int i = 0; i < controller.selectedChips.length; i++)
                        Column(
                          children: [
                            ElevatedButton(
                              onPressed: () => controller
                                  .moveChip(controller.selectedChips[i]),
                              child: Chip(
                                  label:
                                      Text(controller.selectedChips[i].label)),
                            ),
                            if (i < controller.selectedChips.length - 1)
                              const Divider(
                                thickness: 1, // Độ dày của Divider
                                color: Colors.black, // Màu của Divider
                              ),
                          ],
                        ),
                    ],
                  )),
            ),
          ),
          const SizedBox(height: 20),
          Obx(() => Wrap(
                children: controller.initialChips
                    .map(
                      (chip) => ElevatedButton(
                        onPressed: () => controller.moveChip(chip),
                        child: Chip(label: Text(chip.label)),
                      ),
                    )
                    .toList(),
              )),
        ],
      ),
    );
  }
}
