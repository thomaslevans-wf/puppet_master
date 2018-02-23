
import 'package:test/test.dart';
import 'package:puppet_master/src/multi_map.dart';

void main() {
  group('MultiMap', () {
    
    test('instantiates via constructor', () {
      var multiMap = new MultiMap();
      expect(multiMap, isNotNull);
    });

    test('get returns an empty Set when key/value DNE', () {
      var multiMap = new MultiMap();
      var aSet = multiMap.get('key');

      expect(aSet, new isInstanceOf<Set>());
      expect(aSet, isEmpty);
    });

    test('can set a value', () {      
      var multiMap = new MultiMap();
      var key = 'key';
      var value = 'value';
      var expected = new Set.from([value]);

      multiMap.set(key, value);

      expect(multiMap.get(key), equals(expected));
    });

    test('has returns false when key is absent', () {
      var multiMap = new MultiMap();
      var key = 'key';

      expect(multiMap.has(key), isFalse);
    });

    test('has returns true when key is present', () {
      var multiMap = new MultiMap();
      var key = 'key';
      var value = 'value';

      multiMap.set(key, value);

      expect(multiMap.has(key), isTrue);
    });

    test('hasValue returns false when key is not present', () {
      var multiMap = new MultiMap();
      var key = 'key';
      var value = 'value';

      expect(multiMap.hasValue(key, value), isFalse);
    });

    test('hasValue returns false when key is present but value is not', () {
      var multiMap = new MultiMap();
      var key = 'key';
      var value = 'value';

      multiMap.set(key, 1);

      expect(multiMap.hasValue(key, value), isFalse);
    });

    test('hasValue returns true when key and value are present', () {
      var multiMap = new MultiMap();
      var key = 'key';
      var value = 'value';

      multiMap.set(key, value);

      expect(multiMap.hasValue(key, value), isTrue);
    });

    test('size returns the num of key/val pairs in map', () {
      var multiMap = new MultiMap();
      var key = 'key';
      var value = 'value';

      multiMap.set(key, value);

      expect(multiMap.size(), equals(1));
    });

    test('delete removes the value', () {
      var multiMap = new MultiMap();
      var key = 'key';
      var value = 'value';

      multiMap.set(key, value);
      expect(multiMap.size(), equals(1));
      
      multiMap.delete(key, value);
      expect(multiMap.size(), equals(0));
    });

    test('delete removes the value (only) if set not empty after delete', () {
      var multiMap = new MultiMap();
      var key = 'key';
      var valueOne = 'value1';
      var valueTwo = 'value2';

      multiMap.set(key, valueOne);
      multiMap.set(key, valueTwo);
      expect(multiMap.size(), equals(1));

      multiMap.delete(key, valueOne);
      expect(multiMap.size(), equals(1));
    });

    test('deleteAll values for the given key', () {
      var multiMap = new MultiMap();
      var keyOne = 'key1';
      var keyTwo = 'key2';
      var value = 'value';

      multiMap.set(keyOne, value);
      multiMap.set(keyTwo, value);
      expect(multiMap.size(), equals(2));

      multiMap.deleteAll(keyOne);
      expect(multiMap.size(), equals(1));
    });

    test('firstValue returns the first value in the set for the given key', () {
      var multiMap = new MultiMap();
      var key = 'key';
      var valueOne = 'value1';
      var valueTwo = 'value2';

      multiMap.set(key, valueOne);
      multiMap.set(key, valueTwo);
      expect(multiMap.size(), equals(1));
      expect(multiMap.firstValue(key), equals(valueOne));
    });

    test('firstKey returns the first key in the map', () {
      var multiMap = new MultiMap();
      var keyOne = 'key1';
      var keyTwo = 'key2';
      var value = 'value';

      multiMap.set(keyOne, value);
      multiMap.set(keyTwo, value);
      expect(multiMap.size(), equals(2));
      expect(multiMap.firstKey(), equals(keyOne));
    });

    test('valuesArray returns an array of values for all keys', () {
      var multiMap = new MultiMap();
      var keyOne = 'key1';
      var keyTwo = 'key2';
      var valueOne = 'valueOne';
      var valueTwo = 'valueTwo';
      var valueThree = 'valueThree';

      multiMap.set(keyOne, valueOne);
      multiMap.set(keyOne, valueTwo);
      multiMap.set(keyTwo, valueOne);
      multiMap.set(keyTwo, valueTwo);
      multiMap.set(keyTwo, valueThree);
      expect(multiMap.size(), equals(2));
      
      var array = multiMap.valuesArray();
      expect(array, hasLength(5));
    });

    test('keysArray returns an array of all keys', () {
      var multiMap = new MultiMap();
      var keyOne = 'key1';
      var keyTwo = 'key2';
      var value = 'value';

      multiMap.set(keyOne, value);
      multiMap.set(keyTwo, value);
      expect(multiMap.size(), equals(2));
      expect(multiMap.keysArray(), equals([keyOne, keyTwo]));
    });

    test('clear deletes all keys and values', () {
      var multiMap = new MultiMap();
      var keyOne = 'key1';
      var keyTwo = 'key2';
      var value = 'value';

      multiMap.set(keyOne, value);
      multiMap.set(keyTwo, value);
      expect(multiMap.size(), equals(2));

      multiMap.clear();
      expect(multiMap.size(), equals(0));
    });

  });
}