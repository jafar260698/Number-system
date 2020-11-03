import 'package:block_pattern/model/posts.dart';
import 'package:rxdart/rxdart.dart';
import 'package:block_pattern/repository/notes_repository.dart';

class PostBlock{
  NotesRepository notesRepository=NotesRepository();

  final _postFetcher=PublishSubject<Posts>();

  Stream<Posts> get myposts => _postFetcher.stream;

  fetchAllPost() async{
    Posts posts = await notesRepository.getAllPost();
    _postFetcher.sink.add(posts);
  }

  dispose(){
    _postFetcher.close();
  }

}

final myposts = PostBlock();