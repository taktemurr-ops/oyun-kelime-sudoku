import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_kelime_sudoku/oyun_kelime_sudoku.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(kelimeSudokuConfig.title.length, 33);
    expect(kelimeSudokuConfig.tagline.length, 33);
    for (final s in kelimeSudokuConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(kelimeSudokuConfig.gameId, kelimeSudokuId);
    expect(kelimeSudokuRules.gameId, kelimeSudokuId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(kelimeSudokuRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: kelimeSudokuId, optionalMechanics: kelimeSudokuRules.optionalMechanics);
    for (final l in ['tr', 'en']) {
      kelimeSudokuRules.lang = l;
      for (final lv in [1, 77, 1500, 33333, 99999]) {
        expect(kelimeSudokuRules.build(planner.spec(lv)).validation.ok, isTrue, reason: '$l bölüm $lv');
      }
    }
  });
}
