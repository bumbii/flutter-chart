class Profile {
  String coverImageUrl;
  String profileImageUrl;
  num totalReach;
  num rate;
  String username;
  String firstName;
  String lastName;
  String city;
  String country;
  num countryCode;
  String bio;
  num engagementRate;
  num followers;
  num totalPosts;
  num engagementsPerPost;
  num likesPerPost;
  num commentsPerPost;
  List<CommonData> commonTags;
  num instagramReach;
  num facebookReach;
  num koliReach;
  List<Interest> interests;
  bool isUsernameUpdated;
  String display;
  String dateOfBirth;
  String mobile;
  String gender;
  String email;
  String countryIsoCode;
  String instaUsername;
  String ownerId;
  String description;

  Profile(
      {this.coverImageUrl = '',
      this.profileImageUrl = '',
      this.totalReach = 0,
      this.rate = 0,
      this.username = '',
      this.firstName = '',
      this.lastName = '',
      this.city = '',
      this.country = '',
      this.bio = '',
      this.engagementRate = 0,
      this.followers = 0,
      this.totalPosts = 0,
      this.engagementsPerPost = 0,
      this.likesPerPost = 0,
      this.commentsPerPost = 0,
      this.commonTags,
      this.instagramReach = 0,
      this.facebookReach = 0,
      this.koliReach = 0,
      this.interests,
      this.isUsernameUpdated = false,
      this.display = '',
      this.countryCode = 0,
      this.dateOfBirth = '',
      this.mobile = '',
      this.gender = '',
      this.email = '',
      this.countryIsoCode = '',
      this.instaUsername = '',
      this.ownerId = '',
      this.description = ''});

  Profile.fromJson(Map<String, dynamic> json) {
    coverImageUrl = json['coverImageUrl'];
    profileImageUrl = json['avatarUrl'] ?? '';
    totalReach =  json['totalReach'];
    rate = json['rate'];
    username = json['username'];
    firstName = json['first'];
    lastName = json['last'];
    city = json['city'];
    country = json['country'];
    bio = json['bio'];
    engagementRate = json['engagementRate'];
    followers = json['followers'];
    totalPosts = json['totalPosts'];
    engagementsPerPost = json['engagementsPerPost'];
    likesPerPost = json['likesPerPost'];

    commentsPerPost = json['commentsPerPost'];
    if (json['commonTags'] != null) {
      commonTags = List<CommonData>();
      json['commonTags'].forEach((v) {
        commonTags.add(CommonData.fromJson(v));
      });
    }
    instagramReach = json['instagramReach'];
    facebookReach = json['facebookReach'];
    koliReach = json['koliReach'];
    if (json['interests'] != null) {
      interests = List<Interest>();
      json['interests'].forEach((v) {
        interests.add(Interest(v));
      });
    }
    isUsernameUpdated = json['isUsernameUpdated'] ?? false;
    display = json['display'];
    dateOfBirth = json['dob'];
    email = json['email'];
    countryCode = json['countryCode'];
    gender = json['gender'];
    mobile = json['mobile'];
    instaUsername = json['instaUsername'];
    ownerId = json['ownerId'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first'] = this.firstName;
    data['last'] = this.lastName;
    data['username'] = this.username;
    data['bio'] = this.bio;
    data['country'] = this.country;
    data['city'] = this.city;
    data['countryCode'] = this.countryCode;
    data['mobile'] = this.mobile;
    data['dob'] = this.dateOfBirth;
    data['gender'] = this.gender;
    data['interests'] = this.interests;
    return data;
  }
}

class CommonData {
  String name;
  num value;

  CommonData({this.name, this.value});

  CommonData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['value'] = this.value;
    return data;
  }
}

class Interest {
  String name;
  bool isSelected;

  Interest(this.name, {this.isSelected = false});

  Interest.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }
}