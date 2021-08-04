import 'package:news/src/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class LatestNewsBloc {
  final _repository = Repository();

  final newsFetcher = PublishSubject();
  final filteredbyCat = PublishSubject();
  // final filteredCatOutput = PublishSubject();

  get newsStream => newsFetcher.stream;
  get filteredbyCatStream => filteredbyCat.stream;

  fetchLatestNews() async {
    var latestNews = await _repository.fetchLatestNews();
    newsFetcher.sink.add(latestNews);
  }

  fetchLatestNewsByCategory(category) async {
    var latestNews = await _repository.fetchLatestNews();
    filteredbyCat.sink.add(latestNews);
    // filteredbyCat.transform(_filteredbyCatTransformer(category)).pipe(filteredCatOutput);
  }

  // _filteredbyCatTransformer(category) {
  //   return filteredbyCat.stream;
  // }

  dispose() {
    newsFetcher.close();
    filteredbyCat.close();
    // filteredCatOutput.close();
  }
}
