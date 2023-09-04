import 'package:get/get.dart';
import 'package:test2/chip/chip_model.dart';

class ChipController extends GetxController {
  RxList<ChipModel> initialChips = <ChipModel>[
    ChipModel('Chip 1', false),
    ChipModel('Chip 2', false),
    ChipModel('Chip 3Chip 3Chip 3Chip 3Chip 3Chip 3Chip 3Chip 3Chip 3Chip 3', false),
  ].obs;

  RxList<ChipModel> selectedChips = <ChipModel>[].obs;

  void moveChip(ChipModel chip) {
    if (chip.isSelected) {
      initialChips.add(chip);
      selectedChips.remove(chip);
    } else {
      selectedChips.add(chip);
      initialChips.remove(chip);
    }
    chip.isSelected = !chip.isSelected;
  }
}
