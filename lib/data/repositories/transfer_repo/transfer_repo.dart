import 'package:expense_tracker/data/models/isar_entity/transfer_entity/transfer_entity.dart';

abstract class TransferRepo {
  //NOTE: get list of transfer
  Future<List<TransferEntity>> getListOfTransfer();
  //NOTE: create an transfer
  Future<int> createAnTransfer(TransferEntity transferEntity);
  //NOTE: delete an transfer
  Future<bool> deleteAnTransfer(int id);
  //NOTE: update the transfer
  Future<int> updateTheTransfer(int id, TransferEntity transferEntity);
}
