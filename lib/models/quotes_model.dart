/// First set starts here.
class DataModel {
  int? total, skip, limit;
  List<QuoteModel>? quotes;
  DataModel({this.total, this.skip, this.limit, this.quotes});

  factory DataModel.fromJson(Map<String, dynamic> json) {
    List<QuoteModel> kaam = [];

    /// instead of defining the type of list as List<Map<String, dynamic>>
    /// we need to write it as the List<dynamic> type. otherwise it may throw
    /// a type error at runtime, however we may try to do things otherwise
    List<dynamic> innerQ = json['quotes'];
    // innerQ.map((e) {
    //   kaam.add(QuoteModel.fromJson(e));
    // }).toList();

    for (var element in innerQ) {
      kaam.add(QuoteModel.fromJson(element));
    }

    return DataModel(
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
  int? total, skip, limit;
  List<Comments>? comments;
  SecondModel({this.total, this.skip, this.limit, this.comments});

  factory SecondModel.fromJson(Map<String, dynamic> json) {
    List<Comments> endList = [];
    List<dynamic> inside = json['comments'];
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
  UserInComments user;
  Comments(
      {required this.id,
      required this.postId,
      required this.body,
      required this.user});
  factory Comments.fromJson(Map<String, dynamic> json) {
    UserInComments inside = UserInComments.fromJson(json['user']);
    return Comments(
        id: json['id'],
        postId: json['postId'],
        body: json['body'],
        user: inside);
  }
}

class UserInComments {
  int id;
  String username;
  UserInComments({required this.id, required this.username});

  factory UserInComments.fromJson(Map<String, dynamic> json) {
    return UserInComments(id: json['id'], username: json['username']);
  }
}

/// Second set ends here.

/// Third set starts here.

class JsonPost {
  int? total, skip, limit;
  List<Post>? posts;
  JsonPost({this.total, this.skip, this.limit, this.posts});
  factory JsonPost.fromJson(Map<String, dynamic> json) {
    List<Post> endList = [];
    List<Map<String, dynamic>> inner =
        (json['posts']) as List<Map<String, dynamic>>;
    for (var element in inner) {
      endList.add(Post.fromJson(element));
    }
    return JsonPost(
        total: json['total'],
        skip: json['skip'],
        limit: json['limit'],
        posts: endList);
  }
}

class Post {
  int id, reactions;
  String title, body;
  List<String> tags;
  Post(
      {required this.id,
      required this.reactions,
      required this.title,
      required this.body,
      required this.tags});

  factory Post.fromJson(Map<String, dynamic> json) {
    // List<dynamic> inner  = json['tags'];
    // or
    // List<String> inner  = json['tags'];
    return Post(
        id: json['id'],
        reactions: json['reactions'],
        title: json['title'],
        body: json['body'],
        tags: (json['tags']) as List<String>);
  }
}

/// Third set ends here.

/// Forth set starts here

class ForthJson {
  List<Cart> carts;
  int total, skip, limit;
  ForthJson(
      {required this.carts,
      required this.total,
      required this.skip,
      required this.limit});

  factory ForthJson.fromJson(Map<String, dynamic> json) {
    List<Cart> endList = [];
    List<Map<String, dynamic>> inner = json['carts'];
    inner.map((eachMap) {
      endList.add(Cart.fromJson(eachMap));
    }).toList();
    return ForthJson(
        total: json['total'],
        skip: json['skip'],
        limit: json['limit'],
        carts: endList);
  }
}

class Cart {
  int id, userId;
  double discountedTotal, total, totalProducts, totalQuantity;
  List<Products> products;

  Cart(
      {required this.id,
      required this.userId,
      required this.discountedTotal,
      required this.total,
      required this.totalProducts,
      required this.totalQuantity,
      required this.products});

  factory Cart.fromJson(Map<String, dynamic> json) {
    List<Products> endList = [];
    List<Map<String, dynamic>> inner =
        json['products'] as List<Map<String, dynamic>>;

    // inner.forEach((eachMap){
    //    endList.add(Products.fromJson(eachMap));
    // });

    inner.map((eachMap) {
      endList.add(Products.fromJson(eachMap));
    }).toList();

    return Cart(
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

/// Fifth set starts here.

class User {
  int id, age;
  String firstName,
      lastName,
      maidenName,
      gender,
      email,
      phone,
      username,
      password,
      birthDate,
      image,
      bloodGroup,
      eyeColor,
      domain,
      ip,
      macAddress,
      university,
      ein,
      ssn,
      userAgent;
  double height, weight;
  Hair hair;
  Address address;
  Bank bank;
  Company company;
  User(
      {required this.id,
      required this.age,
      required this.birthDate,
      required this.bloodGroup,
      required this.height,
      required this.domain,
      required this.ein,
      required this.email,
      required this.eyeColor,
      required this.firstName,
      required this.lastName,
      required this.maidenName,
      required this.gender,
      required this.image,
      required this.ip,
      required this.macAddress,
      required this.password,
      required this.phone,
      required this.ssn,
      required this.university,
      required this.userAgent,
      required this.username,
      required this.weight,
      required this.address,
      required this.bank,
      required this.company,
      required this.hair});

  factory User.fromJson(Map<String, dynamic> json) {
    Address insideAddress = Address.fromJson(json['address']);
    Company insideCompany = Company.fromJson(json['company']);
    Bank insideBank = Bank.fromJson(json['bank']);
    Hair insideHair = Hair.fromJson(json['hair']);
    return User(
        id: json['id'],
        age: json['age'],
        birthDate: json['birthDate'],
        bloodGroup: json['bloodGroup'],
        domain: json['domain'],
        ein: json['ein'],
        email: json['email'],
        eyeColor: json['eyeColor'],
        firstName: json['firstName'],
        maidenName: json['maidenName'],
        lastName: json['lastName'],
        height: json['height'],
        weight: json['weight'],
        gender: json['gender'],
        image: json['image'],
        ip: json['ip'],
        macAddress: json['macAddress'],
        password: json['password'],
        phone: json['phone'],
        ssn: json['ssn'],
        username: json['username'],
        userAgent: json['userAgent'],
        university: json['university'],
        address: insideAddress,
        company: insideCompany,
        bank: insideBank,
        hair: insideHair);
  }
}

class Hair {
  String color, type;
  Hair({required this.color, required this.type});
  factory Hair.fromJson(Map<String, dynamic> json) {
    return Hair(color: json['color'], type: json['type']);
  }
}

class Address {
  String address, city, postalCode, state;
  Coordinate coordinate;
  Address(
      {required this.address,
      required this.city,
      required this.postalCode,
      required this.state,
      required this.coordinate});

  factory Address.fromJson(Map<String, dynamic> json) {
    Coordinate inner = Coordinate.fromJson(json['coordinate']);

    return Address(
        address: json['address'],
        city: json['city'],
        postalCode: json['postalCode'],
        state: json['state'],
        coordinate: inner);
  }
}

class Coordinate {
  double lat, long;

  Coordinate({required this.lat, required this.long});

  factory Coordinate.fromJson(Map<String, dynamic> json) {
    return Coordinate(lat: json['lat'], long: json['long']);
  }
}

class Bank {
  String cardExpire, cardNumber, cardType, currency, iban;
  Bank(
      {required this.cardExpire,
      required this.cardNumber,
      required this.cardType,
      required this.currency,
      required this.iban});

  factory Bank.fromJson(Map<String, dynamic> json) {
    return Bank(
        cardExpire: json['cardExpire'],
        cardNumber: json['cardNumber'],
        cardType: json['cardType'],
        currency: json['currency'],
        iban: json['iban']);
  }
}

class Company {
  String department, name, title;
  Address address;
  Company(
      {required this.department,
      required this.name,
      required this.title,
      required this.address});

  factory Company.fromJson(Map<String, dynamic> json) {
    Address innerAddress = Address.fromJson(json['address']);
    return Company(
        department: json['department'],
        name: json['name'],
        title: json['title'],
        address: innerAddress);
  }
}

/// fifth set ends here

Map<String, dynamic> categories = {
  'DataModel': 'https://dummyjson.com/quotes',
  'SecondModel': 'https://dummyjson.com/comments',
  'JsonPost': 'https://dummyjson.com/posts',
  'ForthJson': 'https://dummyjson.com/carts',
  'User': 'https://dummyjson.com/users'
};
