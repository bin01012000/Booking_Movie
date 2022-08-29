class ApiUrl {
  static String http = "";
  static String domain = "https://dkcinema-db.herokuapp.com";

  //Auth
  static String login = "$domain/login";
  static String register = "$domain/register";

  //Movie
  static String getAllMovie = "$domain/movie";
  static String getBanner = "$domain/get-list-banner";
  static String getDetailMovie = "$domain/movie/[IDMOVIE]";
  static String getScheduleMovie =
      "$domain/get-list-schedule?movieId=[IDMOVIE]";
}
