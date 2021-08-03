import 'package:news/src/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class LatestNewsBloc {
  final _repository = Repository();

  final newsFetcher = PublishSubject();
  final catBuilder = PublishSubject();

  get newsStream => newsFetcher.stream;
  get catsStream => catBuilder.stream;

  fetchLatestNews() async {
    var latestNews = await _repository.fetchLatestNews();
    newsFetcher.sink.add(latestNews);
  }

  buildCats(category) {
    catBuilder.sink.add(category);
  }

  dispose() {
    newsFetcher.close();
    catBuilder.close();
  }
}
