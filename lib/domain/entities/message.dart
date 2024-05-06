enum MessageOwner { mine, hers }

class Message {
  final String text;
  final String? imageUrl;
  final MessageOwner owner;

  Message({
    required this.text,
    this.imageUrl,
    required this.owner,
  });
}
