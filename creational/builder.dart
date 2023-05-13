// Builder pattern
class Computer {
  int rom;
  int ram;
  String cpu;
  String? os;
  bool? isNetworked;
  bool? isOverclocked;
  bool? hasGUI;

  Computer({
    required this.rom,
    required this.ram,
    required this.cpu,
    required this.os,
    required this.isNetworked,
    required this.isOverclocked,
    required this.hasGUI,
  });
}

class ComputerBuilder {
  int rom;
  int ram;
  String cpu;

  String os = 'Linux';
  bool isNetworked = false;
  bool isOverclocked = false;
  bool hasGUI = false;

  ComputerBuilder(
    this.rom,
    this.ram,
    this.cpu,
  );

  void OS(String value) {
    os = value;
  }

  void networked(bool value) {
    isNetworked = value;
  }

  void overclocked(bool value) {
    isOverclocked = value;
  }

  void gui(bool value) {
    hasGUI = value;
  }

  Computer build() {
    return Computer(
      rom: rom,
      ram: ram,
      cpu: cpu,
      os: os,
      isNetworked: isNetworked,
      isOverclocked: isOverclocked,
      hasGUI: hasGUI,
    );
  }
}

void main() {
  final computer = (ComputerBuilder(512, 16, "Intel i5")
        ..OS("Windows")
        ..networked(true)
        ..overclocked(true)
        ..gui(true))
      .build();
  print(computer.os);
}
