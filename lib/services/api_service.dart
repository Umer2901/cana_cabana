import 'dart:convert';
import 'dart:developer';

import 'package:cana_cabana/app/shared_prefs_keys.dart';
import 'package:cana_cabana/models/collection.dart';
import 'package:cana_cabana/models/product.dart';
import 'package:cana_cabana/models/store.dart';
import 'package:cana_cabana/routes/routes.dart';
import 'package:cana_cabana/services/dio.dart';
import 'package:cana_cabana/util/globals.dart';
import 'package:flutter/foundation.dart';
import 'package:get/route_manager.dart';

class APIService {
  final String _baseUrl = "https://app.cannacabana.com";

  Future<dynamic> signUp(String firstName, String lastName, String email,
      String password, String rePassword) async {
    try {
      dynamic token =
          await sharedPrefsGlobal.getData(SharedPrefKeys.oAuthToken);
      FormData formData = FormData.fromMap({
        "first_name": firstName,
        'last_name': lastName,
        'email': email,
        'password': password,
        'c_password': rePassword,
      });
      token ??= await getOAuthToken();
      // await sharedPrefsGlobal.getData(SharedPrefKeys.oAuthToken);
      if (kDebugMode) {
        print(token.runtimeType);
      }
      // token ??= await getOAuthToken();

      Response response = await dio.post("$_baseUrl/api/register",
          data: formData,
          options: Options(headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $token"
          }));
      List<Store> stores = [];
      if (response.statusCode == 200) {
        if (kDebugMode) {
          print(response.data.runtimeType);
        }
        Map<String, dynamic> data = response.data as Map<String, dynamic>;
        Map<String, dynamic> map = data["success"];
        String userToken = map["token"];
        String fullName = map["name"];
        await sharedPrefsGlobal.saveData(SharedPrefKeys.userToken, userToken);
        await sharedPrefsGlobal.saveData(SharedPrefKeys.userName, fullName);
        return true;
      }
      return stores;
    } on DioException catch (e) {
      String error = "";
      if (e.response != null) {
        log(e.response!.data);
        final Map<String, dynamic> data = e.response!.data;
        data.forEach((key, value) {
          error += value[0];
        });
      }

      return error;
    }
  }

  Future<dynamic> login(
    String email,
    String password,
  ) async {
    try {
      FormData formData = FormData.fromMap({
        'email': email,
        'password': password,
      });
      dynamic token = await getOAuthToken();
      // await sharedPrefsGlobal.getData(SharedPrefKeys.oAuthToken);
      if (kDebugMode) {
        print(token.runtimeType);
      }

      Response response = await dio.post("$_baseUrl/api/login",
          data: formData,
          options: Options(headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $token"
          }));

      if (response.statusCode == 200) {
        if (kDebugMode) {
          print(response.data.runtimeType);
        }
        Map<String, dynamic> data = response.data as Map<String, dynamic>;
        Map<String, dynamic> map = data["success"];
        String userToken = map["token"];
        Map<String, dynamic> user = data["user"] as Map<String, dynamic>;
        String userData = jsonEncode(user);
        await sharedPrefsGlobal.saveData(SharedPrefKeys.user, userData);
        await sharedPrefsGlobal.saveData(SharedPrefKeys.userToken, userToken);
        return true;
      }
      return false;
    } on DioException catch (e) {
      String error = "";
      if (e.response != null) {
        log(e.response!.data);
        final Map<String, dynamic> data = e.response!.data;
        data.forEach((key, value) {
          error += value[0];
        });
      }

      return error;
    }
  }

  Future<bool> forgotPassword(String email) async {
    try {
      dynamic token =
          await sharedPrefsGlobal.getData(SharedPrefKeys.oAuthToken);

      token ??= await getOAuthToken();

      if (kDebugMode) {
        print(token.runtimeType);
      }

      Response response = await dio.post(
        "$_baseUrl/api/password/email",
        data: FormData.fromMap({'email': email}),
        options: Options(
          headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $token",
          },
        ),
      );

      if (kDebugMode) {
        print(response.data.runtimeType);
      }

      Map<String, dynamic> data = response.data as Map<String, dynamic>;

      if (data["message"] == "We have emailed your password reset link!") {
        return true;
      }
      return false;
    } catch (e) {
      // Log or handle any unexpected errors if necessary
      print("Error: $e");

      // Return false for any unexpected errors
      return false;
    }
  }

  Future<bool> checkPasswordCode(String code, String email) async {
    try {
      dynamic token =
          await sharedPrefsGlobal.getData(SharedPrefKeys.oAuthToken);

      token ??= await getOAuthToken();

      FormData formData = FormData.fromMap({
        'param': email,
        'code': code,
      });

      Response response = await Dio().post(
        'https://app.cannacabana.com/api/password/code/check',
        data: formData,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Accept': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        final data = response.data as Map<String, dynamic>;
        final message = data["message"];
        if (message == "passwords.code_is_valid") {
          return true;
        } else {
          return false;
        }
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<bool> resetPassword(
      String code, String password, String passwordConfirmation) async {
    try {
      dynamic token =
          await sharedPrefsGlobal.getData(SharedPrefKeys.oAuthToken);

      token ??= await getOAuthToken();

      FormData formData = FormData.fromMap({
        'code': code,
        'password': password,
        'password_confirmation': passwordConfirmation,
      });

      Response response = await Dio().post(
        'https://app.cannacabana.com/api/password/reset',
        data: formData,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Accept': 'application/json',
          },
        ),
      );

      final data = response.data as Map<String, dynamic>;
      final message = data["message"];
      if (message == "password has been successfully reset") {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      // Handle DioException or other exceptions
      return false;
    }
  }

  Future<List<Store>> getStoreList() async {
    try {
      dynamic token =
          await sharedPrefsGlobal.getData(SharedPrefKeys.oAuthToken);
      if (kDebugMode) {
        print(token.runtimeType);
      }
      token ??= await getOAuthToken();

      Response response = await dio.get("$_baseUrl/api/store/list",
          options: Options(headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $token"
          }));
      List<Store> stores = [];
      if (response.statusCode == 200) {
        if (kDebugMode) {
          print(response.data.runtimeType);
        }
        Map<String, dynamic> data = response.data as Map<String, dynamic>;
        bool success = data["success"];
        if (success) {
          List jsonList = data["data"];
          if (kDebugMode) {
            print(jsonList);
          }
          for (var element in jsonList) {
            try {
              Store store = Store.fromMap(element);
              stores.add(store);
            } catch (e) {
              if (kDebugMode) {
                print(e);
              }
            }
          }
        }
      }
      return stores;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<String> getOAuthToken() async {
    try {
      FormData formData = FormData.fromMap({
        "grant_type": "client_credentials",
        'client_id': "6",
        'client_secret': '4PrN7B5QEgeVc7dNTIeR1j6xvyxQvhMcp28TFAnw',
      });
      Response response = await dio.post("$_baseUrl/api/oauth/token",
          data: formData,
          options: Options(headers: {'Content-Type': 'multipart/form-data'}));

      String token = "";
      if (response.statusCode == 200) {
        if (kDebugMode) {
          print(response.data.runtimeType);
        }
        Map<String, dynamic> data = response.data as Map<String, dynamic>;
        token = data["access_token"];
        await sharedPrefsGlobal.saveData(SharedPrefKeys.oAuthToken, token);
      }
      return token;
    } on DioException catch (e) {
      print(e);
      throw Exception(e.message);
    }
  }

  Future<List<Product>> getProductByStore(int storeId, {int offset = 0}) async {
    try {
      List<Product> products = [];
      dynamic token =
          await sharedPrefsGlobal.getData(SharedPrefKeys.oAuthToken);
      if (kDebugMode) {
        print(token.runtimeType);
      }
      token ??= await getOAuthToken();
      Response response = await dio.get(
          "$_baseUrl/api/products/${storeId.toString()}?offset=${offset.toString()}&per_page=10",
          options: Options(headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $token"
          }));

      if (response.statusCode == 200) {
        if (kDebugMode) {
          print(response.data.runtimeType);
        }
        Map<String, dynamic> data = response.data as Map<String, dynamic>;
        List listJson = data["data"];

        for (var element in listJson) {
          products.add(Product.fromJson(element));
        }
      }
      return products;
    } on DioException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return [];
    }
  }

  Future<List<Product>> getProductByStoreAndCollection(
      int storeId, int collectionId,
      {int offset = 0}) async {
    try {
      List<Product> products = [];
      dynamic token =
          await sharedPrefsGlobal.getData(SharedPrefKeys.oAuthToken);
      if (kDebugMode) {
        print(token.runtimeType);
      }
      token ??= await getOAuthToken();
      Response response = await dio.get(
          "$_baseUrl/api/products/${storeId.toString()}/$collectionId?offset=${offset.toString()}&per_page=10",
          options: Options(headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $token"
          }));

      if (response.statusCode == 200) {
        if (kDebugMode) {
          print(response.data.runtimeType);
        }
        Map<String, dynamic> data = response.data as Map<String, dynamic>;
        List listJson = data["data"];

        for (var element in listJson) {
          products.add(Product.fromJson(element));
        }
      }
      return products;
    } on DioException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return [];
    }
  }

  Future<List<Collection>> getCollectionsByStore(int storeId) async {
    try {
      List<Collection> collections = [];
      dynamic token =
          await sharedPrefsGlobal.getData(SharedPrefKeys.oAuthToken);
      if (kDebugMode) {
        print(token.runtimeType);
      }
      token ??= await getOAuthToken();
      Response response = await dio.get(
          "$_baseUrl/api/collections/${storeId.toString()}",
          options: Options(headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $token"
          }));

      if (response.statusCode == 200) {
        if (kDebugMode) {
          print(response.data.runtimeType);
        }
        Map<String, dynamic> data = response.data as Map<String, dynamic>;
        List listJson = data["data"];

        for (var element in listJson) {
          collections.add(Collection.fromJson(element));
        }
      }
      return collections;
    } on DioException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return [];
    }
  }

  Future<dynamic> updateUserDetails(
    String firstName,
    String lastName,
    String phoneNumber,
    String email,
  ) async {
    try {
      FormData formData = FormData.fromMap({
        'first_name': firstName,
        'last_name': lastName,
        'email': email,
        'phone_number': phoneNumber,
      });
      dynamic token = await sharedPrefsGlobal.getData(SharedPrefKeys.userToken);
      if (token == null || token == '') {
        sharedPrefsGlobal.deleteData();
        Get.offAllNamed(AppRoute.splashScreen);
      }
      // await sharedPrefsGlobal.getData(SharedPrefKeys.oAuthToken);
      if (kDebugMode) {
        print(token.runtimeType);
      }

      Response response = await dio.post("$_baseUrl/api/login",
          data: formData,
          options: Options(headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $token"
          }));

      if (response.statusCode == 200) {
        if (kDebugMode) {
          print(response.data.runtimeType);
        }
        Map<String, dynamic> data = response.data as Map<String, dynamic>;

        Map<String, dynamic> user = data["data"] as Map<String, dynamic>;
        String userData = jsonEncode(user);
        await sharedPrefsGlobal.saveData(SharedPrefKeys.user, userData);
        return true;
      }
      return false;
    } on DioException catch (e) {
      String error = "";
      if (e.response != null) {
        log(e.response!.data);
        final Map<String, dynamic> data = e.response!.data;
        data.forEach((key, value) {
          error += value[0];
        });
      }

      return error;
    }
  }

  Future<String> getTicket() async {
    final String apiUrl = 'https://app.cannacabana.com/api/checkout/get-ticket';
    final String accessToken = sharedPrefsGlobal.getData(
        SharedPrefKeys.userToken); // Replace with your actual access token

    final dio = Dio();

    try {
      final response = await dio.post(
        apiUrl,
        options: Options(
          headers: {
            'Authorization': 'Bearer $accessToken',
          },
        ),
        data: FormData.fromMap({
          'price': '0.01',
          'store_id': '4376',
        }),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = response.data;

        if (data['success'] == true) {
          final String ticket = data['data']['ticket'];
          return ticket;
        } else {
          throw Exception('Error: ${data['message']}');
        }
      } else {
        throw Exception(
            'Failed to fetch ticket. Status Code: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Error: $error');
    }
  }
}
