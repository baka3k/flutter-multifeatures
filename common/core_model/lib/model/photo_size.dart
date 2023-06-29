const String photoBasePath = "https://image.tmdb.org/t/p/";

extension StringPhotoURL on String {
  String asPhotoUrl(PhotoSize size) {
    return "$photoBasePath${size.getSize()}$this";
  }
}

abstract class PhotoSize {
  String getSize() => "";
}

enum BackDrop implements PhotoSize {
  w300(value: "w300"),
  w780(value: "w780"),
  w1280(value: "w1280"),
  original(value: "original");

  const BackDrop({
    required String value,
  }) : _value = value;

  final String _value;

  @override
  String getSize() => _value;
}

enum Logo implements PhotoSize {
  w45(value: "w45"),
  w92(value: "w92"),
  w154(value: "w154"),
  w185(value: "w185"),
  w300(value: "w300"),
  w500(value: "w500"),
  original(value: "original");

  const Logo({
    required String value,
  }) : _value = value;

  final String _value;

  @override
  String getSize() => _value;
}

enum Poster implements PhotoSize {
  w45(value: "w45"),
  w92(value: "w92"),
  w154(value: "w154"),
  w185(value: "w185"),
  w300(value: "w300"),
  w500(value: "w500"),
  w780(value: "w780"),
  original(value: "original");

  const Poster({
    required String value,
  }) : _value = value;

  final String _value;

  @override
  String getSize() => _value;
}

enum Profile implements PhotoSize {
  w45(value: "w45"),
  w185(value: "w185"),
  h632(value: "h632"),
  original(value: "original");

  const Profile({
    required String value,
  }) : _value = value;

  final String _value;

  @override
  String getSize() => _value;
}

enum Still implements PhotoSize {
  w45(value: "w45"),
  w185(value: "w185"),
  w300(value: "w300"),
  original(value: "original");

  const Still({
    required String value,
  }) : _value = value;

  final String _value;

  @override
  String getSize() => _value;
}
