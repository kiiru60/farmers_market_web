class ApplicationClientCart {
  String currency;
  int itemCount;
  List<ApplicationClientCartItems> items;
  bool needsShipping;
  String totalPrice;
  int totalWeight;

  ApplicationClientCart(
      {this.currency,
      this.itemCount,
      this.items,
      this.needsShipping,
      this.totalPrice,
      this.totalWeight});

  ApplicationClientCart.fromFirestore(Map<String, dynamic> firestore) {
    currency = firestore['currency'];
    itemCount = firestore['item_count'];
    if (firestore['items'] != null) {
      items = new List<ApplicationClientCartItems>();
      firestore['items'].forEach((v) {
        items.add(new ApplicationClientCartItems.fromFirestore(v));
      });
    }
    needsShipping = firestore['needs_shipping'];
    totalPrice = firestore['total_price'].toString();
    totalWeight = firestore['total_weight'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['currency'] = this.currency;
    data['item_count'] = this.itemCount;
    if (this.items != null) {
      data['items'] = this.items.map((v) => v.toMap()).toList();
    }
    data['needs_shipping'] = this.needsShipping;
    data['total_price'] = this.totalPrice;
    data['total_weight'] = this.totalWeight;
    return data;
  }

  @override
  toString() => this.toMap().toString();
}

class ApplicationClientCartItems {
  String key;
  int id;
  int quantity;
  String name;
  String sku;
  String permalink;
  List<ApplicationClientCartImages> images;
  String price;
  String linePrice;
  List<String> variation;

  ApplicationClientCartItems(
      {this.key,
      this.id,
      this.quantity,
      this.name,
      this.sku,
      this.permalink,
      this.images,
      this.price,
      this.linePrice,
      this.variation});

  ApplicationClientCartItems.fromFirestore(Map<String, dynamic> firestore) {
    key = firestore['key'];
    id = firestore['id'];
    quantity = firestore['quantity'];
    name = firestore['name'];
    sku = firestore['sku'];
    permalink = firestore['permalink'];
    if (firestore['images'] != null) {
      images = new List<ApplicationClientCartImages>();
      firestore['images'].forEach((v) {
        images.add(new ApplicationClientCartImages.fromFirestore(v));
      });
    }
    price = firestore['price'];
    linePrice = firestore['line_price'];
    variation = firestore['variation'].cast<String>();
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key'] = this.key;
    data['id'] = this.id;
    data['quantity'] = this.quantity;
    data['name'] = this.name;
    data['sku'] = this.sku;
    data['permalink'] = this.permalink;
    if (this.images != null) {
      data['images'] = this.images.map((v) => v.toMap()).toList();
    }
    data['price'] = this.price;
    data['line_price'] = this.linePrice;
    data['variation'] = this.variation;
    return data;
  }
}

class ApplicationClientCartImages {
  String id;
  String src;
  String thumbnail;
  String srcset;
  String sizes;
  String name;
  String alt;

  ApplicationClientCartImages(
      {this.id,
      this.src,
      this.thumbnail,
      this.srcset,
      this.sizes,
      this.name,
      this.alt});

  ApplicationClientCartImages.fromFirestore(Map<String, dynamic> firestore) {
    id = firestore['id'].toString();
    src = firestore['src'];
    thumbnail = firestore['thumbnail'];
    srcset = firestore['srcset'].toString();
    sizes = firestore['sizes'];
    name = firestore['name'];
    alt = firestore['alt'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['src'] = this.src;
    data['thumbnail'] = this.thumbnail;
    data['srcset'] = this.srcset;
    data['sizes'] = this.sizes;
    data['name'] = this.name;
    data['alt'] = this.alt;
    return data;
  }
}
