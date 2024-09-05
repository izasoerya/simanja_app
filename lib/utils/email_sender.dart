import 'package:flutter_email_sender/flutter_email_sender.dart';

class EmailSender {
  final String subject;
  final String body;
  final List<String> recipients;

  const EmailSender({
    required this.subject,
    required this.body,
    required this.recipients,
  });

  Future<void> sendEmail() async {
    FlutterEmailSender.send(
      Email(
        body: body,
        subject: subject,
        recipients: recipients,
      ),
    );
  }
}
