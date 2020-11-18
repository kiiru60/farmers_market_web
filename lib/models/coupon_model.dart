class ApplicationCustomerCoupon {
  int id;
  String code;
  String amount;
  DateTime dateCreated;
  DateTime dateCreatedGmt;
  DateTime dateModified;
  DateTime dateModifiedGmt;
  String discountType;
  String description;
  String dateExpires;
  String dateExpiresGmt;
  int usageCount;
  bool individualUse;
  List<int> productIds;
  List<int> excludedProductIds;
  int usageLimit;
  int usageLimitPerUser;
  int limitUsageToXItems;
  bool freeShipping;
  List<int> productCategories;
  List<int> excludedProductCategories;
  bool excludeSaleItems;
  String minimumAmount;
  String maximumAmount;
  List<String> emailRestrictions;
  List<String> usedBy;
  List<String> metaData;
  ApplicationCustomerCouponLinks lLinks;

  ApplicationCustomerCoupon(
      {this.id,
      this.code,
      this.amount,
      this.dateCreated,
      this.dateCreatedGmt,
      this.dateModified,
      this.dateModifiedGmt,
      this.discountType,
      this.description,
      this.dateExpires,
      this.dateExpiresGmt,
      this.usageCount,
      this.individualUse,
      this.productIds,
      this.excludedProductIds,
      this.usageLimit,
      this.usageLimitPerUser,
      this.limitUsageToXItems,
      this.freeShipping,
      this.productCategories,
      this.excludedProductCategories,
      this.excludeSaleItems,
      this.minimumAmount,
      this.maximumAmount,
      this.emailRestrictions,
      this.usedBy,
      this.metaData,
      this.lLinks});

  ApplicationCustomerCoupon.fromFirestore(Map<String, dynamic> firestore) {
    id = firestore['id'];
    code = firestore['code'];
    amount = firestore['amount'];
    dateCreated = firestore['date_created'];
    dateCreatedGmt = firestore['date_created_gmt'];
    dateModified = firestore['date_modified'];
    dateModifiedGmt = firestore['date_modified_gmt'];
    discountType = firestore['discount_type'];
    description = firestore['description'];
    dateExpires = firestore['date_expires'];
    dateExpiresGmt = firestore['date_expires_gmt'];
    usageCount = firestore['usage_count'];
    individualUse = firestore['individual_use'];
    productIds = firestore['product_ids'].cast<int>();
    excludedProductIds = firestore['excluded_product_ids'].cast<int>();
    usageLimit = firestore['usage_limit'];
    usageLimitPerUser = firestore['usage_limit_per_user'];
    limitUsageToXItems = firestore['limit_usage_to_x_items'];
    freeShipping = firestore['free_shipping'];
    productCategories = firestore['product_categories'].cast<int>();
    excludedProductCategories =
        firestore['excluded_product_categories'].cast<int>();
    excludeSaleItems = firestore['exclude_sale_items'];
    minimumAmount = firestore['minimum_amount'];
    maximumAmount = firestore['maximum_amount'];
    emailRestrictions = firestore['email_restrictions'].cast<String>();
    usedBy = firestore['used_by'].cast<String>();
    metaData = firestore['meta_data'].cast<String>();
    lLinks = firestore['_links'] != null
        ? new ApplicationCustomerCouponLinks.fromFirestore(firestore['_links'])
        : null;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['amount'] = this.amount;
    data['date_created'] = this.dateCreated;
    data['date_created_gmt'] = this.dateCreatedGmt;
    data['date_modified'] = this.dateModified;
    data['date_modified_gmt'] = this.dateModifiedGmt;
    data['discount_type'] = this.discountType;
    data['description'] = this.description;
    data['date_expires'] = this.dateExpires;
    data['date_expires_gmt'] = this.dateExpiresGmt;
    data['usage_count'] = this.usageCount;
    data['individual_use'] = this.individualUse;
    data['product_ids'] = this.productIds;
    data['excluded_product_ids'] = this.excludedProductIds;
    data['usage_limit'] = this.usageLimit;
    data['usage_limit_per_user'] = this.usageLimitPerUser;
    data['limit_usage_to_x_items'] = this.limitUsageToXItems;
    data['free_shipping'] = this.freeShipping;
    data['product_categories'] = this.productCategories;
    data['excluded_product_categories'] = this.excludedProductCategories;
    data['exclude_sale_items'] = this.excludeSaleItems;
    data['minimum_amount'] = this.minimumAmount;
    data['maximum_amount'] = this.maximumAmount;
    data['email_restrictions'] = this.emailRestrictions;
    data['used_by'] = this.usedBy;
    data['meta_data'] = this.metaData;
    if (this.lLinks != null) {
      data['_links'] = this.lLinks.toMap();
    }
    return data;
  }

  @override
  toString() => this.toMap().toString();
}

class ApplicationCustomerCouponLinks {
  List<Self> self;
  List<Collection> collection;

  ApplicationCustomerCouponLinks({this.self, this.collection});

  ApplicationCustomerCouponLinks.fromFirestore(Map<String, dynamic> firestore) {
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

class CouponMetadata {
  int id;
  String key;
  String value;

  CouponMetadata({this.key, this.value});

  CouponMetadata.fromFirestore(dynamic firestore) {
    this.id = firestore['id'];
    this.key = firestore['key'];
    this.value = firestore['value'];
  }

  Map<String, dynamic> toMap() {
    return {
      "key": this.key,
      "value": this.value,
    };
  }
}
