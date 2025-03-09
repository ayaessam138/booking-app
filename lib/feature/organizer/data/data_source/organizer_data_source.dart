import 'package:bookingapp/core/helpers/app_const.dart';
import 'package:bookingapp/core/network/dio_client.dart';
import 'package:bookingapp/feature/organizer/data/modles/organizer_model.dart';

abstract class OrganizerDatasource {
  Future<OrganizerModel> getOrganizerDeatails({required String id});
}

class OrganizerDatasourceImpl implements OrganizerDatasource {
  final DioClient dioClient;

  OrganizerDatasourceImpl({required this.dioClient});

  @override
  Future<OrganizerModel> getOrganizerDeatails({required String id}) async {
    final response = await dioClient.get('${ApiConstants.getOrganizer}/$id');
    return OrganizerModel.fromJson(response.data);
  }
}
