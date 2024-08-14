// To parse this JSON data, do
//
//     final userInfoModel = userInfoModelFromJson(jsonString);

import 'dart:convert';

UserInfoModel userInfoModelFromJson(String str) => UserInfoModel.fromJson(json.decode(str));

String userInfoModelToJson(UserInfoModel data) => json.encode(data.toJson());

class UserInfoModel {
  String? login;
  int? id;
  String? nodeId;
  String? avatarUrl;
  String? gravatarId;
  String? url;
  String? htmlUrl;
  String? followersUrl;
  String? followingUrl;
  String? gistsUrl;
  String? starredUrl;
  String? subscriptionsUrl;
  String? organizationsUrl;
  String? reposUrl;
  String? eventsUrl;
  String? receivedEventsUrl;
  String? type;
  bool? siteAdmin;
  String? name;
  String? company;
  String? blog;
  String? location;
  dynamic email;
  dynamic hireable;
  dynamic bio;
  String? twitterUsername;
  int? publicRepos;
  int? publicGists;
  int? followers;
  int? following;
  DateTime? createdAt;
  DateTime? updatedAt;

  UserInfoModel({
    this.login,
    this.id,
    this.nodeId,
    this.avatarUrl,
    this.gravatarId,
    this.url,
    this.htmlUrl,
    this.followersUrl,
    this.followingUrl,
    this.gistsUrl,
    this.starredUrl,
    this.subscriptionsUrl,
    this.organizationsUrl,
    this.reposUrl,
    this.eventsUrl,
    this.receivedEventsUrl,
    this.type,
    this.siteAdmin,
    this.name,
    this.company,
    this.blog,
    this.location,
    this.email,
    this.hireable,
    this.bio,
    this.twitterUsername,
    this.publicRepos,
    this.publicGists,
    this.followers,
    this.following,
    this.createdAt,
    this.updatedAt,
  });

  factory UserInfoModel.fromJson(Map<String, dynamic> json) => UserInfoModel(
        login: json["login"] as String?,
        id: json["id"] as int?,
        nodeId: json["node_id"] as String?,
        avatarUrl: json["avatar_url"] as String?,
        gravatarId: json["gravatar_id"] as String?,
        url: json["url"] as String?,
        htmlUrl: json["html_url"] as String?,
        followersUrl: json["followers_url"] as String?,
        followingUrl: json["following_url"] as String?,
        gistsUrl: json["gists_url"] as String?,
        starredUrl: json["starred_url"] as String?,
        subscriptionsUrl: json["subscriptions_url"] as String?,
        organizationsUrl: json["organizations_url"] as String?,
        reposUrl: json["repos_url"] as String?,
        eventsUrl: json["events_url"] as String?,
        receivedEventsUrl: json["received_events_url"] as String?,
        type: json["type"] as String?,
        siteAdmin: json["site_admin"] as bool?,
        name: json["name"] as String?,
        company: json["company"] as String?,
        blog: json["blog"] as String?,
        location: json["location"] as String?,
        email: json["email"],
        hireable: json["hireable"],
        bio: json["bio"],
        twitterUsername: json["twitter_username"] as String?,
        publicRepos: json["public_repos"] as int?,
        publicGists: json["public_gists"] as int?,
        followers: json["followers"] as int?,
        following: json["following"] as int?,
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "login": login,
        "id": id,
        "node_id": nodeId,
        "avatar_url": avatarUrl,
        "gravatar_id": gravatarId,
        "url": url,
        "html_url": htmlUrl,
        "followers_url": followersUrl,
        "following_url": followingUrl,
        "gists_url": gistsUrl,
        "starred_url": starredUrl,
        "subscriptions_url": subscriptionsUrl,
        "organizations_url": organizationsUrl,
        "repos_url": reposUrl,
        "events_url": eventsUrl,
        "received_events_url": receivedEventsUrl,
        "type": type,
        "site_admin": siteAdmin,
        "name": name,
        "company": company,
        "blog": blog,
        "location": location,
        "email": email,
        "hireable": hireable,
        "bio": bio,
        "twitter_username": twitterUsername,
        "public_repos": publicRepos,
        "public_gists": publicGists,
        "followers": followers,
        "following": following,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
