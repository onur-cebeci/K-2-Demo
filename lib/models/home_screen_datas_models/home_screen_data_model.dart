import 'package:freezed_annotation/freezed_annotation.dart';
part 'home_screen_data_model.freezed.dart';
part 'home_screen_data_model.g.dart';

@freezed
class DataModel with _$DataModel {
  const factory DataModel(
      {required int id,
      required String slug,
      required String url,
      required String title,
      required String content,
      required String image,
      required String thumbnail,
      required String status,
      required String category,
      required String publishedAt,
      required String updatedAt,
      required int userId}) = _DataModel;

  factory DataModel.fromJson(Map<String, dynamic> json) =>
      _$DataModelFromJson(json);
}
