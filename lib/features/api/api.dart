import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:user_list/features/api/models/user.dart';

part 'api.g.dart';

@RestApi(baseUrl: 'https://jsonplaceholder.typicode.com/')
abstract class UserListClient {
  factory UserListClient(Dio dio, {String baseUrl}) = _UserListClient;

  @GET('/users')
  Future<List<User>> getUsers();

  @GET('/users/{id}')
  Future<User> getUserDetails(@Path('id') int id);
}
