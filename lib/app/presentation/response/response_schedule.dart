import 'package:booking_movie_ticket/app/widgets/unicorn_outline_button.dart';

class ScheduleMovie {
  int? errCode;
  String? errMessage;
  List<Data>? data;

  ScheduleMovie({this.errCode, this.errMessage, this.data});

  ScheduleMovie.fromJson(Map<String, dynamic> json) {
    errCode = json['errCode'];
    errMessage = json['errMessage'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['errCode'] = errCode;
    data['errMessage'] = errMessage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? startTime;
  String? endTime;
  String? premiereDate;
  int? movieId;
  int? roomId;
  String? createdAt;
  String? updatedAt;
  ShowtimeMovie? showtimeMovie;
  RoomShowTime? roomShowTime;

  Data(
      {this.id,
      this.startTime,
      this.endTime,
      this.premiereDate,
      this.movieId,
      this.roomId,
      this.createdAt,
      this.updatedAt,
      this.showtimeMovie,
      this.roomShowTime});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    premiereDate = json['premiereDate'];
    movieId = json['movieId'];
    roomId = json['roomId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    showtimeMovie = json['ShowtimeMovie'] != null
        ? ShowtimeMovie.fromJson(json['ShowtimeMovie'])
        : null;
    roomShowTime = json['RoomShowTime'] != null
        ? RoomShowTime.fromJson(json['RoomShowTime'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['startTime'] = startTime;
    data['endTime'] = endTime;
    data['premiereDate'] = premiereDate;
    data['movieId'] = movieId;
    data['roomId'] = roomId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    if (showtimeMovie != null) {
      data['ShowtimeMovie'] = showtimeMovie!.toJson();
    }
    if (roomShowTime != null) {
      data['RoomShowTime'] = roomShowTime!.toJson();
    }
    return data;
  }

  map(UnicornOutlineButton Function(dynamic e) param0) {}
}

class ShowtimeMovie {
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
  List<MovieOfType>? movieOfType;
  List<ImageOfMovie>? imageOfMovie;

  ShowtimeMovie(
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
      this.movieOfType,
      this.imageOfMovie});

  ShowtimeMovie.fromJson(Map<String, dynamic> json) {
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
    if (json['MovieOfType'] != null) {
      movieOfType = <MovieOfType>[];
      json['MovieOfType'].forEach((v) {
        movieOfType!.add(MovieOfType.fromJson(v));
      });
    }
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
    if (movieOfType != null) {
      data['MovieOfType'] = movieOfType!.map((v) => v.toJson()).toList();
    }
    if (imageOfMovie != null) {
      data['ImageOfMovie'] = imageOfMovie!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MovieOfType {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;
  TypeOfMovie? typeOfMovie;

  MovieOfType(
      {this.id, this.name, this.createdAt, this.updatedAt, this.typeOfMovie});

  MovieOfType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    typeOfMovie = json['TypeOfMovie'] != null
        ? TypeOfMovie.fromJson(json['TypeOfMovie'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    if (typeOfMovie != null) {
      data['TypeOfMovie'] = typeOfMovie!.toJson();
    }
    return data;
  }
}

class TypeOfMovie {
  int? movieId;
  int? typeId;
  String? createdAt;
  String? updatedAt;

  TypeOfMovie({this.movieId, this.typeId, this.createdAt, this.updatedAt});

  TypeOfMovie.fromJson(Map<String, dynamic> json) {
    movieId = json['movieId'];
    typeId = json['typeId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['movieId'] = movieId;
    data['typeId'] = typeId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
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

class RoomShowTime {
  int? id;
  int? numberOfColumn;
  int? numberOfRow;
  int? movieTheaterId;
  String? name;
  bool? isdelete;
  String? createdAt;
  String? updatedAt;
  MovieTheaterRoom? movieTheaterRoom;

  RoomShowTime(
      {this.id,
      this.numberOfColumn,
      this.numberOfRow,
      this.movieTheaterId,
      this.name,
      this.isdelete,
      this.createdAt,
      this.updatedAt,
      this.movieTheaterRoom});

  RoomShowTime.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    numberOfColumn = json['numberOfColumn'];
    numberOfRow = json['numberOfRow'];
    movieTheaterId = json['movieTheaterId'];
    name = json['name'];
    isdelete = json['isdelete'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    movieTheaterRoom = json['MovieTheaterRoom'] != null
        ? MovieTheaterRoom.fromJson(json['MovieTheaterRoom'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['numberOfColumn'] = numberOfColumn;
    data['numberOfRow'] = numberOfRow;
    data['movieTheaterId'] = movieTheaterId;
    data['name'] = name;
    data['isdelete'] = isdelete;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    if (movieTheaterRoom != null) {
      data['MovieTheaterRoom'] = movieTheaterRoom!.toJson();
    }
    return data;
  }
}

class MovieTheaterRoom {
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

  MovieTheaterRoom(
      {this.id,
      this.tenRap,
      this.soDienThoai,
      this.cityCode,
      this.districtCode,
      this.wardCode,
      this.address,
      this.isdelete,
      this.createdAt,
      this.updatedAt});

  MovieTheaterRoom.fromJson(Map<String, dynamic> json) {
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
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
    return data;
  }
}
