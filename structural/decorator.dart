// Decorator pattern

abstract class Notifier {
  void send();
}

abstract class BaseDecorator implements Notifier {
  Notifier? otherNotifier;

  BaseDecorator(this.otherNotifier);
}

class EmailDecorator implements BaseDecorator {
  @override
  Notifier? otherNotifier;
  String? email;

  EmailDecorator(
    this.email, {
    this.otherNotifier,
  });

  @override
  void send() {
    otherNotifier?.send();
    print("emailed to $email");
  }
}

class SMSDecorator implements BaseDecorator {
  @override
  Notifier? otherNotifier;
  int? number;

  SMSDecorator(
    this.number, {
    this.otherNotifier,
  });

  @override
  void send() {
    otherNotifier?.send();
    print("sent SMS to $number");
  }
}

class SlackDecorator implements BaseDecorator {
  @override
  Notifier? otherNotifier;
  String? slackId;

  SlackDecorator(
    this.slackId, {
    this.otherNotifier,
  });

  @override
  void send() {
    otherNotifier?.send();
    print("sent notification to $slackId");
  }
}

Notifier notifier1 = EmailDecorator("ny040021@gmail.com");
Notifier notifier2 = SMSDecorator(
  9082229626,
  otherNotifier: notifier1,
);
Notifier notifier3 = SlackDecorator(
  "slack-id",
  otherNotifier: notifier2,
);

void main() {
  notifier3.send();
}
