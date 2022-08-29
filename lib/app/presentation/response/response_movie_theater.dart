class ResponseMovieTheater {
  int? errCode;
  String? errMessage;
  List<Movie>? movie;

  ResponseMovieTheater({this.errCode, this.errMessage, this.movie});

  ResponseMovieTheater.fromJson(Map<String, dynamic> json) {
    errCode = json['errCode'];
    errMessage = json['errMessage'];
    if (json['movie'] != null) {
      movie = <Movie>[];
      json['movie'].forEach((v) {
        movie!.add(Movie.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['errCode'] = errCode;
    data['errMessage'] = errMessage;
    if (movie != null) {
      data['movie'] = movie!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Movie {
  int? id;
  String? tenRap;
  String? soDienThoai;
  int? cityCode;
  int? districtCode;
  int? wardCode;
  String? address;
  bool? isdelete;
  String? createdAt;
  String? updatedAt;
  List<MovieTheaterImage>? movieTheaterImage;

  Movie(
      {this.id,
      this.tenRap,
      this.soDienThoai,
      this.cityCode,
      this.districtCode,
      this.wardCode,
      this.address,
      this.isdelete,
      this.createdAt,
      this.updatedAt,
      this.movieTheaterImage});

  Movie.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tenRap = json['tenRap'];
    soDienThoai = json['soDienThoai'];
    cityCode = json['cityCode'];
    districtCode = json['districtCode'];
    wardCode = json['wardCode'];
    address = json['address'];
    isdelete = json['isdelete'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    if (json['MovieTheaterImage'] != null) {
      movieTheaterImage = <MovieTheaterImage>[];
      json['MovieTheaterImage'].forEach((v) {
        movieTheaterImage!.add(MovieTheaterImage.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['tenRap'] = tenRap;
    data['soDienThoai'] = soDienThoai;
    data['cityCode'] = cityCode;
    data['districtCode'] = districtCode;
    data['wardCode'] = wardCode;
    data['address'] = address;
    data['isdelete'] = isdelete;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    if (movieTheaterImage != null) {
      data['MovieTheaterImage'] =
          movieTheaterImage!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MovieTheaterImage {
  int? id;
  String? url;
  int? movieTheaterId;
  String? publicId;
  bool? status;
  String? createdAt;
  String? updatedAt;

  MovieTheaterImage(
      {this.id,
      this.url,
      this.movieTheaterId,
      this.publicId,
      this.status,
      this.createdAt,
      this.updatedAt});

  MovieTheaterImage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    movieTheaterId = json['movieTheaterId'];
    publicId = json['public_id'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['url'] = url;
    data['movieTheaterId'] = movieTheaterId;
    data['public_id'] = publicId;
    data['status'] = status;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
