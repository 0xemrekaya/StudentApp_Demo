class MessagesRepository {
  final List<Message> messages = [
    Message(text: "Hello!", sender: "Ali", time: DateTime.now()),
    Message(text: "Hi!", sender: "Ayşe", time: DateTime.now().subtract(const Duration(minutes: 1))),
    Message(text: "How are you?", sender: "Ayşe", time: DateTime.now()),
  ];
  late int newMessageCounter = messages.length;
}

class Message {
  final String text;
  final String sender;
  final DateTime time;
  Message({required this.text, required this.sender, required this.time});
}
