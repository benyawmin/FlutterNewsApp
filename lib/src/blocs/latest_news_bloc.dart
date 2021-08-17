import 'package:news/src/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class LatestNewsBloc {
  final _repository = Repository();

  final _newsFetcher = PublishSubject();
  final _txtField = BehaviorSubject();
  final _searchedListBuilder = PublishSubject();
  final _savedNews = BehaviorSubject();
  final _filteredByCat = PublishSubject();
  final _filteredByRegion = PublishSubject();
  

  get newsStream => _newsFetcher.stream;
  get txtFieldStream => _txtField.stream;
  get searchedListBuilderStream => _searchedListBuilder.stream;
  get savedNewsStream => _savedNews.stream;
  get filteredByCatStream => _filteredByCat.stream;
  get filteredByRegionStream => _filteredByRegion.stream;

  addTxt(String txt) {
    _txtField.sink.add(txt);
  }

  fetchSearchedNews(String txt) async {
    var searchedResults = await _repository.fetchSearchedNews(txt);
    if (searchedResults.isEmpty)
      _searchedListBuilder.sink.addError('No results found');
    else
      _searchedListBuilder.sink.add(searchedResults);
  }

  fetchLatestNews() async {
    var latestNews = await _repository.fetchLatestNews();
    _newsFetcher.sink.add(latestNews);
  }

  addToSavedNews(snapshot, index) async {
    _savedNews.sink.add(await _repository.fetchAllFromDb());
  }

  fetchByCat(String category) async {
    _filteredByCat.sink.add(await _repository.fetchByCategory(category));
  }

  fetchByRegion(String region) async{
    _filteredByRegion.sink.add(await _repository.fetchByRegion(region));
  }

  dispose() {
    _newsFetcher.close();
    _filteredByCat.close();
    _txtField.close();
    _searchedListBuilder.close();
    _savedNews.close();
    _filteredByRegion.close();
  }
}
