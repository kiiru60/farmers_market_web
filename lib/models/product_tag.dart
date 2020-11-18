class ApplicationProductTag {
  int id;
  String name;
  String slug;
  String description;
  int count;
  ApplicationProductTagLinks lLinks;

  ApplicationProductTag(
      {this.id,
      this.name,
      this.slug,
      this.description,
      this.count,
      this.lLinks});

  ApplicationProductTag.fromFirestore(Map<String, dynamic> firestore) {
    id = firestore['id'];
    name = firestore['name'];
    slug = firestore['slug'];
    description = firestore['description'];
    count = firestore['count'];
    lLinks = firestore['_links'] != null
        ? new ApplicationProductTagLinks.fromFirestore(firestore['_links'])
        : null;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['description'] = this.description;
    data['count'] = this.count;
    if (this.lLinks != null) {
      data['_links'] = this.lLinks.toMap();
    }
    return data;
  }

  @override
  toString() => this.toMap().toString();
}

class ApplicationProductTagLinks {
  List<ApplicationProductTagSelf> self;
  List<ApplicationProductTagCollection> collection;

  ApplicationProductTagLinks({this.self, this.collection});

  ApplicationProductTagLinks.fromFirestore(Map<String, dynamic> firestore) {
    if (firestore['self'] != null) {
      self = new List<ApplicationProductTagSelf>();
      firestore['self'].forEach((v) {
        self.add(new ApplicationProductTagSelf.fromFirestore(v));
      });
    }
    if (firestore['collection'] != null) {
      collection = new List<ApplicationProductTagCollection>();
      firestore['collection'].forEach((v) {
        collection.add(new ApplicationProductTagCollection.fromFirestore(v));
      });
    }
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.self != null) {
      data['self'] = this.self.map((v) => v.toMap()).toList();
    }
    if (this.collection != null) {
      data['collection'] = this.collection.map((v) => v.toMap()).toList();
    }
    return data;
  }
}

class ApplicationProductTagSelf {
  String href;

  ApplicationProductTagSelf({this.href});

  ApplicationProductTagSelf.fromFirestore(Map<String, dynamic> firestore) {
    href = firestore['href'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['href'] = this.href;
    return data;
  }
}

class ApplicationProductTagCollection {
  String href;

  ApplicationProductTagCollection({this.href});

  ApplicationProductTagCollection.fromFirestore(
      Map<String, dynamic> firestore) {
    href = firestore['href'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['href'] = this.href;
    return data;
  }
}
