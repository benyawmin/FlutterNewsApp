import 'package:news/src/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class LatestNewsBloc {
  final _repository = Repository();

  final newsFetcher = PublishSubject();
  final filteredbyCat = BehaviorSubject();
  final txtField = BehaviorSubject();
  final searchedListBuilder = PublishSubject();
  final savedNews = BehaviorSubject();
  // final filteredCatOutput = PublishSubject();

  get newsStream => newsFetcher.stream;
  get filteredbyCatStream => filteredbyCat.stream;
  get txtFieldStream => txtField.stream;
  get searchedListBuilderStream => searchedListBuilder.stream;
  get savedNewsStream => savedNews.stream;

  addTxt(String txt) {
    txtField.sink.add(txt);
  }

  fetchSearchedNews(String txt) async {
    var searchedResults = await _repository.fetchSearchedNews(txt);
    if (searchedResults.isEmpty)
      searchedListBuilder.sink.addError('No results found');
    else
      searchedListBuilder.sink.add(searchedResults);
  }

  fetchLatestNews() async {
    var latestNews = await _repository.fetchLatestNews();
    newsFetcher.sink.add(latestNews);
  }

  addToSavedNews(snapshot, index) async {
    savedNews.sink.add(await _repository.fetchAllFromDb());
  }

  // fetchLatestNewsByCategory() async {
  //   var latestNews = await _repository.fetchLatestNews();
  //   filteredbyCat.sink.add(latestNews);
  //   // filteredbyCat.transform(_filteredbyCatTransformer(category)).pipe(filteredCatOutput);
  // }

  // _filteredbyCatTransformer(category) {
  //   return filteredbyCat.stream;
  // }

  dispose() {
    newsFetcher.close();
    filteredbyCat.close();
    txtField.close();
    searchedListBuilder.close();
    savedNews.close();
    // filteredCatOutput.close();
  }
}
