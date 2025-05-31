import 'dart:async';
import 'package:flutter/foundation.dart';

/// Interface for authentication-related operations
abstract class AuthServiceInterface with ChangeNotifier {
  /// Restore session from secure storage
  Future<void> restoreSession();
  
  /// Login with username and password
  Future<Map<String, dynamic>> login(String username, String password);
  
  /// Logout the current user
  Future<void> logout();
  
  /// Check if user is authenticated
  bool get isAuthenticated;
  
  /// Get current username
  String? get username;
  
  /// Get current authentication token
  String? get authToken;
  
  /// Stream of authentication state changes
  Stream<bool> get authStateChanges;
  
  /// Stream of WebSocket messages
  Stream<Map<String, dynamic>> get webSocketMessages;
  
  /// Stream of connection state changes
  Stream<bool> get connectionStateChanges;
}
