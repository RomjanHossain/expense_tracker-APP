import 'package:expense_tracker/data/models/drifts/app_db/app_database.dart';
import 'package:expense_tracker/data/models/drifts/transfer_entity/transfer_drift.dart';

abstract class TransferRepo {
  //NOTE: get list of transfer
  Future<List<Transfers>> getListOfTransfer();
  //NOTE: create an transfer
  Future<int> createAnTransfer(Transfers transferEntity);
  //NOTE: delete an transfer
  Future<bool> deleteAnTransfer(int id);
  //NOTE: update the transfer
  Future<int> updateTheTransfer(int id, TransfersCompanion transferEntity);
}
