class ResponseMovie {
  int? errCode;
  String? errMessage;
  List<DataMovie>? dataMovie;

  ResponseMovie({this.errCode, this.errMessage, this.dataMovie});

  ResponseMovie.fromJson(Map<String, dynamic> json) {
    errCode = json['errCode'];
    errMessage = json['errMessage'];
    if (json['dataMovie'] != null) {
      dataMovie = <DataMovie>[];
      json['dataMovie'].forEach((v) {
        dataMovie!.add(DataMovie.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['errCode'] = errCode;
    data['errMessage'] = errMessage;
    if (dataMovie != null) {
      data['dataMovie'] = dataMovie!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataMovie {
  int? id;
  String? name;
  String? transName;
  String? country;
  String? duration;
  String? description;
  String? brand;
  String? cast;
  int? status;
  String? releaseTime;
  String? language;
  int? rating;
  String? director;
  String? url;
  bool? isDelete;
  String? createdAt;
  String? updatedAt;
  List<ImageOfMovie>? imageOfMovie;

  DataMovie(
      {this.id,
      this.name,
      this.transName,
      this.country,
      this.duration,
      this.description,
      this.brand,
      this.cast,
      this.status,
      this.releaseTime,
      this.language,
      this.rating,
      this.director,
      this.url,
      this.isDelete,
      this.createdAt,
      this.updatedAt,
      this.imageOfMovie});

  DataMovie.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    transName = json['transName'];
    country = json['country'];
    duration = json['duration'];
    description = json['description'];
    brand = json['brand'];
    cast = json['cast'];
    status = json['status'];
    releaseTime = json['releaseTime'];
    language = json['language'];
    rating = json['rating'];
    director = json['director'];
    url = json['url'];
    isDelete = json['isDelete'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    if (json['ImageOfMovie'] != null) {
      imageOfMovie = <ImageOfMovie>[];
      json['ImageOfMovie'].forEach((v) {
        imageOfMovie!.add(ImageOfMovie.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['transName'] = transName;
    data['country'] = country;
    data['duration'] = duration;
    data['description'] = description;
    data['brand'] = brand;
    data['cast'] = cast;
    data['status'] = status;
    data['releaseTime'] = releaseTime;
    data['language'] = language;
    data['rating'] = rating;
    data['director'] = director;
    data['url'] = url;
    data['isDelete'] = isDelete;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    if (imageOfMovie != null) {
      data['ImageOfMovie'] = imageOfMovie!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ImageOfMovie {
  int? id;
  int? movieId;
  bool? status;
  int? typeImage;
  String? url;
  String? publicId;
  String? createdAt;
  String? updatedAt;

  ImageOfMovie(
      {this.id,
      this.movieId,
      this.status,
      this.typeImage,
      this.url,
      this.publicId,
      this.createdAt,
      this.updatedAt});

  ImageOfMovie.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    movieId = json['movieId'];
    status = json['status'];
    typeImage = json['typeImage'];
    url = json['url'];
    publicId = json['public_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['movieId'] = movieId;
    data['status'] = status;
    data['typeImage'] = typeImage;
    data['url'] = url;
    data['public_id'] = publicId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
