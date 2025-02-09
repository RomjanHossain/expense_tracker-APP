abstract class ImportExportUsecases {
  // import database (json encoded)
  Future<void> importDB(String jsonString);
  // export database (json encoded)
  Future<String> exportDB();
  // save to document file
  Future<bool> saveToFile(String jsonString);
}
