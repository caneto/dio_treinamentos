import '../../model/comment_model.dart';
import '../jsonplaceholder_custon_dio.dart';
import 'comments_repository.dart';

class CommentsDioRepositoy implements CommentsRepository {
  final JsonPlaceHolderCustonDio jsonPlaceHolderCustonDio;
  
  CommentsDioRepositoy({
    required this.jsonPlaceHolderCustonDio,
  });

  @override
  Future<List<CommentModel>> retornaComentarios(int postId) async {
    var response =
        await jsonPlaceHolderCustonDio.dio.get("/posts/$postId/comments");
    return (response.data as List)
        .map((e) => CommentModel.fromJson(e))
        .toList();
  }
}
