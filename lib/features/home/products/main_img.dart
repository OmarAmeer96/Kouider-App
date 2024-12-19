import 'package:json_annotation/json_annotation.dart';

part 'main_img.g.dart';

@JsonSerializable()
class MainImg {
  String? src;
  String? alt;
  String? caption;
  String? title;

  MainImg({this.src, this.alt, this.caption, this.title});

  factory MainImg.fromJson(Map<String, dynamic> json) {
    return _$MainImgFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MainImgToJson(this);
}
