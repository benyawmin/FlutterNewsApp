import 'package:news/src/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class LatestNewsBloc {
  final _repository = Repository();

  final newsFetcher = PublishSubject();
  final txtField = BehaviorSubject();
  final searchedListBuilder = PublishSubject();
  final savedNews = BehaviorSubject();
  final filteredByCat = PublishSubject();
  final filteredByRegion = PublishSubject();

  get newsStream => newsFetcher.stream;
  get txtFieldStream => txtField.stream;
  get searchedListBuilderStream => searchedListBuilder.stream;
  get savedNewsStream => savedNews.stream;
  get filteredByCatStream => filteredByCat.stream;
  get filteredByRegionStream => filteredByRegion.stream;

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

  fetchByCat(String category) async {
    filteredByCat.sink.add(await _repository.fetchByCategory(category));
  }

  fetchByRegion(String region) async{
    filteredByRegion.sink.add(await _repository.fetchByRegion(region));
  }

  dispose() {
    newsFetcher.close();
    filteredByCat.close();
    txtField.close();
    searchedListBuilder.close();
    savedNews.close();
    filteredByRegion.close();
  }
}
