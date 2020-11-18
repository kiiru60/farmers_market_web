class ApplicationClientPaymentGateway {
  String id;
  String title;
  String description;
  int order;
  bool enabled;
  String methodTitle;
  String methodDescription;
  List<String> methodSupports;
  ApplicationClientPaymentGatewaySettings settings;
  ApplicationClientPaymentGatewayLinks lLinks;

  ApplicationClientPaymentGateway(
      {this.id,
      this.title,
      this.description,
      this.order,
      this.enabled,
      this.methodTitle,
      this.methodDescription,
      this.methodSupports,
      this.settings,
      this.lLinks})
      : assert(id != null);

  ApplicationClientPaymentGateway.fromFirestore(
      Map<String, dynamic> firestore) {
    id = firestore['id'];
    title = firestore['title'];
    description = firestore['description'];
    order = firestore['order'];
    enabled = firestore['enabled'];
    methodTitle = firestore['method_title'];
    methodDescription = firestore['method_description'];
    methodSupports = firestore['method_supports'].cast<String>();
    settings = firestore['settings'] != null
        ? new ApplicationClientPaymentGatewaySettings.fromFirestore(
            firestore['settings'])
        : null;
    lLinks = firestore['_links'] != null
        ? new ApplicationClientPaymentGatewayLinks.fromFirestore(
            firestore['_links'])
        : null;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['order'] = this.order;
    data['enabled'] = this.enabled;
    data['method_title'] = this.methodTitle;
    data['method_description'] = this.methodDescription;
    data['method_supports'] = this.methodSupports;
    if (this.settings != null) {
      data['settings'] = this.settings.toMap();
    }
    if (this.lLinks != null) {
      data['_links'] = this.lLinks.toMap();
    }
    return data;
  }
}

class ApplicationClientPaymentGatewaySettings {
  ApplicationClientPaymentGatewayTitle title;
  ApplicationClientPaymentGatewayTitle instructions;

  ApplicationClientPaymentGatewaySettings({this.title, this.instructions});

  ApplicationClientPaymentGatewaySettings.fromFirestore(
      Map<String, dynamic> firestore) {
    title = firestore['title'] != null
        ? new ApplicationClientPaymentGatewayTitle.fromFirestore(
            firestore['title'])
        : null;
    instructions = firestore['instructions'] != null
        ? new ApplicationClientPaymentGatewayTitle.fromFirestore(
            firestore['instructions'])
        : null;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.title != null) {
      data['title'] = this.title.toMap();
    }
    if (this.instructions != null) {
      data['instructions'] = this.instructions.toMap();
    }
    return data;
  }
}

class ApplicationClientPaymentGatewayTitle {
  String id;
  String label;
  String description;
  String type;
  String value;
  String defaultvalue;
  String tip;
  String placeholder;

  ApplicationClientPaymentGatewayTitle(
      {this.id,
      this.label,
      this.description,
      this.type,
      this.value,
      this.defaultvalue,
      this.tip,
      this.placeholder});

  ApplicationClientPaymentGatewayTitle.fromFirestore(
      Map<String, dynamic> firestore) {
    id = firestore['id'];
    label = firestore['label'];
    description = firestore['description'];
    type = firestore['type'];
    value = firestore['value'];
    defaultvalue = firestore['default'];
    tip = firestore['tip'];
    placeholder = firestore['placeholder'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['label'] = this.label;
    data['description'] = this.description;
    data['type'] = this.type;
    data['value'] = this.value;
    data['default'] = this.defaultvalue;
    data['tip'] = this.tip;
    data['placeholder'] = this.placeholder;
    return data;
  }
}

class ApplicationClientPaymentGatewayLinks {
  List<ApplicationClientPaymentGatewaySelf> self;
  List<ApplicationClientPaymentGatewayCollection> collection;

  ApplicationClientPaymentGatewayLinks({this.self, this.collection});

  ApplicationClientPaymentGatewayLinks.fromFirestore(
      Map<String, dynamic> firestore) {
    if (firestore['self'] != null) {
      self = new List<ApplicationClientPaymentGatewaySelf>();
      firestore['self'].forEach((v) {
        self.add(new ApplicationClientPaymentGatewaySelf.fromFirestore(v));
      });
    }
    if (firestore['collection'] != null) {
      collection = new List<ApplicationClientPaymentGatewayCollection>();
      firestore['collection'].forEach((v) {
        collection.add(
            new ApplicationClientPaymentGatewayCollection.fromFirestore(v));
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

class ApplicationClientPaymentGatewaySelf {
  String href;

  ApplicationClientPaymentGatewaySelf({this.href});

  ApplicationClientPaymentGatewaySelf.fromFirestore(
      Map<String, dynamic> firestore) {
    href = firestore['href'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['href'] = this.href;
    return data;
  }
}

class ApplicationClientPaymentGatewayCollection {
  String href;

  ApplicationClientPaymentGatewayCollection({this.href});

  ApplicationClientPaymentGatewayCollection.fromFirestore(
      Map<String, dynamic> firestore) {
    href = firestore['href'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['href'] = this.href;
    return data;
  }
}
