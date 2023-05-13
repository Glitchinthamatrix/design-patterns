enum TransportType { land, sea, air }

abstract class Vehicle {
  int loadCapacity;

  Vehicle(this.loadCapacity);

  void deliver(String goods);
}

class Truck implements Vehicle {
  @override
  int loadCapacity;

  Truck(this.loadCapacity);

  @override
  void deliver(String goods) {
    print('Delivered <=$loadCapacity ton $goods by truck');
  }
}

class Ship implements Vehicle {
  @override
  int loadCapacity;

  Ship(this.loadCapacity);

  @override
  void deliver(String goods) {
    print('Delivered <=$loadCapacity ton $goods by ship');
  }
}

class Plane implements Vehicle {
  @override
  int loadCapacity;

  Plane(this.loadCapacity);

  @override
  void deliver(String goods) {
    print('Delivered <=$loadCapacity ton $goods by plane');
  }
}

class TransportService {
  late Vehicle vehichle;

  TransportService(TransportType type, int weightInTon) {
    if (type == TransportType.land) {
      vehichle = Truck(weightInTon);
    } else if (type == TransportType.sea) {
      vehichle = Ship(weightInTon);
    } else {
      vehichle = Plane(weightInTon);
    }
  }

  void deliver(String goods) {
    vehichle.deliver(goods);
  }
}

void main() {
  final transporter = TransportService(TransportType.sea, 50);
  transporter.deliver("Spices");
}
