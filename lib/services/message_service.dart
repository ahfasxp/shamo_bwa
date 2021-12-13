import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shamo_bwa/models/message_model.dart';
import 'package:shamo_bwa/models/product_model.dart';
import 'package:shamo_bwa/models/user_model.dart';

class MessageService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<List<MessageModel>> getMessagesByUserId({required int userid}) {
    try {
      return firestore
          .collection('messages')
          .where('userId', isEqualTo: userid)
          .snapshots()
          .map((QuerySnapshot list) {
        var result = list.docs.map<MessageModel>((DocumentSnapshot message) {
          print(message.data());
          return MessageModel.fromJson(message.data());
        }).toList();

        result.sort((MessageModel a, MessageModel b) =>
            a.createdAt.compareTo(b.createdAt));

        return result;
      });
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> addMessage(
      {required UserModel user,
      required bool isFromUser,
      required String message,
      ProductModel? product}) async {
    try {
      firestore.collection('messages').add({
        'userId': user.id,
        'userName': user.name,
        'userImage': user.profilePhotoUrl,
        'isFromUser': isFromUser,
        'message': message,
        'product': product != null ? product.toJson() : {},
        'createdAt': DateTime.now().toString(),
        'updatedAt': DateTime.now().toString(),
      }).then((value) => print('Pesan Berhasil Dikirim!'));
    } catch (e) {
      throw Exception('Pesan Gagal Dikirim!');
    }
  }
}
