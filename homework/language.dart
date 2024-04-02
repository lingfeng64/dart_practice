import 'dart:math';

void main(List<String> args) {
  print('Hello,World');

  //var
  var name = 'Voyager I';
  var year = 1977;
  var antennaDiameter = 3.7;
  var flybyObjects = ['Jupiter', 'Saturn', 'Uranus', 'Neptune'];
  var image = {
    'tags': ['saturn'],
    'url': '//path/to/saturn.jpg'
  };

  //loop
  if (year >= 2001) {
    print('21st century');
  } else if (year >= 1901) {
    print('20th century');
  }

  for (final object in flybyObjects) {
    print(object);
  }
  for (int month = 1; month <= 12; month++) {
    print(month);
  }
  while (year < 2016) {
    year += 1;
  }

  //function
  int fibonacci(int n) {
    if (n == 0 || n == 1) return n;
    return fibonacci(n - 1) + fibonacci(n - 2);
  }

  var result = fibonacci(20);
  print(result);
}

class Spacecraft {
  String? name;
  DateTime? launchDate;

  int? get launchYear => launchDate?.year;
  Spacecraft(this.name, this.launchDate) {}
  Spacecraft.unlaunched(String name) : this(name, null);

  void discribe() {
    print('Spacecraft:$name');
    var launchDate = this.launchDate;
    if (launchDate != null) {
      int years = DateTime.now().difference(launchDate).inDays ~/ 365;
      print('Launched: $launchYear ($years years ago)');
    } else {
      print('Unlaucnched');
    }
  }
}

enum PlanetType{ terrestrial,gas,ice}
enum Planet{

  
  mercury(planetType:PlanetType.terrestrial,moons:0,hasRings:false),
  venus(planetType:PlanetType.terrestrial,moons:0,hasRings:false),
  uranus(planetType:PlanetType.ice,moons:27,hasRings:true),
  neptune(planetType:PlanetType.ice,moons:14,hasRings:true),
  const Planet(
    {required this.planetType,required this.moons,required this.hasRIngs});
  
  final PlanetType planetType;
  final int moons;
  final bool hasRings;
 
  bool get isGiant =>
       planetType == PlanetType.gas || planetType == PlanetType.ice;
}

//interface
class MockSpaceship implements Spacecraft{

}
abstract class Describable{
  void describle();
  void describeWithEmphasis(){
    print('======');
    describle();
    print('======');
  }
}

