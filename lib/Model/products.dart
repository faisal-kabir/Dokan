class Product {
  Product({
      this.id, 
      this.name, 
      this.slug, 
      this.postAuthor, 
      this.permalink, 
      this.dateCreated, 
      this.dateCreatedGmt, 
      this.dateModified, 
      this.dateModifiedGmt, 
      this.type, 
      this.status, 
      this.featured, 
      this.catalogVisibility, 
      this.description, 
      this.shortDescription, 
      this.sku, 
      this.price, 
      this.regularPrice, 
      this.salePrice, 
      this.dateOnSaleFrom, 
      this.dateOnSaleFromGmt, 
      this.dateOnSaleTo, 
      this.dateOnSaleToGmt, 
      this.priceHtml, 
      this.onSale, 
      this.purchasable, 
      this.totalSales, 
      this.virtual, 
      this.downloadable, 
      this.downloads, 
      this.downloadLimit, 
      this.downloadExpiry, 
      this.externalUrl, 
      this.buttonText, 
      this.taxStatus, 
      this.taxClass, 
      this.manageStock, 
      this.stockQuantity, 
      this.lowStockAmount, 
      this.inStock, 
      this.backorders, 
      this.backordersAllowed, 
      this.backordered, 
      this.soldIndividually, 
      this.weight, 
      this.dimensions, 
      this.shippingRequired, 
      this.shippingTaxable, 
      this.shippingClass, 
      this.shippingClassId, 
      this.reviewsAllowed, 
      this.averageRating, 
      this.ratingCount, 
      this.relatedIds, 
      this.upsellIds, 
      this.crossSellIds, 
      this.parentId, 
      this.purchaseNote, 
      this.categories, 
      this.tags, 
      this.images, 
      this.attributes, 
      this.defaultAttributes, 
      this.variations, 
      this.groupedProducts, 
      this.menuOrder,
      this.store,});

  Product.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    postAuthor = json['post_author'];
    permalink = json['permalink'];
    dateCreated = json['date_created'];
    dateCreatedGmt = json['date_created_gmt'];
    dateModified = json['date_modified'];
    dateModifiedGmt = json['date_modified_gmt'];
    type = json['type'];
    status = json['status'];
    featured = json['featured'];
    catalogVisibility = json['catalog_visibility'];
    description = json['description'];
    shortDescription = json['short_description'];
    sku = json['sku'];
    price = json['price'];
    regularPrice = json['regular_price'];
    salePrice = json['sale_price'];
    dateOnSaleFrom = json['date_on_sale_from'];
    dateOnSaleFromGmt = json['date_on_sale_from_gmt'];
    dateOnSaleTo = json['date_on_sale_to'];
    dateOnSaleToGmt = json['date_on_sale_to_gmt'];
    priceHtml = json['price_html'];
    onSale = json['on_sale'];
    purchasable = json['purchasable'];
    totalSales = json['total_sales'];
    virtual = json['virtual'];
    downloadable = json['downloadable'];
    if (json['downloads'] != null) {
      downloads = [];
      json['downloads'].forEach((v) {
        downloads?.add(Downloads.fromJson(v));
      });
    }
    downloadLimit = json['download_limit'];
    downloadExpiry = json['download_expiry'];
    externalUrl = json['external_url'];
    buttonText = json['button_text'];
    taxStatus = json['tax_status'];
    taxClass = json['tax_class'];
    manageStock = json['manage_stock'];
    stockQuantity = json['stock_quantity'];
    lowStockAmount = json['low_stock_amount'];
    inStock = json['in_stock'];
    backorders = json['backorders'];
    backordersAllowed = json['backorders_allowed'];
    backordered = json['backordered'];
    soldIndividually = json['sold_individually'];
    weight = json['weight'];
    dimensions = json['dimensions'] != null ? Dimensions.fromJson(json['dimensions']) : null;
    shippingRequired = json['shipping_required'];
    shippingTaxable = json['shipping_taxable'];
    shippingClass = json['shipping_class'];
    shippingClassId = json['shipping_class_id'];
    reviewsAllowed = json['reviews_allowed'];
    averageRating = json['average_rating'];
    ratingCount = json['rating_count'];
    relatedIds = json['related_ids'] != null ? json['related_ids'].cast<int>() : [];
    if (json['upsell_ids'] != null) {
      upsellIds = [];
      json['upsell_ids'].forEach((v) {
        upsellIds?.add(v);
      });
    }
    if (json['cross_sell_ids'] != null) {
      crossSellIds = [];
      json['cross_sell_ids'].forEach((v) {
        crossSellIds?.add(v);
      });
    }
    parentId = json['parent_id'];
    purchaseNote = json['purchase_note'];
    if (json['categories'] != null) {
      categories = [];
      json['categories'].forEach((v) {
        categories?.add(Categories.fromJson(v));
      });
    }
    if (json['tags'] != null) {
      tags = [];
      json['tags'].forEach((v) {
        tags?.add(v);
      });
    }
    if (json['images'] != null) {
      images = [];
      json['images'].forEach((v) {
        images?.add(Images.fromJson(v));
      });
    }
    if (json['attributes'] != null) {
      attributes = [];
      json['attributes'].forEach((v) {
        attributes?.add(v);
      });
    }
    if (json['default_attributes'] != null) {
      defaultAttributes = [];
      json['default_attributes'].forEach((v) {
        defaultAttributes?.add(v);
      });
    }
    if (json['variations'] != null) {
      variations = [];
      json['variations'].forEach((v) {
        variations?.add(v);
      });
    }
    if (json['grouped_products'] != null) {
      groupedProducts = [];
      json['grouped_products'].forEach((v) {
        groupedProducts?.add(v);
      });
    }
    menuOrder = json['menu_order'];
    store = json['store'] != null ? Store.fromJson(json['store']) : null;
  }
  int? id;
  String? name;
  String? slug;
  String? postAuthor;
  String? permalink;
  String? dateCreated;
  String? dateCreatedGmt;
  String? dateModified;
  String? dateModifiedGmt;
  String? type;
  String? status;
  bool? featured;
  String? catalogVisibility;
  String? description;
  String? shortDescription;
  String? sku;
  String? price;
  String? regularPrice;
  String? salePrice;
  dynamic dateOnSaleFrom;
  dynamic dateOnSaleFromGmt;
  dynamic dateOnSaleTo;
  dynamic dateOnSaleToGmt;
  String? priceHtml;
  bool? onSale;
  bool? purchasable;
  int? totalSales;
  bool? virtual;
  bool? downloadable;
  List<Downloads>? downloads;
  int? downloadLimit;
  int? downloadExpiry;
  String? externalUrl;
  String? buttonText;
  String? taxStatus;
  String? taxClass;
  bool? manageStock;
  dynamic stockQuantity;
  var lowStockAmount;
  bool? inStock;
  String? backorders;
  bool? backordersAllowed;
  bool? backordered;
  bool? soldIndividually;
  String? weight;
  Dimensions? dimensions;
  bool? shippingRequired;
  bool? shippingTaxable;
  String? shippingClass;
  int? shippingClassId;
  bool? reviewsAllowed;
  String? averageRating;
  int? ratingCount;
  List<int>? relatedIds;
  List<dynamic>? upsellIds;
  List<dynamic>? crossSellIds;
  int? parentId;
  String? purchaseNote;
  List<Categories>? categories;
  List<dynamic>? tags;
  List<Images>? images;
  List<dynamic>? attributes;
  List<dynamic>? defaultAttributes;
  List<dynamic>? variations;
  List<dynamic>? groupedProducts;
  int? menuOrder;
  Store? store;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['slug'] = slug;
    map['post_author'] = postAuthor;
    map['permalink'] = permalink;
    map['date_created'] = dateCreated;
    map['date_created_gmt'] = dateCreatedGmt;
    map['date_modified'] = dateModified;
    map['date_modified_gmt'] = dateModifiedGmt;
    map['type'] = type;
    map['status'] = status;
    map['featured'] = featured;
    map['catalog_visibility'] = catalogVisibility;
    map['description'] = description;
    map['short_description'] = shortDescription;
    map['sku'] = sku;
    map['price'] = price;
    map['regular_price'] = regularPrice;
    map['sale_price'] = salePrice;
    map['date_on_sale_from'] = dateOnSaleFrom;
    map['date_on_sale_from_gmt'] = dateOnSaleFromGmt;
    map['date_on_sale_to'] = dateOnSaleTo;
    map['date_on_sale_to_gmt'] = dateOnSaleToGmt;
    map['price_html'] = priceHtml;
    map['on_sale'] = onSale;
    map['purchasable'] = purchasable;
    map['total_sales'] = totalSales;
    map['virtual'] = virtual;
    map['downloadable'] = downloadable;
    if (downloads != null) {
      map['downloads'] = downloads?.map((v) => v.toJson()).toList();
    }
    map['download_limit'] = downloadLimit;
    map['download_expiry'] = downloadExpiry;
    map['external_url'] = externalUrl;
    map['button_text'] = buttonText;
    map['tax_status'] = taxStatus;
    map['tax_class'] = taxClass;
    map['manage_stock'] = manageStock;
    map['stock_quantity'] = stockQuantity;
    map['low_stock_amount'] = lowStockAmount;
    map['in_stock'] = inStock;
    map['backorders'] = backorders;
    map['backorders_allowed'] = backordersAllowed;
    map['backordered'] = backordered;
    map['sold_individually'] = soldIndividually;
    map['weight'] = weight;
    if (dimensions != null) {
      map['dimensions'] = dimensions?.toJson();
    }
    map['shipping_required'] = shippingRequired;
    map['shipping_taxable'] = shippingTaxable;
    map['shipping_class'] = shippingClass;
    map['shipping_class_id'] = shippingClassId;
    map['reviews_allowed'] = reviewsAllowed;
    map['average_rating'] = averageRating;
    map['rating_count'] = ratingCount;
    map['related_ids'] = relatedIds;
    if (upsellIds != null) {
      map['upsell_ids'] = upsellIds?.map((v) => v.toJson()).toList();
    }
    if (crossSellIds != null) {
      map['cross_sell_ids'] = crossSellIds?.map((v) => v.toJson()).toList();
    }
    map['parent_id'] = parentId;
    map['purchase_note'] = purchaseNote;
    if (categories != null) {
      map['categories'] = categories?.map((v) => v.toJson()).toList();
    }
    if (tags != null) {
      map['tags'] = tags?.map((v) => v.toJson()).toList();
    }
    if (images != null) {
      map['images'] = images?.map((v) => v.toJson()).toList();
    }
    if (attributes != null) {
      map['attributes'] = attributes?.map((v) => v.toJson()).toList();
    }
    if (defaultAttributes != null) {
      map['default_attributes'] = defaultAttributes?.map((v) => v.toJson()).toList();
    }
    if (variations != null) {
      map['variations'] = variations?.map((v) => v.toJson()).toList();
    }
    if (groupedProducts != null) {
      map['grouped_products'] = groupedProducts?.map((v) => v.toJson()).toList();
    }
    map['menu_order'] = menuOrder;
    if (store != null) {
      map['store'] = store?.toJson();
    }
    return map;
  }

}

class _links {
  _links({
      this.self, 
      this.collection,});

  _links.fromJson(dynamic json) {
    if (json['self'] != null) {
      self = [];
      json['self'].forEach((v) {
        self?.add(Self.fromJson(v));
      });
    }
    if (json['collection'] != null) {
      collection = [];
      json['collection'].forEach((v) {
        collection?.add(Collection.fromJson(v));
      });
    }
  }
  List<Self>? self;
  List<Collection>? collection;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (self != null) {
      map['self'] = self?.map((v) => v.toJson()).toList();
    }
    if (collection != null) {
      map['collection'] = collection?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Collection {
  Collection({
      this.href,});

  Collection.fromJson(dynamic json) {
    href = json['href'];
  }
  String? href;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['href'] = href;
    return map;
  }

}

class Self {
  Self({
      this.href,});

  Self.fromJson(dynamic json) {
    href = json['href'];
  }
  String? href;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['href'] = href;
    return map;
  }

}

class Store {
  Store({
      this.id, 
      this.name, 
      this.url, 
      this.avatar, 
      this.address,});

  Store.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    url = json['url'];
    avatar = json['avatar'];
    address = json['address'] != null ? Address.fromJson(json['address']) : null;
  }
  int? id;
  String? name;
  String? url;
  String? avatar;
  Address? address;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['url'] = url;
    map['avatar'] = avatar;
    if (address != null) {
      map['address'] = address?.toJson();
    }
    return map;
  }

}

class Address {
  Address({
      this.street1, 
      this.street2, 
      this.city, 
      this.zip, 
      this.country, 
      this.state,});

  Address.fromJson(dynamic json) {
    street1 = json['street_1'];
    street2 = json['street_2'];
    city = json['city'];
    zip = json['zip'];
    country = json['country'];
    state = json['state'];
  }
  String? street1;
  String? street2;
  String? city;
  String? zip;
  String? country;
  String? state;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['street_1'] = street1;
    map['street_2'] = street2;
    map['city'] = city;
    map['zip'] = zip;
    map['country'] = country;
    map['state'] = state;
    return map;
  }

}

class Images {
  Images({
      this.id, 
      this.dateCreated, 
      this.dateCreatedGmt, 
      this.dateModified, 
      this.dateModifiedGmt, 
      this.src, 
      this.name, 
      this.alt, 
      this.position,});

  Images.fromJson(dynamic json) {
    id = json['id'];
    dateCreated = json['date_created'];
    dateCreatedGmt = json['date_created_gmt'];
    dateModified = json['date_modified'];
    dateModifiedGmt = json['date_modified_gmt'];
    src = json['src'];
    name = json['name'];
    alt = json['alt'];
    position = json['position'];
  }
  int? id;
  String? dateCreated;
  String? dateCreatedGmt;
  String? dateModified;
  String? dateModifiedGmt;
  String? src;
  String? name;
  String? alt;
  int? position;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['date_created'] = dateCreated;
    map['date_created_gmt'] = dateCreatedGmt;
    map['date_modified'] = dateModified;
    map['date_modified_gmt'] = dateModifiedGmt;
    map['src'] = src;
    map['name'] = name;
    map['alt'] = alt;
    map['position'] = position;
    return map;
  }

}

class Categories {
  Categories({
      this.id, 
      this.name, 
      this.slug,});

  Categories.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
  }
  int? id;
  String? name;
  String? slug;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['slug'] = slug;
    return map;
  }

}

class Dimensions {
  Dimensions({
      this.length, 
      this.width, 
      this.height,});

  Dimensions.fromJson(dynamic json) {
    length = json['length'];
    width = json['width'];
    height = json['height'];
  }
  String? length;
  String? width;
  String? height;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['length'] = length;
    map['width'] = width;
    map['height'] = height;
    return map;
  }

}

class Downloads {
  Downloads({
      this.id, 
      this.name, 
      this.file,});

  Downloads.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    file = json['file'];
  }
  String? id;
  String? name;
  String? file;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['file'] = file;
    return map;
  }

}