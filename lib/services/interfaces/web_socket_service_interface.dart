import 'dart:async';

/// Callback type for connection events
typedef ConnectionCallback = void Function();

/// Callback type for disconnection events
typedef DisconnectionCallback = void Function(dynamic reason);

/// Callback type for error events
typedef ErrorCallback = void Function(dynamic error);

/// Callback type for message events
typedef MessageCallback = void Function(dynamic message);

/// Interface for WebSocket operations
abstract class WebSocketServiceInterface {
  /// Connects to the WebSocket server with an optional token
  Future<bool> connect([String? token]);
  
  /// Disconnects from the WebSocket server
  Future<void> disconnect();
  
  /// Sends a message to the WebSocket server
  void sendMessage(dynamic message);
  
  /// Stream of messages received from the WebSocket server
  Stream<dynamic> get messageStream;
  
  /// Stream of connection state changes (true = connected, false = disconnected)
  Stream<bool> get connectionStateChanges;
  
  /// Alias for connectionStateChanges for backward compatibility
  Stream<bool> get connectionStateStream;
  
  /// Whether the WebSocket is currently connected
  bool get isConnected;
  
  /// The current authentication token
  String? get token;
  
  /// The WebSocket server URL
  String get url;
  
  /// Whether to automatically reconnect on disconnect
  bool get autoReconnect;
  
  /// Set whether to automatically reconnect on disconnect
  set autoReconnect(bool value);
  
  /// Number of reconnect attempts
  int get reconnectAttempts;
  
  /// Maximum number of reconnect attempts
  int get maxReconnectAttempts;
  
  /// Set maximum number of reconnect attempts
  set maxReconnectAttempts(int value);
  
  /// Reconnect delay
  Duration get reconnectDelay;
  
  /// Set reconnect delay
  set reconnectDelay(Duration delay);
  
  /// Set connection callback
  set onConnect(ConnectionCallback? callback);
  
  /// Set disconnection callback
  set onDisconnect(DisconnectionCallback? callback);
  
  /// Set error callback
  set onError(ErrorCallback? callback);
  
  /// Set message callback
  set onMessage(MessageCallback? callback);
  
  /// Close the WebSocket connection
  Future<void> close({int? code, String? reason});
}
