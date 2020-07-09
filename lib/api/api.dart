class Api {
  static const String _url = "https://api.covid19api.com/";

  static String getTotalStats() {
    return "${_url}summary";
  }

  static String getStatsByCountry(String country) {
    return "${_url}country/$country";
  }

  static String getCountriesList() {
    return "${_url}countries";
  }
}
