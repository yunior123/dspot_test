// In a Casino, all the decks of cards got mixed and some of the cards got lost.
//It is necessary to count how many full decks are in total.

// You are provided with a list of all the cards:

// [
//  {
//     "suit": "hearts",
//     "value": 2
//   },
// {
//     "suit": "clubs",
//     "value": 4
//   },
//  {
//     "suit": "diamonds",
//     "value": "J"
//   },
// {
//     "suit": "spades",
//     "value": 9
//   },
//  ....
// ]
// Full DataSet: https://gist.githubusercontent.com/smaugho/25712886c4a7b938fdda2c41d5b0838e/raw/79d2e4f7cfef5ba01c633400dadc81219516b95b/mixed_decks_2

// Your output should be the total amount of full decks, ie:

// 2

Map<String, Map<String, int>> generateDeckDataCountMap(
  final List<Map<String, dynamic>> casinoData,
) {
  //  {"suit": "hearts", "value": 2},
  // Store deck info
  // spades : {9:2}
  final fullDeckMap = <String, Map<String, int>>{};
  for (final suitData in casinoData) {
    final suit = suitData["suit"];
    final suitValue = suitData["value"].toString();
    // There is already one or more cards of this type
    if (fullDeckMap.containsKey(suit) &&
        fullDeckMap[suit]!.containsKey(suitValue)) {
      final currentCount = fullDeckMap[suit]![suitValue]!;
      final storedMap = fullDeckMap[suit];
      storedMap![suitValue] = currentCount + 1;
      fullDeckMap[suit] = storedMap;
    }
    // There are no cards of this type
    else if (fullDeckMap.containsKey(suit)) {
      // {"4":1,"J":2, "K":1};
      final storedMap = fullDeckMap[suit];
      storedMap![suitValue] = 1;
      fullDeckMap[suit] = storedMap;
    }
    // There are no suits of this type
    else {
      fullDeckMap[suit] = {suitValue: 1};
    }
  }
  return fullDeckMap;
}

int processCasinoData(final List<Map<String, dynamic>> casinoData) {
  final fullDeckMap = generateDeckDataCountMap(casinoData);

  if (fullDeckMap.keys.length != 4) {
    return 0;
  }
  // At this point there is at least one full deck
  var i = 0;
  while (true) {
    final fullDeckList =
        fullDeckMap.values.map((final e) => e.values.toList()).toList();
    final result = fullDeckList.fold<List<int>>(
      <int>[],
      (final previousValue, final element) => previousValue..addAll(element),
    );
    final fullDeckListCount = result.where((final e) => e > i);
    if (fullDeckListCount.length == 52) {
      i++;
    } else {
      break;
    }
  }
  return i;
}
