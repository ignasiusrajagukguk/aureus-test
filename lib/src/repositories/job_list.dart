import 'dart:convert';
import 'package:aureus_group/src/common/util/logger.dart';
import 'package:aureus_group/src/data/models/job_list_model.dart';
import 'package:http/http.dart' as http;

class JobRepository {
  Future<JobListModel> getJobList() async {
    final response = await http.get(
      Uri.parse(
          'https://job-portal-36fdd-default-rtdb.asia-southeast1.firebasedatabase.app/job-list.json'),
      headers: {},
    );
    Log.colorGreen('JOB LIST DATA :${response.body}');
    return JobListModel.fromJson(jsonDecode(response.body));
  }
}
