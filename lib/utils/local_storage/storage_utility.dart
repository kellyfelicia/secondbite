import 'package:get_storage/get_storage.dart';

class AppLocalStorage {
  static final AppLocalStorage _instance = AppLocalStorage._internal();

  factory AppLocalStorage(){
    return _instance;
  }

  AppLocalStorage._internal();

  final _storage = GetStorage();

  Future<void> saveData<E>(String key, E value) async{
    await _storage.write(key, value);
  } 

  E? readData<E>(String key){
    return _storage.read(key);
  }

  Future<void> removeData(String key) async{
    await _storage.remove(key);
  }

  Future<void> clearAll() async{
    await _storage.erase();
  }
}