import 'package:graphql/client.dart';

abstract class RemoteConstants {
  
  static final String _token = "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJTdWJqZWN0IjoiYzg4MDk0NTgtZDc2NS00Y2Y4LWI0OTEtZjM0YWU1N2VhNDk3IiwiU3RlYW1JZCI6Ijg2OTkyMzQ2IiwibmJmIjoxNzM5OTk2MzU0LCJleHAiOjE3NzE1MzIzNTQsImlhdCI6MTczOTk5NjM1NCwiaXNzIjoiaHR0cHM6Ly9hcGkuc3RyYXR6LmNvbSJ9.ovbvxJAahx1bHd8b8V-YbOuWDFsaG0bw-HT-88Cn808";
  static get token => _token;
  static final HttpLink apiLink = HttpLink(
    "https://api.stratz.com/graphql",
    defaultHeaders: {
      'Authorization': token,
      'Content-Type': "application/json",
      'User-Agent': 'STRATZ_API'
    },
  );
}