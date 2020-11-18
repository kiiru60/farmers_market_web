import 'package:flutter/material.dart';

class ApplicationClientOrder {
  int id;
  int parentId;
  String number;
  String orderKey;
  String createdVia;
  String version;
  String status;
  String currency;
  String dateCreated;
  String dateCreatedGmt;
  String dateModified;
  String dateModifiedGmt;
  String discountTotal;
  String discountTax;
  String shippingTotal;
  String shippingTax;
  String cartTax;
  String total;
  String totalTax;
  bool pricesIncludeTax;
  int customerId;
  String customerIpAddress;
  String customerUserAgent;
  String customerNote;
  Billing billing;
  Shipping shipping;
  String paymentMethod;
  String paymentMethodTitle;
  String transactionId;
  String datePaid;
  String datePaidGmt;
  String dateCompleted;
  String dateCompletedGmt;
  String cartHash;
  List<MetaData> metaData;
  List<LineItems> lineItems;
  List<TaxLines> taxLines;
  List<ShippingLines> shippingLines;
  List<ApplicationClientOrderFeeLine> feeLines;
  List<ApplicationClientOrderCouponLine> couponLines;
  List<Refunds> refunds;
  Links links;

  ApplicationClientOrder(
      {@required this.id,
      this.parentId,
      this.number,
      this.orderKey,
      this.createdVia,
      this.version,
      this.status,
      this.currency,
      this.dateCreated,
      this.dateCreatedGmt,
      this.dateModified,
      this.dateModifiedGmt,
      this.discountTotal,
      this.discountTax,
      this.shippingTotal,
      this.shippingTax,
      this.cartTax,
      this.total,
      this.totalTax,
      this.pricesIncludeTax,
      this.customerId,
      this.customerIpAddress,
      this.customerUserAgent,
      this.customerNote,
      this.billing,
      this.shipping,
      this.paymentMethod,
      this.paymentMethodTitle,
      this.transactionId,
      this.datePaid,
      this.datePaidGmt,
      this.dateCompleted,
      this.dateCompletedGmt,
      this.cartHash,
      this.metaData,
      this.lineItems,
      this.taxLines,
      this.shippingLines,
      this.feeLines,
      this.couponLines,
      this.refunds,
      this.links})
      : assert(id != null);

  ApplicationClientOrder.fromFirestore(Map<String, dynamic> firestore) {
    id = firestore['id'];
    parentId = firestore['parent_id'];
    number = firestore['number'];
    orderKey = firestore['order_key'];
    createdVia = firestore['created_via'];
    version = firestore['version'];
    status = firestore['status'];
    currency = firestore['currency'];
    dateCreated = firestore['date_created'];
    dateCreatedGmt = firestore['date_created_gmt'];
    dateModified = firestore['date_modified'];
    dateModifiedGmt = firestore['date_modified_gmt'];
    discountTotal = firestore['discount_total'];
    discountTax = firestore['discount_tax'];
    shippingTotal = firestore['shipping_total'];
    shippingTax = firestore['shipping_tax'];
    cartTax = firestore['cart_tax'];
    total = firestore['total'];
    totalTax = firestore['total_tax'];
    pricesIncludeTax = firestore['prices_include_tax'];
    customerId = firestore['customer_id'];
    customerIpAddress = firestore['customer_ip_address'];
    customerUserAgent = firestore['customer_user_agent'];
    customerNote = firestore['customer_note'];
    billing = firestore['billing'] != null
        ? new Billing.fromFirestore(firestore['billing'])
        : null;
    shipping = firestore['shipping'] != null
        ? new Shipping.fromFirestore(firestore['shipping'])
        : null;
    paymentMethod = firestore['payment_method'];
    paymentMethodTitle = firestore['payment_method_title'];
    transactionId = firestore['transaction_id'];
    datePaid = firestore['date_paid'];
    datePaidGmt = firestore['date_paid_gmt'];
    dateCompleted = firestore['date_completed'];
    dateCompletedGmt = firestore['date_completed_gmt'];
    cartHash = firestore['cart_hash'];
    metaData = (firestore['meta_data'] as List)
        .map((i) => MetaData.fromFirestore(i))
        .toList();
    if (firestore['line_items'] != null) {
      lineItems = new List<LineItems>();
      firestore['line_items'].forEach((v) {
        lineItems.add(new LineItems.fromFirestore(v));
      });
    }
    if (firestore['tax_lines'] != null) {
      taxLines = new List<TaxLines>();
      firestore['tax_lines'].forEach((v) {
        taxLines.add(new TaxLines.fromFirestore(v));
      });
    }
    if (firestore['shipping_lines'] != null) {
      shippingLines = new List<ShippingLines>();
      firestore['shipping_lines'].forEach((v) {
        shippingLines.add(new ShippingLines.fromFirestore(v));
      });
    }
    if (firestore['fee_lines'] != null) {
      feeLines = new List<ApplicationClientOrderFeeLine>();
      firestore['fee_lines'].forEach((v) {
        feeLines.add(new ApplicationClientOrderFeeLine.fromFirestore(v));
      });
    }
    if (firestore['coupon_lines'] != null) {
      couponLines = new List<ApplicationClientOrderCouponLine>();
      firestore['coupon_lines'].forEach((v) {
        couponLines.add(new ApplicationClientOrderCouponLine.fromFirestore(v));
      });
    }

    if (firestore['refunds'] != null) {
      refunds = new List<Refunds>();
      firestore['refunds'].forEach((v) {
        refunds.add(new Refunds.fromFirestore(v));
      });
    }
    links = firestore['_links'] != null
        ? new Links.fromFirestore(firestore['_links'])
        : null;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['parent_id'] = this.parentId;
    data['number'] = this.number;
    data['order_key'] = this.orderKey;
    data['created_via'] = this.createdVia;
    data['version'] = this.version;
    data['status'] = this.status;
    data['currency'] = this.currency;
    data['date_created'] = this.dateCreated;
    data['date_created_gmt'] = this.dateCreatedGmt;
    data['date_modified'] = this.dateModified;
    data['date_modified_gmt'] = this.dateModifiedGmt;
    data['discount_total'] = this.discountTotal;
    data['discount_tax'] = this.discountTax;
    data['shipping_total'] = this.shippingTotal;
    data['shipping_tax'] = this.shippingTax;
    data['cart_tax'] = this.cartTax;
    data['total'] = this.total;
    data['total_tax'] = this.totalTax;
    data['prices_include_tax'] = this.pricesIncludeTax;
    data['customer_id'] = this.customerId;
    data['customer_ip_address'] = this.customerIpAddress;
    data['customer_user_agent'] = this.customerUserAgent;
    data['customer_note'] = this.customerNote;
    if (this.billing != null) {
      data['billing'] = this.billing.toMap();
    }
    if (this.shipping != null) {
      data['shipping'] = this.shipping.toMap();
    }
    data['payment_method'] = this.paymentMethod;
    data['payment_method_title'] = this.paymentMethodTitle;
    data['transaction_id'] = this.transactionId;
    data['date_paid'] = this.datePaid;
    data['date_paid_gmt'] = this.datePaidGmt;
    data['date_completed'] = this.dateCompleted;
    data['date_completed_gmt'] = this.dateCompletedGmt;
    data['cart_hash'] = this.cartHash;
    if (this.metaData != null) {
      data['meta_data'] = this.metaData.map((v) => v.toMap()).toList();
    }
    if (this.lineItems != null) {
      data['line_items'] = this.lineItems.map((v) => v.toMap()).toList();
    }
    if (this.taxLines != null) {
      data['tax_lines'] = this.taxLines.map((v) => v.toMap()).toList();
    }
    if (this.shippingLines != null) {
      data['shipping_lines'] =
          this.shippingLines.map((v) => v.toMap()).toList();
    }
    if (this.feeLines != null) {
      data['fee_lines'] = this.feeLines.map((v) => v.toMap()).toList();
    }
    if (this.couponLines != null) {
      data['coupon_lines'] = this.couponLines.map((v) => v.toMap()).toList();
    }

    if (this.refunds != null) {
      data['refunds'] = this.refunds.map((v) => v.toMap()).toList();
    }
    if (this.links != null) {
      data['_links'] = this.links.toMap();
    }
    return data;
  }

  @override
  toString() => this.toMap().toString();
}

class ApplicationClientOrderCouponLine {
  int id;
  String code;
  String discount;
  String discountTax;
  List<MetaData> metaData;

  ApplicationClientOrderCouponLine(
      this.id, this.code, this.discount, this.discountTax, this.metaData);

  ApplicationClientOrderCouponLine.fromFirestore(Map<String, dynamic> firestore)
      : id = firestore['id'],
        code = firestore['code'],
        discount = firestore['discount'],
        discountTax = firestore['discount_tax'],
        metaData = (firestore['meta_data'] as List)
            .map((i) => MetaData.fromFirestore(i))
            .toList();

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['discount'] = this.discount;
    data['discount_tax'] = this.discountTax;
    data['meta_data'] = this.metaData.map((v) => v.toMap()).toList();
    return data;
  }
}

class ApplicationClientOrderFeeLine {
  int id;
  String name;
  String taxClass;
  String taxStatus;
  String total;
  String totalTax;
  List<FeeLineTax> taxes;
  List<MetaData> metaData;

  ApplicationClientOrderFeeLine(this.id, this.name, this.taxClass,
      this.taxStatus, this.totalTax, this.taxes, this.metaData);

  ApplicationClientOrderFeeLine.fromFirestore(Map<String, dynamic> firestore)
      : id = firestore['id'],
        name = firestore['name'],
        taxClass = firestore['tax_class'],
        taxStatus = firestore['tax_status'],
        total = firestore['total'],
        totalTax = firestore['total_tax'],
        taxes = (firestore['taxes'] as List)
            .map((i) => FeeLineTax.fromFirestore(i))
            .toList(),
        metaData = (firestore['meta_data'] as List)
            .map((i) => MetaData.fromFirestore(i))
            .toList();

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['tax_class'] = this.taxClass;
    data['tax_status'] = this.taxStatus;
    data['total'] = this.total;
    data['total_tax'] = this.totalTax;
    data['taxes'] = this.taxes;
    data['meta_data'] = this.metaData.map((v) => v.toMap()).toList();
    return data;
  }
}

class FeeLineTax {
  int id;
  String rateCode;
  String rateId;
  String label;
  bool compound;
  String taxTotal;
  String shippingTaxTotal;
  List<MetaData> metaData;

  FeeLineTax(this.id, this.rateCode, this.rateId, this.label, this.compound,
      this.taxTotal, this.shippingTaxTotal, this.metaData);

  FeeLineTax.fromFirestore(Map<String, dynamic> firestore) {
    id = firestore['id'];
    rateCode = firestore['rate_code'];
    rateId = firestore['rate_id'];
    label = firestore['label'];
    compound = firestore['compound'];
    taxTotal = firestore['tax_total'];
    shippingTaxTotal = firestore['shipping_tax_total'];
    if (firestore['meta_data'] != null) {
      metaData = (firestore['meta_data'] as List)
          .map((i) => MetaData.fromFirestore(i))
          .toList();
    }
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['rate_id'] = this.rateId;
    data['rate_code'] = this.rateCode;
    data['label'] = this.label;
    data['compound'] = this.compound;
    data['tax_total'] = this.taxTotal;
    data['shipping_tax_total'] = this.shippingTaxTotal;
    data['meta_data'] = this.metaData;
    return data;
  }
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

class MetaData {
  int id;
  String key;
  String value;

  MetaData({this.id, this.key, this.value});

  MetaData.fromFirestore(Map<String, dynamic> firestore) {
    id = firestore['id'];
    key = firestore['key'];
    value = firestore['value'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['key'] = this.key;
    data['value'] = this.value;
    return data;
  }
}

class Refunds {
  int id;
  String reason;
  String total;

  Refunds({this.id, this.reason, this.total});

  Refunds.fromFirestore(Map<String, dynamic> firestore) {
    id = firestore['id'];
    reason = firestore['reason'];
    total = firestore['total'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['reason'] = this.reason;
    data['total'] = this.total;
    return data;
  }
}

class LineItems {
  int id;
  String name;
  int productId;
  int variationId;
  int quantity;
  String taxClass;
  String subtotal;
  String subtotalTax;
  String total;
  String totalTax;
  List<Taxes> taxes;
  List<MetaData> metaData;
  String sku;
  String price;

  LineItems(
      {this.id,
      this.name,
      this.productId,
      this.variationId,
      this.quantity,
      this.taxClass,
      this.subtotal,
      this.subtotalTax,
      this.total,
      this.totalTax,
      this.taxes,
      this.metaData,
      this.sku,
      this.price});

  LineItems.fromFirestore(Map<String, dynamic> firestore) {
    id = firestore['id'];
    name = firestore['name'];
    productId = firestore['product_id'];
    variationId = firestore['variation_id'];
    quantity = firestore['quantity'];
    taxClass = firestore['tax_class'];
    subtotal = firestore['subtotal'];
    subtotalTax = firestore['subtotal_tax'];
    total = firestore['total'];
    totalTax = firestore['total_tax'];
    taxes = (firestore['taxes'] as List)
        .map((i) => Taxes.fromFirestore(i))
        .toList();
    metaData = (firestore['meta_data'] as List)
        .map((i) => MetaData.fromFirestore(i))
        .toList();
    sku = firestore['sku'];
    price = firestore['price'].toString();
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['product_id'] = this.productId;
    data['variation_id'] = this.variationId;
    data['quantity'] = this.quantity;
    data['tax_class'] = this.taxClass;
    data['subtotal'] = this.subtotal;
    data['subtotal_tax'] = this.subtotalTax;
    data['total'] = this.total;
    data['total_tax'] = this.totalTax;
    if (this.taxes != null) {
      data['taxes'] = this.taxes.map((v) => v.toMap()).toList();
    }
    if (this.metaData != null) {
      data['meta_data'] = this.metaData.map((v) => v.toMap()).toList();
    }
    data['sku'] = this.sku;
    data['price'] = this.price;
    return data;
  }

  @override
  toString() => this.toMap().toString();
}

class Taxes {
  int id;
  String total;
  String subtotal;

  Taxes({this.id, this.total, this.subtotal});

  Taxes.fromFirestore(Map<String, dynamic> firestore) {
    id = firestore['id'];
    total = firestore['total'];
    subtotal = firestore['subtotal'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['total'] = this.total;
    data['subtotal'] = this.subtotal;
    return data;
  }
}

class TaxLines {
  int id;
  String rateCode;
  int rateId;
  String label;
  bool compound;
  String taxTotal;
  String shippingTaxTotal;
  List<MetaData> metaData;

  TaxLines(
      {this.id,
      this.rateCode,
      this.rateId,
      this.label,
      this.compound,
      this.taxTotal,
      this.shippingTaxTotal,
      this.metaData});

  TaxLines.fromFirestore(Map<String, dynamic> firestore) {
    id = firestore['id'];
    rateCode = firestore['rate_code'];
    rateId = firestore['rate_id'];
    label = firestore['label'];
    compound = firestore['compound'];
    taxTotal = firestore['tax_total'];
    shippingTaxTotal = firestore['shipping_tax_total'];
    metaData = (firestore['meta_data'] as List)
        .map((i) => MetaData.fromFirestore(i))
        .toList();
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['rate_code'] = this.rateCode;
    data['rate_id'] = this.rateId;
    data['label'] = this.label;
    data['compound'] = this.compound;
    data['tax_total'] = this.taxTotal;
    data['shipping_tax_total'] = this.shippingTaxTotal;
    if (this.metaData != null) {
      data['meta_data'] = this.metaData.map((v) => v.toMap()).toList();
    }
    return data;
  }
}

class ShippingLines {
  int id;
  String methodTitle;
  String methodId;
  String total;
  String totalTax;
  List<Taxes> taxes;
  List<MetaData> metaData;

  ShippingLines(
      {this.id,
      this.methodTitle,
      this.methodId,
      this.total,
      this.totalTax,
      this.taxes,
      this.metaData});

  ShippingLines.fromFirestore(Map<String, dynamic> firestore) {
    id = firestore['id'];
    methodTitle = firestore['method_title'];
    methodId = firestore['method_id'];
    total = firestore['total'];
    totalTax = firestore['total_tax'];

    taxes = (firestore['taxes'] as List)
        .map((i) => Taxes.fromFirestore(i))
        .toList();
    metaData = (firestore['meta_data'] as List)
        .map((i) => MetaData.fromFirestore(i))
        .toList();
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['method_title'] = this.methodTitle;
    data['method_id'] = this.methodId;
    data['total'] = this.total;
    data['total_tax'] = this.totalTax;
    if (this.taxes != null) {
      data['taxes'] = this.taxes.map((v) => v.toMap()).toList();
    }
    if (this.metaData != null) {
      data['meta_data'] = this.metaData.map((v) => v.toMap()).toList();
    }
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
