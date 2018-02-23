import 'dart:collection';

class MultiMap {
  LinkedHashMap _map;

  MultiMap() {
    this._map = new LinkedHashMap();
  }

  Set get(String key) {
    var result = this._map[key];
    if(result == null) {
      return new Set();
    } else {
      return result;
    }
  }

  set(String key, Object value) {
    var result = this._map[key];
    if (result == null) {
      result = new Set();
      this._map[key] = result;
    }
    result.add(value);
  }

  bool has(String key) => this._map.containsKey(key);

  bool hasValue(String key, Object value) {
    var result = this._map[key];
    if (result == null) {
      return false;
    } else {
      return result.contains(value);
    }
  }

  int size() => this._map.length;

  delete(String key, Object value) {
    Set valueAsSet = new Set.from([value]);
    var result = this.get(key).difference(valueAsSet);
    if (result.isEmpty) {
      this._map.remove(key);
    } else {
      this.get(key).remove(value);
    }
  }

  deleteAll(String key) => this._map.remove(key);

  Object firstValue(String key) {
    var result = this._map[key];
    if (result == null) {
      return null;
    } else {
      return result.first;
    }
  }

  String firstKey() {
    return this._map.keys.first;
  }

  List valuesArray() {
    List result = new List();
    for (var key in this._map.keys) {
      result.addAll(this._map[key]);
    }
    return result;
  }

  List keysArray() {
    return new List.from(this._map.keys);
  }

  clear() => this._map.clear();
  
}
