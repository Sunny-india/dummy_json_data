/// First set starts here.
class Data {
  int total, skip, limit;
  List<QuoteModel> quotes;
  Data(
      {required this.total,
      required this.skip,
      required this.limit,
      required this.quotes});
  factory Data.fromJson(Map<String, dynamic> json) {
    List<QuoteModel> kaam = [];
    List<Map<String, dynamic>> innerQ = json['quotes'];
    innerQ.map((e) {
      kaam.add(QuoteModel.fromJson(e));
    }).toList();
    return Data(
        total: json['total'],
        skip: json['skip'],
        limit: json['limit'],
        quotes: kaam);
  }
}

class QuoteModel {
  int id;
  String quote, author;
  QuoteModel({required this.id, required this.author, required this.quote});

  factory QuoteModel.fromJson(Map<String, dynamic> json) {
    return QuoteModel(
        id: json['id'], author: json['author'], quote: json['quote']);
  }
}

/// First set ends here.

/// Second set starts here.
class SecondModel {
  int total, skip, limit;
  List<Comments> comments;
  SecondModel(
      {required this.total,
      required this.skip,
      required this.limit,
      required this.comments});

  factory SecondModel.fromJson(Map<String, dynamic> json) {
    List<Comments> endList = [];
    List<Map<String, dynamic>> inside = json['comments'];
    inside.map((e) {
      endList.add(Comments.fromJson(e));
    }).toList();
    return SecondModel(
        total: json['total'],
        skip: json['skip'],
        limit: json['limit'],
        comments: endList);
  }
}

class Comments {
  int id, postId;
  String body;
  User user;
  Comments(
      {required this.id,
      required this.postId,
      required this.body,
      required this.user});
  factory Comments.fromJson(Map<String, dynamic> json) {
    User inside = User.fromJson(json['user']);
    return Comments(
        id: json['id'],
        postId: json['postId'],
        body: json['body'],
        user: inside);
  }
}

class User {
  int id;
  String username;
  User({required this.id, required this.username});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(id: json['id'], username: json['username']);
  }
}

/// Second set ends here.

/// Third set starts here.

class JsonPost {
  int total, skip, limit;
  List<Posts> posts;
  JsonPost(
      {required this.total,
      required this.skip,
      required this.limit,
      required this.posts});
  factory JsonPost.fromJson(Map<String, dynamic> json) {
    List<Posts> endList = [];
    List<Map<String, dynamic>> inner = json['posts'];
    inner.forEach((element) {
      endList.add(Posts.fromJson(element));
    });
    return JsonPost(
        total: json['total'],
        skip: json['skip'],
        limit: json['limit'],
        posts: endList);
  }
}

class Posts {
  int id, reactions;
  String title, body;
  List<String> tags;
  Posts(
      {required this.id,
      required this.reactions,
      required this.title,
      required this.body,
      required this.tags});

  factory Posts.fromJson(Map<String, dynamic> json) {
    // List<dynamic> inner  = json['tags'];
    // or
    // List<String> inner  = json['tags'];
    return Posts(
        id: json['id'],
        reactions: json['reactions'],
        title: json['title'],
        body: json['body'],
        tags: json['tags'] as List<String>);
  }
}

/// Third set ends here.

/// Forth set starts here

class ForthJson {
  List<Carts> carts;
  int total, skip, limit;
  ForthJson(
      {required this.carts,
      required this.total,
      required this.skip,
      required this.limit});

  factory ForthJson.fromJson(Map<String, dynamic> json) {
    List<Carts> endList = [];
    List<Map<String, dynamic>> inner = json['carts'];
    inner.map((eachMap) {
      endList.add(Carts.fromJson(eachMap));
    }).toList();
    return ForthJson(
        total: json['total'],
        skip: json['skip'],
        limit: json['limit'],
        carts: endList);
  }
}

class Carts {
  int id, userId;
  double discountedTotal, total, totalProducts, totalQuantity;
  List<Products> products;

  Carts(
      {required this.id,
      required this.userId,
      required this.discountedTotal,
      required this.total,
      required this.totalProducts,
      required this.totalQuantity,
      required this.products});

  factory Carts.fromJson(Map<String, dynamic> json) {
    List<Products> endList = [];
    List<Map<String, dynamic>> inner =
        json['products'] as List<Map<String, dynamic>>;

    // inner.forEach((eachMap){
    //    endList.add(Products.fromJson(eachMap));
    // });

    inner.map((eachMap) {
      endList.add(Products.fromJson(eachMap));
    }).toList();

    return Carts(
        id: json['id'],
        userId: json['userId'],
        discountedTotal: json['discountedTotal'],
        total: json['total'],
        totalProducts: json[''],
        totalQuantity: json['totalQuantity'],
        products: endList);
  }
}

class Products {
  int id;
  double price, quantity, total, discountedPrice, discountPercentage;
  String title;
  Products(
      {required this.id,
      required this.total,
      required this.title,
      required this.discountedPrice,
      required this.discountPercentage,
      required this.price,
      required this.quantity});

  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
        id: json['id'],
        total: json['total'],
        title: json['title'],
        discountedPrice: json['discountedPrice'],
        discountPercentage: json['discountPercentage'],
        price: json['price'],
        quantity: json['quantity']);
  }
}

/// Forth set ends here .
