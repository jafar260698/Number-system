 class Notes {
   int id;
   int userId;
   String title;
   String body;

   Notes({
     this.id,
     this.userId,
     this.title,
     this.body
   });

   Notes.fromJson(Map<String, dynamic> json) {
     id = json['id'];
     userId = json['userId'];
     title = json['title'];
     body = json['body'];
   }

   Map<String, dynamic> toJson() {
     final Map<String, dynamic> data = new Map<String, dynamic>();
     data['id'] = this.id;
     data['userId'] = this.userId;
     data['title'] = this.title;
     data['body'] = this.body;
     return data;
   }

 }