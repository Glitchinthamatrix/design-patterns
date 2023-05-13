// Abstract Factory

enum OS { android, ios }

enum ButtonState { on, off }

enum CheckboxState { checked, unchecked }

abstract class Button {
  void click(ButtonState state);
}

abstract class Checkbox {
  void change(CheckboxState state);
}

abstract class TextField {
  void input(String text);
}

abstract class ComponentFactory {
  Button getButton();

  Checkbox getCheckbox();

  TextField getTextField();
}

class AndroidButton implements Button {
  @override
  void click(ButtonState state) {
    print("Clicked android button, state is $state");
  }
}

class AndroidCheckbox implements Checkbox {
  @override
  void change(CheckboxState state) {
    print("Changed android checkbox's state, state is now $state");
  }
}

class AndroidTextField implements TextField {
  @override
  void input(String text) {
    print("Input in android text field: $text");
  }
}

class IOSButton implements Button {
  @override
  void click(ButtonState state) {
    print("Clicked IOS button, state is now $state");
  }
}

class IOSCheckbox implements Checkbox {
  @override
  void change(CheckboxState state) {
    print("Changed IOS checkbox's state, state is now $state");
  }
}

class IOSTextField implements TextField {
  @override
  void input(String text) {
    print("Input in IOS text field: $text");
  }
}

class AndroidFactory implements ComponentFactory {
  @override
  AndroidButton getButton() {
    return AndroidButton();
  }

  @override
  AndroidCheckbox getCheckbox() {
    return AndroidCheckbox();
  }

  @override
  AndroidTextField getTextField() {
    return AndroidTextField();
  }
}

class IOSFactory implements ComponentFactory {
  @override
  IOSButton getButton() {
    return IOSButton();
  }

  @override
  IOSCheckbox getCheckbox() {
    return IOSCheckbox();
  }

  @override
  IOSTextField getTextField() {
    return IOSTextField();
  }
}

class GUIFactory implements ComponentFactory {
  OS os;
  late ComponentFactory factory;

  GUIFactory(this.os) {
    if (os == OS.ios) {
      factory = IOSFactory();
    } else {
      factory = AndroidFactory();
    }
  }

  @override
  Button getButton() {
    return factory.getButton();
  }

  @override
  Checkbox getCheckbox() {
    return factory.getCheckbox();
  }

  @override
  TextField getTextField() {
    return factory.getTextField();
  }
}

void main() {
  final android = GUIFactory(OS.ios);
  final button = android.getButton();
  final checkbox = android.getCheckbox();
  final textfield = android.getTextField();
  button.click(ButtonState.on);
  checkbox.change(CheckboxState.checked);
  textfield.input("hello, world");
}
