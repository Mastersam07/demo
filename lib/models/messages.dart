class Messages {
  String? id;
  String? message;
  DateTime? modifiedAt;
  String? sender;

  Messages({this.id, this.message, this.modifiedAt, this.sender});

  Messages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    message = json['message'];
    modifiedAt = DateTime.fromMillisecondsSinceEpoch(json['modified_at']);
    sender = json['sender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['message'] = message;
    data['modified_at'] = modifiedAt?.millisecondsSinceEpoch;
    data['sender'] = sender;
    return data;
  }
}

List<Map<String, dynamic>> firstJson = [
  {
    "id": "1003",
    "message": "How about tomorrow then?",
    "modified_at": 1599814026153,
    "sender": "John"
  },
  {
    "id": "1002",
    "message": "Sorry I can't today",
    "modified_at": 1599814006153,
    "sender": "Daniel"
  },
  {
    "id": "1001",
    "message": "Hei how about some pizza tonight?",
    "modified_at": 1599813006153,
    "sender": "John"
  }
];

List<Map<String, dynamic>> secondJson = [
  {
    "id": "2003",
    "message": "I will send them to you asap",
    "modified_at": 1599000026153,
    "sender": "Raphael"
  },
  {
    "id": "2002",
    "message": "Finally they're ready",
    "modified_at": 1599000025153,
    "sender": "Raphael"
  },
  {
    "id": "2001",
    "message": "About those slides you were asking",
    "modified_at": 1599000024153,
    "sender": "Raphael"
  }
];

List<Map<String, dynamic>> thirdJson = [
  {
    "id": "3002",
    "message": "Can you please?",
    "modified_at": 1512814026153,
    "sender": "Dad"
  },
  {
    "id": "3001",
    "message":
        "Hello there, I was thinking, by now you should have lots and lots of pictures taken at your brother's wedding and the following day, where you were constantly taking pictures all day long, every single day. Would you mind send them over so that your mum and me we can select the best, or share them with us online?",
    "modified_at": 1512813026153,
    "sender": "Dad"
  }
];
