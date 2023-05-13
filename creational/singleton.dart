class Singleton {
  static final Singleton _instance = Singleton._internal();

  factory Singleton() {
    return _instance;
  }

  Singleton._internal();
}

void main() {
  final single1 = Singleton();
  final single2 = Singleton();
  print(single1 == single2);
}
