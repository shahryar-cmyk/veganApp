// To parse this JSON data, do
//
//     final wordPressPost = wordPressPostFromJson(jsonString);

import 'dart:convert';

List<WordPressPost> wordPressPostFromJson(String str) =>
    List<WordPressPost>.from(
        json.decode(str).map((x) => WordPressPost.fromJson(x)));

String wordPressPostToJson(List<WordPressPost> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WordPressPost {
  WordPressPost({
    this.id,
    this.date,
    this.dateGmt,
    this.guid,
    this.modified,
    this.modifiedGmt,
    this.slug,
    this.status,
    this.type,
    this.link,
    this.title,
    this.content,
    this.excerpt,
    this.author,
    this.featuredMedia,
    this.commentStatus,
    this.pingStatus,
    this.sticky,
    this.template,
    this.format,
    this.meta,
    this.categories,
    this.tags,
    this.links,
  });

  int id;
  DateTime date;
  DateTime dateGmt;
  Guid guid;
  DateTime modified;
  DateTime modifiedGmt;
  String slug;
  StatusEnum status;
  Type type;
  String link;
  Guid title;
  Content content;
  Content excerpt;
  int author;
  int featuredMedia;
  Status commentStatus;
  Status pingStatus;
  bool sticky;
  String template;
  Format format;
  List<dynamic> meta;
  List<int> categories;
  List<dynamic> tags;
  Links links;

  factory WordPressPost.fromJson(Map<String, dynamic> json) => WordPressPost(
        id: json["id"] == null ? null : json["id"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        dateGmt:
            json["date_gmt"] == null ? null : DateTime.parse(json["date_gmt"]),
        guid: json["guid"] == null ? null : Guid.fromJson(json["guid"]),
        modified:
            json["modified"] == null ? null : DateTime.parse(json["modified"]),
        modifiedGmt: json["modified_gmt"] == null
            ? null
            : DateTime.parse(json["modified_gmt"]),
        slug: json["slug"] == null ? null : json["slug"],
        status: json["status"] == null
            ? null
            : statusEnumValues.map[json["status"]],
        type: json["type"] == null ? null : typeValues.map[json["type"]],
        link: json["link"] == null ? null : json["link"],
        title: json["title"] == null ? null : Guid.fromJson(json["title"]),
        content:
            json["content"] == null ? null : Content.fromJson(json["content"]),
        excerpt:
            json["excerpt"] == null ? null : Content.fromJson(json["excerpt"]),
        author: json["author"] == null ? null : json["author"],
        featuredMedia:
            json["featured_media"] == null ? null : json["featured_media"],
        commentStatus: json["comment_status"] == null
            ? null
            : statusValues.map[json["comment_status"]],
        pingStatus: json["ping_status"] == null
            ? null
            : statusValues.map[json["ping_status"]],
        sticky: json["sticky"] == null ? null : json["sticky"],
        template: json["template"] == null ? null : json["template"],
        format:
            json["format"] == null ? null : formatValues.map[json["format"]],
        meta: json["meta"] == null
            ? null
            : List<dynamic>.from(json["meta"].map((x) => x)),
        categories: json["categories"] == null
            ? null
            : List<int>.from(json["categories"].map((x) => x)),
        tags: json["tags"] == null
            ? null
            : List<dynamic>.from(json["tags"].map((x) => x)),
        links: json["_links"] == null ? null : Links.fromJson(json["_links"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "date": date == null ? null : date.toIso8601String(),
        "date_gmt": dateGmt == null ? null : dateGmt.toIso8601String(),
        "guid": guid == null ? null : guid.toJson(),
        "modified": modified == null ? null : modified.toIso8601String(),
        "modified_gmt":
            modifiedGmt == null ? null : modifiedGmt.toIso8601String(),
        "slug": slug == null ? null : slug,
        "status": status == null ? null : statusEnumValues.reverse[status],
        "type": type == null ? null : typeValues.reverse[type],
        "link": link == null ? null : link,
        "title": title == null ? null : title.toJson(),
        "content": content == null ? null : content.toJson(),
        "excerpt": excerpt == null ? null : excerpt.toJson(),
        "author": author == null ? null : author,
        "featured_media": featuredMedia == null ? null : featuredMedia,
        "comment_status":
            commentStatus == null ? null : statusValues.reverse[commentStatus],
        "ping_status":
            pingStatus == null ? null : statusValues.reverse[pingStatus],
        "sticky": sticky == null ? null : sticky,
        "template": template == null ? null : template,
        "format": format == null ? null : formatValues.reverse[format],
        "meta": meta == null ? null : List<dynamic>.from(meta.map((x) => x)),
        "categories": categories == null
            ? null
            : List<dynamic>.from(categories.map((x) => x)),
        "tags": tags == null ? null : List<dynamic>.from(tags.map((x) => x)),
        "_links": links == null ? null : links.toJson(),
      };
}

enum Status { OPEN }

final statusValues = EnumValues({"open": Status.OPEN});

class Content {
  Content({
    this.rendered,
    this.protected,
  });

  String rendered;
  bool protected;

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        rendered: json["rendered"] == null ? null : json["rendered"],
        protected: json["protected"] == null ? null : json["protected"],
      );

  Map<String, dynamic> toJson() => {
        "rendered": rendered == null ? null : rendered,
        "protected": protected == null ? null : protected,
      };
}

enum Format { STANDARD, LINK }

final formatValues =
    EnumValues({"link": Format.LINK, "standard": Format.STANDARD});

class Guid {
  Guid({
    this.rendered,
  });

  String rendered;

  factory Guid.fromJson(Map<String, dynamic> json) => Guid(
        rendered: json["rendered"] == null ? null : json["rendered"],
      );

  Map<String, dynamic> toJson() => {
        "rendered": rendered == null ? null : rendered,
      };
}

class Links {
  Links({
    this.self,
    this.collection,
    this.about,
    this.author,
    this.replies,
    this.versionHistory,
    this.predecessorVersion,
    this.wpFeaturedmedia,
    this.wpAttachment,
    this.wpTerm,
    this.curies,
  });

  List<About> self;
  List<About> collection;
  List<About> about;
  List<Author> author;
  List<Author> replies;
  List<VersionHistory> versionHistory;
  List<PredecessorVersion> predecessorVersion;
  List<Author> wpFeaturedmedia;
  List<About> wpAttachment;
  List<WpTerm> wpTerm;
  List<Cury> curies;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        self: json["self"] == null
            ? null
            : List<About>.from(json["self"].map((x) => About.fromJson(x))),
        collection: json["collection"] == null
            ? null
            : List<About>.from(
                json["collection"].map((x) => About.fromJson(x))),
        about: json["about"] == null
            ? null
            : List<About>.from(json["about"].map((x) => About.fromJson(x))),
        author: json["author"] == null
            ? null
            : List<Author>.from(json["author"].map((x) => Author.fromJson(x))),
        replies: json["replies"] == null
            ? null
            : List<Author>.from(json["replies"].map((x) => Author.fromJson(x))),
        versionHistory: json["version-history"] == null
            ? null
            : List<VersionHistory>.from(
                json["version-history"].map((x) => VersionHistory.fromJson(x))),
        predecessorVersion: json["predecessor-version"] == null
            ? null
            : List<PredecessorVersion>.from(json["predecessor-version"]
                .map((x) => PredecessorVersion.fromJson(x))),
        wpFeaturedmedia: json["wp:featuredmedia"] == null
            ? null
            : List<Author>.from(
                json["wp:featuredmedia"].map((x) => Author.fromJson(x))),
        wpAttachment: json["wp:attachment"] == null
            ? null
            : List<About>.from(
                json["wp:attachment"].map((x) => About.fromJson(x))),
        wpTerm: json["wp:term"] == null
            ? null
            : List<WpTerm>.from(json["wp:term"].map((x) => WpTerm.fromJson(x))),
        curies: json["curies"] == null
            ? null
            : List<Cury>.from(json["curies"].map((x) => Cury.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "self": self == null
            ? null
            : List<dynamic>.from(self.map((x) => x.toJson())),
        "collection": collection == null
            ? null
            : List<dynamic>.from(collection.map((x) => x.toJson())),
        "about": about == null
            ? null
            : List<dynamic>.from(about.map((x) => x.toJson())),
        "author": author == null
            ? null
            : List<dynamic>.from(author.map((x) => x.toJson())),
        "replies": replies == null
            ? null
            : List<dynamic>.from(replies.map((x) => x.toJson())),
        "version-history": versionHistory == null
            ? null
            : List<dynamic>.from(versionHistory.map((x) => x.toJson())),
        "predecessor-version": predecessorVersion == null
            ? null
            : List<dynamic>.from(predecessorVersion.map((x) => x.toJson())),
        "wp:featuredmedia": wpFeaturedmedia == null
            ? null
            : List<dynamic>.from(wpFeaturedmedia.map((x) => x.toJson())),
        "wp:attachment": wpAttachment == null
            ? null
            : List<dynamic>.from(wpAttachment.map((x) => x.toJson())),
        "wp:term": wpTerm == null
            ? null
            : List<dynamic>.from(wpTerm.map((x) => x.toJson())),
        "curies": curies == null
            ? null
            : List<dynamic>.from(curies.map((x) => x.toJson())),
      };
}

class About {
  About({
    this.href,
  });

  String href;

  factory About.fromJson(Map<String, dynamic> json) => About(
        href: json["href"] == null ? null : json["href"],
      );

  Map<String, dynamic> toJson() => {
        "href": href == null ? null : href,
      };
}

class Author {
  Author({
    this.embeddable,
    this.href,
  });

  bool embeddable;
  String href;

  factory Author.fromJson(Map<String, dynamic> json) => Author(
        embeddable: json["embeddable"] == null ? null : json["embeddable"],
        href: json["href"] == null ? null : json["href"],
      );

  Map<String, dynamic> toJson() => {
        "embeddable": embeddable == null ? null : embeddable,
        "href": href == null ? null : href,
      };
}

class Cury {
  Cury({
    this.name,
    this.href,
    this.templated,
  });

  Name name;
  Href href;
  bool templated;

  factory Cury.fromJson(Map<String, dynamic> json) => Cury(
        name: json["name"] == null ? null : nameValues.map[json["name"]],
        href: json["href"] == null ? null : hrefValues.map[json["href"]],
        templated: json["templated"] == null ? null : json["templated"],
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : nameValues.reverse[name],
        "href": href == null ? null : hrefValues.reverse[href],
        "templated": templated == null ? null : templated,
      };
}

enum Href { HTTPS_API_W_ORG_REL }

final hrefValues =
    EnumValues({"https://api.w.org/{rel}": Href.HTTPS_API_W_ORG_REL});

enum Name { WP }

final nameValues = EnumValues({"wp": Name.WP});

class PredecessorVersion {
  PredecessorVersion({
    this.id,
    this.href,
  });

  int id;
  String href;

  factory PredecessorVersion.fromJson(Map<String, dynamic> json) =>
      PredecessorVersion(
        id: json["id"] == null ? null : json["id"],
        href: json["href"] == null ? null : json["href"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "href": href == null ? null : href,
      };
}

class VersionHistory {
  VersionHistory({
    this.count,
    this.href,
  });

  int count;
  String href;

  factory VersionHistory.fromJson(Map<String, dynamic> json) => VersionHistory(
        count: json["count"] == null ? null : json["count"],
        href: json["href"] == null ? null : json["href"],
      );

  Map<String, dynamic> toJson() => {
        "count": count == null ? null : count,
        "href": href == null ? null : href,
      };
}

class WpTerm {
  WpTerm({
    this.taxonomy,
    this.embeddable,
    this.href,
  });

  Taxonomy taxonomy;
  bool embeddable;
  String href;

  factory WpTerm.fromJson(Map<String, dynamic> json) => WpTerm(
        taxonomy: json["taxonomy"] == null
            ? null
            : taxonomyValues.map[json["taxonomy"]],
        embeddable: json["embeddable"] == null ? null : json["embeddable"],
        href: json["href"] == null ? null : json["href"],
      );

  Map<String, dynamic> toJson() => {
        "taxonomy": taxonomy == null ? null : taxonomyValues.reverse[taxonomy],
        "embeddable": embeddable == null ? null : embeddable,
        "href": href == null ? null : href,
      };
}

enum Taxonomy { CATEGORY, POST_TAG }

final taxonomyValues =
    EnumValues({"category": Taxonomy.CATEGORY, "post_tag": Taxonomy.POST_TAG});

enum StatusEnum { PUBLISH }

final statusEnumValues = EnumValues({"publish": StatusEnum.PUBLISH});

enum Type { POST }

final typeValues = EnumValues({"post": Type.POST});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
