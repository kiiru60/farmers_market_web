class ApplicationClient {
  int id;
  String dateCreated;
  String dateCreatedGmt;
  String dateModified;
  String dateModifiedGmt;
  String email;
  String firstName;
  String lastName;
  String role;
  String username;
  String password;
  Billing billing;
  Shipping shipping;
  bool isPayingCustomer;
  String avatarUrl;
  List<ApplicationClientMetaData> metaData;
  Links links;

  ApplicationClient(
      {this.id,
      this.dateCreated,
      this.dateCreatedGmt,
      this.dateModified,
      this.dateModifiedGmt,
      this.email,
      this.firstName,
      this.lastName,
      this.role,
      this.username,
      this.password,
      this.billing,
      this.shipping,
      this.isPayingCustomer,
      this.avatarUrl,
      this.metaData,
      this.links});

  ApplicationClient.fromFirestore(Map<String, dynamic> firestore) {
    id = firestore['id'];
    dateCreated = firestore['date_created'];
    dateCreatedGmt = firestore['date_created_gmt'];
    dateModified = firestore['date_modified'];
    dateModifiedGmt = firestore['date_modified_gmt'];
    email = firestore['email'];
    firstName = firestore['first_name'];
    lastName = firestore['last_name'];
    role = firestore['role'];
    username = firestore['username'];
    billing = firestore['billing'] != null
        ? new Billing.fromFirestore(firestore['billing'])
        : null;
    shipping = firestore['shipping'] != null
        ? new Shipping.fromFirestore(firestore['shipping'])
        : null;
    isPayingCustomer = firestore['is_paying_customer'];
    avatarUrl = firestore['avatar_url'];
    metaData = (firestore['meta_data'] as List)
        .map((i) => ApplicationClientMetaData.fromFirestore(i))
        .toList();
    links = firestore['_links'] != null
        ? new Links.fromFirestore(firestore['_links'])
        : null;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date_created'] = this.dateCreated;
    data['date_created_gmt'] = this.dateCreatedGmt;
    data['date_modified'] = this.dateModified;
    data['date_modified_gmt'] = this.dateModifiedGmt;
    data['email'] = this.email;
    if (this.firstName != null) {
      data['first_name'] = this.firstName;
    }
    data['last_name'] = this.lastName;
    if (this.lastName != null) {
      data['last_name'] = this.lastName;
    }
    data['role'] = this.role;
    data['username'] = this.username;
    data['password'] = this.password;
    if (this.billing != null) {
      data['billing'] = this.billing.toMap();
    }
    if (this.shipping != null) {
      data['shipping'] = this.shipping.toMap();
    }
    data['is_paying_customer'] = this.isPayingCustomer;
    data['avatar_url'] = this.avatarUrl;
    if (this.metaData != null) {
      data['meta_data'] = this.metaData.map((v) => v.toMap()).toList();
    }
    if (this.links != null) {
      data['_links'] = this.links.toMap();
    }
    return data;
  }

  @override
  toString() => this.toMap().toString();
}

class ApplicationClientMetaData {
  final int id;
  final String key;
  final dynamic value;

  ApplicationClientMetaData(this.id, this.key, this.value);

  ApplicationClientMetaData.fromFirestore(Map<String, dynamic> firestore)
      : id = firestore['id'],
        key = firestore['key'],
        value = firestore['value'];

  Map<String, dynamic> toMap() => {'id': id, 'key': key, 'value': value};
}

class Billing {
  String firstName;
  String lastName;
  String company;
  String address1;
  String address2;
  String city;
  String state;
  String postcode;
  String country;
  String email;
  String phone;

  Billing(
      {this.firstName,
      this.lastName,
      this.company,
      this.address1,
      this.address2,
      this.city,
      this.state,
      this.postcode,
      this.country,
      this.email,
      this.phone});

  Billing.fromFirestore(Map<String, dynamic> firestore) {
    firstName = firestore['first_name'];
    lastName = firestore['last_name'];
    company = firestore['company'];
    address1 = firestore['address_1'];
    address2 = firestore['address_2'];
    city = firestore['city'];
    state = firestore['state'];
    postcode = firestore['postcode'];
    country = firestore['country'];
    email = firestore['email'];
    phone = firestore['phone'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['company'] = this.company;
    data['address_1'] = this.address1;
    data['address_2'] = this.address2;
    data['city'] = this.city;
    data['state'] = this.state;
    data['postcode'] = this.postcode;
    data['country'] = this.country;
    data['email'] = this.email;
    data['phone'] = this.phone;
    return data;
  }
}

class Shipping {
  String firstName;
  String lastName;
  String company;
  String address1;
  String address2;
  String city;
  String state;
  String postcode;
  String country;

  Shipping(
      {this.firstName,
      this.lastName,
      this.company,
      this.address1,
      this.address2,
      this.city,
      this.state,
      this.postcode,
      this.country});

  Shipping.fromFirestore(Map<String, dynamic> firestore) {
    firstName = firestore['first_name'];
    lastName = firestore['last_name'];
    company = firestore['company'];
    address1 = firestore['address_1'];
    address2 = firestore['address_2'];
    city = firestore['city'];
    state = firestore['state'];
    postcode = firestore['postcode'];
    country = firestore['country'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['company'] = this.company;
    data['address_1'] = this.address1;
    data['address_2'] = this.address2;
    data['city'] = this.city;
    data['state'] = this.state;
    data['postcode'] = this.postcode;
    data['country'] = this.country;
    return data;
  }
}

class Links {
  List<Self> self;
  List<Collection> collection;

  Links({this.self, this.collection});

  Links.fromFirestore(Map<String, dynamic> firestore) {
    if (firestore['self'] != null) {
      self = new List<Self>();
      firestore['self'].forEach((v) {
        self.add(new Self.fromFirestore(v));
      });
    }
    if (firestore['collection'] != null) {
      collection = new List<Collection>();
      firestore['collection'].forEach((v) {
        collection.add(new Collection.fromFirestore(v));
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

class Self {
  String href;

  Self({this.href});

  Self.fromFirestore(Map<String, dynamic> firestore) {
    href = firestore['href'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['href'] = this.href;
    return data;
  }
}

class Collection {
  String href;

  Collection({this.href});

  Collection.fromFirestore(Map<String, dynamic> firestore) {
    href = firestore['href'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['href'] = this.href;
    return data;
  }
}
