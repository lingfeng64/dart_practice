class Point {
  double? x; 
  double? y; 
  double z = 0; 


void main() {
  var point = Point();
  point.x = 4; 
  assert(point.x == 4); 
  assert(point.y == null); 
}


double initialX = 1.5;

class Point1 {
  double? x = initialX;

  double? y = this.x;

  late double? z = this.x;

  Point1(this.x, this.y);
}

class ProfileMark {
  final String name;
  final DateTime start = DateTime.now();

  ProfileMark(this.name);
  ProfileMark.unnamed() : name = '';
}

class Person {
  final String _name;

  Person(this._name);

  String greet(String who) => 'Hello, $who. I am $_name.';
}

class Impostor implements Person {
  String get _name => '';

  String greet(String who) => 'Hi $who. Do you know who I am?';
}

String greetBob(Person person) => person.greet('Bob');

void main() {
  print(greetBob(Person('Kathy')));
  print(greetBob(Impostor()));
}

import 'dart:math';

class Point {
  double x, y;
  Point(this.x, this.y);

  static double distanceBetween(Point a, Point b) {
    var dx = a.x - b.x;
    var dy = a.y - b.y;
    return sqrt(dx * dx + dy * dy);
  }
}

void main() {
  
  var a = Point(2, 2);
  var b = Point(4, 4);
  var distance = Point.distanceBetween(a, b);
  assert(2.8 < distance && distance < 2.9);
  print(distance);
}







// 构造方法

class Point {
  double x = 0;
  double y = 0;

  Point(this.x, this.y);
}

class Point {
  final double x;
  final double y;

  Point(this.x, this.y);
}

const double xOrigin = 0;
const double yOrigin = 0;

class Point {
  final double x;
  final double y;

  Point(this.x, this.y);

  Point.origin()
      : x = xOrigin,
        y = yOrigin;
}

class Vector2d {
  final double x;
  final double y;

  Vector2d(this.x, this.y);
}

class Vector3d extends Vector2d {
  final double z;

  Vector3d(super.x, super.y, this.z);
}

Point.fromJson(Map<String, double> json)
    : x = json['x']!,
      y = json['y']! {
  print('In Point.fromJson(): ($x, $y)');
}

Point.withAssert(this.x, this.y) : assert(x >= 0) {
  print('In Point.withAssert(): ($x, $y)');
}

class Point {
  double x, y;

  Point(this.x, this.y);

  Point.alongXAxis(double x) : this(x, 0);
}

class ImmutablePoint {
  static const ImmutablePoint origin = ImmutablePoint(0, 0);

  final double x, y;

  const ImmutablePoint(this.x, this.y);
}

class Logger {
  final String name;
  bool mute = false;

  static final Map<String, Logger> _cache = <String, Logger>{};

  factory Logger(String name) {
    return _cache.putIfAbsent(name, () => Logger._internal(name));
  }

  factory Logger.fromJson(Map<String, Object> json) {
    return Logger(json['name'].toString());
  }

  Logger._internal(this.name);

  void log(String msg) {
    if (!mute) print(msg);
  }
}

var logger = Logger('UI');
logger.log('Button clicked');

var logMap = {'name': 'UI'};
var loggerJson = Logger.fromJson(logMap);





// 成员方法

import 'dart:math';

class Point {
  final double x;
  final double y;

  Point(this.x, this.y);

  double distanceTo(Point other) {
    var dx = x - other.x;
    var dy = y - other.y;
    return sqrt(dx * dx + dy * dy);
  }
}

class Vector {
  final int x, y;

  Vector(this.x, this.y);

  Vector operator +(Vector v) => Vector(x + v.x, y + v.y);
  Vector operator -(Vector v) => Vector(x - v.x, y - v.y);

  @override
  bool operator ==(Object other) =>
      other is Vector && x == other.x && y == other.y;

  @override
  int get hashCode => Object.hash(x, y);
}

void main() {
  final v = Vector(2, 3);
  final w = Vector(2, 2);

  assert(v + w == Vector(4, 5));
  assert(v - w == Vector(0, 1));
}

class Rectangle {
  double left, top, width, height;

  Rectangle(this.left, this.top, this.width, this.height);

  double get right => left + width;
  set right(double value) => left = value - width;
  double get bottom => top + height;
  set bottom(double value) => top = value - height;
}

void main() {
  var rect = Rectangle(3, 4, 20, 15);
  assert(rect.left == 3);
  rect.right = 12;
  assert(rect.left == -8);
}

abstract class Doer {

  void doSomething();
}

class EffectiveDoer extends Doer {
  void doSomething() {
  }
}





// 继承

class Television {
  void turnOn() {
    _illuminateDisplay();
    _activateIrSensor();
  }
  // ···
}

class SmartTelevision extends Television {
  void turnOn() {
    super.turnOn();
    _bootNetworkInterface();
    _initializeMemory();
    _upgradeApps();
  }
  // ···
}

class Television {
  // ···
  set contrast(int value) {...}
}

class SmartTelevision extends Television {
  @override
  set contrast(num value) {...}
  // ···
}

class A {
  @override
  void noSuchMethod(Invocation invocation) {
    print('You tried to use a non-existent member: '
        '${invocation.memberName}');
  }
}




// 混入

class Musician extends Performer with Musical {
}

class Maestro extends Person with Musical, Aggressive, Demented {
  Maestro(String maestroName) {
    name = maestroName;
    canConduct = true;
  }
}

mixin Musical {
  bool canPlayPiano = false;
  bool canCompose = false;
  bool canConduct = false;

  void entertainMe() {
    if (canPlayPiano) {
      print('Playing piano');
    } else if (canConduct) {
      print('Waving hands');
    } else {
      print('Humming to self');
    }
  }
}

class Musician {
  // ...
}
mixin MusicalPerformer on Musician {
  // ...
}
class SingerDancer extends Musician with MusicalPerformer {
  // ...
}

abstract mixin class Musician {
  void playInstrument(String instrumentName);

  void playPiano() {
    playInstrument('Piano');
  }
  void playFlute() {
    playInstrument('Flute');
  }
}

class Virtuoso with Musician {
  void playInstrument(String instrumentName) {
    print('Plays the $instrumentName beautifully');
  }  
} 

class Novice extends Musician { 
  void playInstrument(String instrumentName) {
    print('Plays the $instrumentName poorly');
  }  
}




// 枚举

enum Color { red, green, blue }

enum Vehicle implements Comparable<Vehicle> {
  car(tires: 4, passengers: 5, carbonPerKilometer: 400),
  bus(tires: 6, passengers: 50, carbonPerKilometer: 800),
  bicycle(tires: 2, passengers: 1, carbonPerKilometer: 0);

  const Vehicle({
    required this.tires,
    required this.passengers,
    required this.carbonPerKilometer,
  });

  final int tires;
  final int passengers;
  final int carbonPerKilometer;

  int get carbonFootprint => (carbonPerKilometer / passengers).round();

  bool get isTwoWheeled => this == Vehicle.bicycle;

  @override
  int compareTo(Vehicle other) => carbonFootprint - other.carbonFootprint;
}

final favoriteColor = Color.blue;
if (favoriteColor == Color.blue) {
  print('Your favorite color is blue!');
}

assert(Color.red.index == 0);
assert(Color.green.index == 1);
assert(Color.blue.index == 2);

List<Color> colors = Color.values;
assert(colors[2] == Color.blue);

var aColor = Color.blue;

switch (aColor) {
  case Color.red:
    print('Red as roses!');
  case Color.green:
    print('Green as grass!');
  default: 
    print(aColor); 
}

print(Color.blue.name); 

print(Vehicle.car.carbonFootprint);



// 扩展方法

extension NumberParsing on String {
  int parseInt() {
    return int.parse(this);
  }

  double parseDouble() {
    return double.parse(this);
  }
}

extension on String {
  bool get isBlank => trim().isEmpty;
}

extension MyFancyList<T> on List<T> {
  int get doubleLength => length * 2;
  List<T> operator -() => reversed.toList();
  List<List<T>> split(int at) => [sublist(0, at), sublist(at)];
}





// 扩展类型

extension type IdNumber(int id) {
  operator <(IdNumber other) => id < other.id;
}

void main() {
  int myUnsafeId = 42424242;
  myUnsafeId = myUnsafeId + 10; 

  var safeId = IdNumber(42424242);
  safeId + 10;
  myUnsafeId = safeId; 
  myUnsafeId = safeId as int; 
  safeId < IdNumber(42424241); 
}

extension type E(int i) {
  E.n(this.i);
  E.m(int j, String foo) : i = j + foo.length;
}

void main() {
  E(4); 
  E.n(3); 
  E.m(5, "Hello!"); 
}

extension type const E._(int it) {
  E(): this._(42);
  E.otherName(this.it);
}

void main2() {
  E();
  const E._(2);
  E.otherName(3);
}

extension type E._(int i) {
  E.fromString(String foo) : i = int.parse(foo);
}

extension type NumberE(int value) {
  NumberE operator +(NumberE other) =>
      NumberE(value + other.value);
  NumberE get myNum => this;
  bool isValid() => !value.isNegative;
}

extension type const Opt<T>._(({T value})? _) { 
  const factory Opt(T value) = Val<T>;
  const factory Opt.none() = Non<T>;
}
extension type const Val<T>._(({T value}) _) implements Opt<T> { 
  const Val(T value) : this._((value: value));
  T get value => _.value;
}
extension type const Non<T>._(Null _) implements Opt<Never> {
  const Non() : this._(null);
}

extension type NumberT(int value) 
  implements int {
  NumberT get i => this;
}

void main () {
  var v1 = NumberT(1); 
  int v2 = NumberT(2); 
  var v3 = v1.i - v1;  
  var v4 = v2 + v1;
  var v5 = 2 + v1; 
  v2.i;
}

void main() {
  var n = NumberE(1);

  if (n is int) print(n.value); // Prints 1.

  if (n case int x) print(x.toRadixString(10)); 
  switch (n) {
    case int(:var isEven): print("$n (${isEven ? "even" : "odd"})"); 
  }
}