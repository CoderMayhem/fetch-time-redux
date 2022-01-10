import 'package:fetch_time_redux/models/app_state.dart';
import 'package:fetch_time_redux/models/fetch_time_action.dart';

AppState reducer(AppState prev, dynamic action){
  if(action is FetchTimeAction) {
    return AppState(action.location, action.time);
  }else{
    return prev;
  }
}