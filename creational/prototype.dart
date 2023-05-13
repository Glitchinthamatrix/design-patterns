import "dart:math";

String getRandomIP() {
  var random = Random();
  return "${random.nextInt(256)}.${random.nextInt(256)}.${random.nextInt(256)}.${random.nextInt(256)}";
}

abstract class Cloneable {
  Cloneable clone();
}

class Computer implements Cloneable {
  int ram;
  int rom;
  String cpu;

  Computer(
    this.ram,
    this.rom,
    this.cpu,
  );

  factory Computer.fromSource(Computer source) {
    return Computer(
      source.ram,
      source.rom,
      source.cpu,
    );
  }

  @override
  Computer clone() {
    return Computer.fromSource(this);
  }
}

class NetworkService implements Cloneable {
  String ip;
  Map config;

  NetworkService(this.ip, this.config);

  factory NetworkService.fromSource(NetworkService source) {
    return NetworkService(
      getRandomIP(),
      source.config,
    );
  }

  @override
  NetworkService clone() {
    return NetworkService.fromSource(this);
  }
}

class Server implements Cloneable {
  late Computer _computer;
  late NetworkService _netService;

  Server({Computer? computer, NetworkService? netService}) {
    computer ??= Computer(16, 1024, "Intel i7");
    netService ??= NetworkService(getRandomIP(), {"speed": "50000000 B/s"});
    _computer = computer;
    _netService = netService;
  }

  Computer get computer => _computer;

  NetworkService get netService => _netService;

  factory Server.fromSource(Server source) {
    return Server(computer: source.computer, netService: source.netService);
  }

  @override
  Server clone() {
    return Server.fromSource(this);
  }
}

class PC implements Cloneable {
  late Computer _computer;
  late NetworkService _netService;

  PC({Computer? computer, NetworkService? netService}) {
    computer ??= Computer(8, 512, "Intel i5");
    netService ??= NetworkService(getRandomIP(), {"speed": "5000000 B/s"});
    _computer = computer;
    _netService = netService;
  }

  Computer get computer => _computer;

  NetworkService get netService => _netService;

  factory PC.fromSource(PC source) {
    return PC(computer: source.computer, netService: source.netService);
  }

  @override
  PC clone() {
    return PC.fromSource(this);
  }
}

void main() {
  final server = Server();
  final server2 = server.clone();
  print(server2.computer);
}
