import 'package:shamo_bwa/models/product_model.dart';

class MessageModel {
  late String message;
  late int userId;
  late String userName;
  late String userImage;
  late bool isFromUser;
  ProductModel? product;
  late DateTime createdAt;
  late DateTime updatedAt;

  MessageModel({
    required this.message,
    required this.userId,
    required this.userName,
    required this.userImage,
    required this.isFromUser,
    required this.product,
    required this.createdAt,
    required this.updatedAt,
  });

  MessageModel.fromJson(json) {
    message = json['message'];
    userId = json['userId'];
    userName = json['userName'];
    userImage = json['userImage'];
    isFromUser = json['isFromUser'];
    product =
        json['product'].isEmpty ? null : ProductModel.fromJson(json['product']);
    createdAt = DateTime.parse(json['createdAt']);
    updatedAt = DateTime.parse(json['updatedAt']);
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'userId': userId,
      'userName': userName,
      'userImage': userImage,
      'isFromUser': isFromUser,
      'product': product == null ? {} : product!.toJson(),
      'createdAt': createdAt,
      'updateAt': updatedAt,
    };
  }
}
