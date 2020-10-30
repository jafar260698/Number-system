class Posts {
  String id;
  String title;
  String note;
  String orgDirector;
  String telNumber;
  String emailOrg;
  String userName;
  String categoryTitle;
  String categoryId;
  String asosiyFaoliyat;
  String rating;

  Posts(
      {this.id,
        this.title,
        this.note,
        this.orgDirector,
        this.telNumber,
        this.emailOrg,
        this.userName,
        this.categoryTitle,
        this.categoryId,
        this.asosiyFaoliyat,
        this.rating});

  Posts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    note = json['note'];
    orgDirector = json['org_director'];
    telNumber = json['tel_number'];
    emailOrg = json['email_org'];
    userName = json['user_name'];
    categoryTitle = json['category_title'];
    categoryId = json['category_id'];
    asosiyFaoliyat = json['asosiy_faoliyat'];
    rating = json['rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['note'] = this.note;
    data['org_director'] = this.orgDirector;
    data['tel_number'] = this.telNumber;
    data['email_org'] = this.emailOrg;
    data['user_name'] = this.userName;
    data['category_title'] = this.categoryTitle;
    data['category_id'] = this.categoryId;
    data['asosiy_faoliyat'] = this.asosiyFaoliyat;
    data['rating'] = this.rating;
    return data;
  }
}
