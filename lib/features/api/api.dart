import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:user_list/features/api/models/models.dart';

part 'api.g.dart';

@RestApi(baseUrl: 'https://reqres.in/api')
abstract class UserListClient {
  factory UserListClient(Dio dio, {String baseUrl}) = _UserListClient;

  @GET('/users')
  Future<UserList> getUsers();

  @GET('/users/{id}')
  Future<UserDetails> getUserDetails(@Path('id') int id);
}
