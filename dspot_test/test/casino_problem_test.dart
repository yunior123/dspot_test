import 'package:collection/collection.dart';
import 'package:dspot_test/casino_problem.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import 'test_data/casino_data_four_decks.dart';
import 'test_data/casino_data_only_hearts.dart';
import 'test_data/casino_data_two_decks.dart';
import 'test_data/result_list.dart';

void main() {
  test(
    "Testing casino problem",
    () {
      final dataList = [
        casinoDataOnlyHearts,
        casinoDataTwoDecks,
        casinoDataFourDecks
      ];
      var i = 0;
      for (final data in dataList) {
        final result0 = generateDeckDataCountMap(data);
        final intValues =
            result0.values.map((final e) => e.values.toList()).toList();
        final resultCount = intValues.fold<int>(
          0,
          (final previousValue, final element) {
            final suitCount = element.fold<int>(
              0,
              (final previousValue, final element) => previousValue + element,
            );
            return previousValue + suitCount;
          },
        );
        assert(
          resultCount == data.length,
          "Something wrong, some cards were not counted",
        );
        final map = resultList[i][0] as Map<String, Map<String, int>>;
        final areEqual = const DeepCollectionEquality().equals(map, result0);
        expect(areEqual, true, reason: "Error generating Deck");
        final result = processCasinoData(data);
        final deckCount = resultList[i][1] as int;
        expect(result, deckCount, reason: "Error processing data");
        i++;
      }
    },
  );
}
