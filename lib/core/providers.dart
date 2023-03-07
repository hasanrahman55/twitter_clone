import 'package:appwrite/appwrite.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../constants/appwrite_constant.dart';

final appWriteClintProvider = Provider((ref) {
  Client client = Client();
  return client
      .setEndpoint(AppwriteConstants.endPoint)
      .setProject(AppwriteConstants.projectId)
      .setSelfSigned(status: true);
});

final appWriteAccountProvider = Provider((ref) {
  final client = ref.watch(appWriteClintProvider);
  return Account(client);
});
final appWriteDatabaseProvider = Provider((ref) {
  final client = ref.watch(appWriteClintProvider);
  return Databases(client);
});
