class Conversation {
  String? id;
  String? lastMessage;
  List<String>? members;
  String? topic;
  DateTime? modifiedAt;

  Conversation({
    this.id,
    this.lastMessage,
    this.members,
    this.topic,
    this.modifiedAt,
  });

  Conversation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    lastMessage = json['last_message'];
    members = json['members'].cast<String>();
    topic = json['topic'];
    modifiedAt = DateTime.fromMillisecondsSinceEpoch(json['modified_at']);
  }
}

var groupJson = [
  {
    "id": "9991",
    "last_message": "How about tomorrow then?",
    "members": ["John", "Daniel", "Rachel"],
    "topic": "pizza night",
    "modified_at": 1599814026153
  },
  {
    "id": "9992",
    "last_message": "I will send them to you asap",
    "members": ["Raphael"],
    "topic": "slides",
    "modified_at": 1599000026153
  },
  {
    "id": "9993",
    "last_message": "Can you please?",
    "members": ["Mum", "Dad", "Bro"],
    "topic": "pictures",
    "modified_at": 1512814026153
  }
];
