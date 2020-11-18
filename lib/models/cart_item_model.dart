class WooCartItem {
  String key;
  int id;
  int quantity;
  String name;
  String sku;
  String permalink;
  List<WooCartItemImages> images;
  String price;
  String linePrice;
  List<String> variation;

  WooCartItem(
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

  WooCartItem.fromFirestore(Map<String, dynamic> firestore) {
    key = firestore['key'];
    id = firestore['id'];
    quantity = firestore['quantity'];
    name = firestore['name'];
    sku = firestore['sku'];
    permalink = firestore['permalink'];
    if (firestore['images'] != null) {
      images = new List<WooCartItemImages>();
      firestore['images'].forEach((v) {
        images.add(new WooCartItemImages.fromFirestore(v));
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

  @override
  toString() => this.toMap().toString();
}

class WooCartItemImages {
  String id;
  String src;
  String thumbnail;
  bool srcset;
  String sizes;
  String name;
  String alt;

  WooCartItemImages(
      {this.id,
      this.src,
      this.thumbnail,
      this.srcset,
      this.sizes,
      this.name,
      this.alt});

  WooCartItemImages.fromFirestore(Map<String, dynamic> firestore) {
    id = firestore['id'].toString();
    src = firestore['src'];
    thumbnail = firestore['thumbnail'];

    if (firestore['srcset'] is String) {
      srcset = bool.fromEnvironment(firestore['srcset']);
    } else {
      srcset = firestore['srcset'];
    }
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
