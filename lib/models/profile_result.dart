
import 'package:Test/utils/constants.dart';

class ProfileModel {
  String status;
  Data data;

  ProfileModel({this.status, this.data});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  Profile profile;
  bool fcmMatch;

  Data({this.profile, this.fcmMatch});

  Data.fromJson(Map<String, dynamic> json) {
    profile =
    json['profile'] != null ? new Profile.fromJson(json['profile']) : null;
    fcmMatch = json['fcm_match'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.profile != null) {
      data['profile'] = this.profile.toJson();
    }
    data['fcm_match'] = this.fcmMatch;
    return data;
  }
}

class Profile {
  Location location;
  String name;
  String profilePicture;
  String gender;
  int age;
  String socketId;
  String friendshipSocketId;
  String bio;
  String customerId;
  String subscriptionId;
  bool isBoosted;
  int count;
  String boostExp;
  bool boostPaid;
  String premiumExp;
  Null isGlobal;
  bool isDating;
  String jobTitle;
  List<String> likes;
  List<Interests> interests;
  bool isPremium;
  String currency;
  String sId;
  List<BasicInfo> basicInfo;
  List<Filters> filters;
  String birthday;
  String user;
  List<Photos> photos;
  String date;
  int iV;
  List<Media> media;
  String id;

  Profile(
      {this.location,
        this.name,
        this.profilePicture,
        this.gender,
        this.age,
        this.socketId,
        this.friendshipSocketId,
        this.bio,
        this.customerId,
        this.subscriptionId,
        this.isBoosted,
        this.count,
        this.boostExp,
        this.boostPaid,
        this.premiumExp,
        this.isGlobal,
        this.isDating,
        this.jobTitle,
        this.likes,
        this.interests,
        this.isPremium,
        this.currency,
        this.sId,
        this.basicInfo,
        this.filters,
        this.birthday,
        this.user,
        this.photos,
        this.date,
        this.iV,
        this.media,
        this.id});

  Profile.fromJson(Map<String, dynamic> json) {
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    name = json['name'];
    profilePicture = json['profile_picture'];
    gender = json['gender'];
    age = json['age'];
    socketId = json['socket_id'];
    friendshipSocketId = json['friendship_socket_id'];
    bio = json['bio'];
    customerId = json['customer_id'];
    subscriptionId = json['subscription_id'];
    isBoosted = json['is_boosted'];
    count = json['count'];
    boostExp = json['boost_exp'];
    boostPaid = json['boost_paid'];
    premiumExp = json['premium_exp'];
    isGlobal = json['is_global'];
    isDating = json['is_dating'];
    jobTitle = json['job_title'];
    likes = json['likes'].cast<String>();
    if (json['interests'] != null) {
      interests = new List<Interests>();
      json['interests'].forEach((v) {
        interests.add(new Interests.fromJson(v));
      });
    }
    isPremium = json['is_premium'];
    currency = json['currency'];
    sId = json['_id'];
    if (json['basic_info'] != null) {
      basicInfo = new List<BasicInfo>();
      json['basic_info'].forEach((v) {
        basicInfo.add(new BasicInfo.fromJson(v));
      });
    }
    if (json['filters'] != null) {
      filters = new List<Filters>();
      json['filters'].forEach((v) {
        filters.add(new Filters.fromJson(v));
      });
    }
    birthday = json['birthday'];
    user = json['user'];
    if (json['photos'] != null) {
      photos = new List<Photos>();
      json['photos'].forEach((v) {
        photos.add(new Photos.fromJson(v));
      });
    }
    date = json['date'];
    iV = json['__v'];
    if (json['media'] != null) {
      media = new List<Media>();
      json['media'].forEach((v) {
        media.add(new Media.fromJson(v));
      });
    }
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.location != null) {
      data['location'] = this.location.toJson();
    }
    data['name'] = this.name;
    data['profile_picture'] = this.profilePicture;
    data['gender'] = this.gender;
    data['age'] = this.age;
    data['socket_id'] = this.socketId;
    data['friendship_socket_id'] = this.friendshipSocketId;
    data['bio'] = this.bio;
    data['customer_id'] = this.customerId;
    data['subscription_id'] = this.subscriptionId;
    data['is_boosted'] = this.isBoosted;
    data['count'] = this.count;
    data['boost_exp'] = this.boostExp;
    data['boost_paid'] = this.boostPaid;
    data['premium_exp'] = this.premiumExp;
    data['is_global'] = this.isGlobal;
    data['is_dating'] = this.isDating;
    data['job_title'] = this.jobTitle;
    data['likes'] = this.likes;
    if (this.interests != null) {
      data['interests'] = this.interests.map((v) => v.toJson()).toList();
    }
    data['is_premium'] = this.isPremium;
    data['currency'] = this.currency;
    data['_id'] = this.sId;
    if (this.basicInfo != null) {
      data['basic_info'] = this.basicInfo.map((v) => v.toJson()).toList();
    }
    if (this.filters != null) {
      data['filters'] = this.filters.map((v) => v.toJson()).toList();
    }
    data['birthday'] = this.birthday;
    data['user'] = this.user;
    if (this.photos != null) {
      data['photos'] = this.photos.map((v) => v.toJson()).toList();
    }
    data['date'] = this.date;
    data['__v'] = this.iV;
    if (this.media != null) {
      data['media'] = this.media.map((v) => v.toJson()).toList();
    }
    data['id'] = this.id;
    return data;
  }
}

class Location {
  String type;
  List<double> coordinates;

  Location({this.type, this.coordinates});

  Location.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    coordinates = json['coordinates'].cast<double>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['coordinates'] = this.coordinates;
    return data;
  }
}

class Interests {
  bool flag;
  String sId;
  String name;
  String date;
  String slug;
  int iV;
  String image;

  Interests(
      {this.flag,
        this.sId,
        this.name,
        this.date,
        this.slug,
        this.iV,
        this.image});

  Interests.fromJson(Map<String, dynamic> json) {
    flag = json['flag'];
    sId = json['_id'];
    name = json['name'];
    date = json['date'];
    slug = json['slug'];
    iV = json['__v'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['flag'] = this.flag;
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['date'] = this.date;
    data['slug'] = this.slug;
    data['__v'] = this.iV;
    data['image'] = this.image;
    return data;
  }

  String getInteresetPhoto() {
    if (image == null) return null;
    return "${Constants.BASE_URL_IMAGE}$image";
  }
}


class BasicInfo {
  bool premium;
  String sId;
  String value;
  Keys keys;

  BasicInfo({this.premium, this.sId, this.value});

  BasicInfo.fromJson(Map<String, dynamic> json) {
    premium = json['premium'];
    sId = json['_id'];
    value = json['value'];
    keys = json['key'] != null ? new Keys.fromJson(json['key']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['premium'] = this.premium;
    data['_id'] = this.sId;
    if (this.keys != null) {
      data['key'] = this.keys.toJson();
    }
    data['value'] = this.value;
    return data;
  }
}

class Keys {
  String sId;
  String name;
  String selection;

  Keys({this.sId, this.name, this.selection});

  Keys.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    selection = json['selection'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['selection'] = this.selection;
    return data;
  }
}

class Filters {
  bool premium;
  String sId;
  String value;
  String type;
  String selection;
  String range;

  Filters(
      {this.premium,
        this.sId,
        this.value,
        this.type,
        this.selection,
        this.range});

  Filters.fromJson(Map<String, dynamic> json) {
    premium = json['premium'];
    sId = json['_id'];
    value = json['value'];
    type = json['type'];
    selection = json['selection'];
    range = json['range'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['premium'] = this.premium;
    data['_id'] = this.sId;

    data['value'] = this.value;
    data['type'] = this.type;
    data['selection'] = this.selection;
    data['range'] = this.range;
    return data;
  }
}

class Photos {
  String filename;
  String comment;
  int index;
  bool isVideo;
  String sId;

  Photos({this.filename, this.comment, this.index, this.isVideo, this.sId});

  Photos.fromJson(Map<String, dynamic> json) {
    filename = json['filename'];
    comment = json['comment'];
    index = json['index'];
    isVideo = json['is_video'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['filename'] = this.filename;
    data['comment'] = this.comment;
    data['index'] = this.index;
    data['is_video'] = this.isVideo;
    data['_id'] = this.sId;
    return data;
  }
}

class Media {
  List<Question> question;
  bool isVideo;
  String sId;
  String video;
  String user;
  String date;
  int iV;
  String filename;
  String comment;
  int index;

  Media(
      {this.question,
        this.isVideo,
        this.sId,
        this.video,
        this.user,
        this.date,
        this.iV,
        this.filename,
        this.comment,
        this.index});

  Media.fromJson(Map<String, dynamic> json) {
    if (json['question'] != null) {
      question = new List<Question>();
      json['question'].forEach((v) {
        question.add(new Question.fromJson(v));
      });
    }
    isVideo = json['is_video'];
    sId = json['_id'];
    video = json['video'];
    user = json['user'];
    date = json['date'];
    iV = json['__v'];
    filename = json['filename'];
    comment = json['comment'];
    index = json['index'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.question != null) {
      data['question'] = this.question.map((v) => v.toJson()).toList();
    }
    data['is_video'] = this.isVideo;
    data['_id'] = this.sId;
    data['video'] = this.video;
    data['user'] = this.user;
    data['date'] = this.date;
    data['__v'] = this.iV;
    data['filename'] = this.filename;
    data['comment'] = this.comment;
    data['index'] = this.index;
    return data;
  }
}

class Question {
  bool flag;
  String sId;
  String name;
  String category;
  String date;
  String slug;
  int iV;

  Question(
      {this.flag,
        this.sId,
        this.name,
        this.category,
        this.date,
        this.slug,
        this.iV});

  Question.fromJson(Map<String, dynamic> json) {
    flag = json['flag'];
    sId = json['_id'];
    name = json['name'];
    category = json['category'];
    date = json['date'];
    slug = json['slug'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['flag'] = this.flag;
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['category'] = this.category;
    data['date'] = this.date;
    data['slug'] = this.slug;
    data['__v'] = this.iV;
    return data;
  }
}