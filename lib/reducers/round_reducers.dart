part of heist;

final roundReducer = combineReducers<Map<String, List<Round>>>([
  new TypedReducer<Map<String, List<Round>>, UpdateMapEntryAction<String, List<Round>>>(reduce),
]);
