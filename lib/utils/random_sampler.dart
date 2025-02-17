import 'dart:math';

class RandomSampler {
  static T sampleOne<T>(List<T> samples, {Map<T, int>? weights}) {
    final random = Random();

    if (weights == null) {
      return samples[random.nextInt(samples.length)];
    }

    int totalWeight = samples.fold(0, (sum, e) => sum + (weights[e] ?? 1));
    int rand = random.nextInt(totalWeight);
    int sum = 0;

    for (T e in samples) {
      sum += weights[e] ?? 1;
      if (rand < sum) {
        return e;
      }
    }
    throw StateError('Unexpected error occurred while sampling one with weights');
  }

  static List<T> sampleMultiple<T>(List<T> samples, int number, {Map<T, int>? weights}) {
    final random = Random();

    if (weights == null) {
      List<T> shuffled = List.of(samples)..shuffle(random);
      return shuffled.take(number).toList();
    }

    final List<T> results = [];
    final List<T> available = [...samples];

    for (int i = 0; i < number; i++) {
      int totalWeight = available.fold(0, (sum, e) => sum + (weights[e] ?? 1));
      int rand = random.nextInt(totalWeight);
      int sum = 0;

      for (int j = 0; j < available.length; j++) {
        sum += weights[available[j]] ?? 1;
        if (rand < sum) {
          results.add(available[j]);
          available.removeAt(j);
          break;
        }
      }
    }
    return results;
  }
}