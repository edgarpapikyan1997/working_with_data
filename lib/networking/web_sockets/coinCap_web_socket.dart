import 'package:web_socket_channel/web_socket_channel.dart';

class CoinCapSocket {
  final coinCapChannel = WebSocketChannel.connect(
      Uri.parse('wss://stream.binance.com:9443/ws/etheur@trade'));

}

/// api key Your key: 13770158-e520-4113-a424-6155998a8b03
///
// const tradeWs = new WebSocket('wss://ws.coincap.io/trades/binance')
//
// tradeWs.onmessage =function(msg) {
//   console.log(msg.data)
// }</
