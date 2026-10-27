package net.play5d.game.bvn.net
{
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.Socket;
   import flash.utils.ByteArray;
   import flash.utils.Endian;

   // Nối tới bộ chuyển tiếp (relay) của phòng. Khung tin: [độ dài u16][loại u8][nội dung]; relay thêm byte "người gửi".
   public class NetClient
   {
      public static const RELAY:int = 255;
      public static const CMD_OPEN_LAN:int = 0xF0;
      public static const CMD_CLOSE_LAN:int = 0xF1;

      public var onConnect:Function;
      public var onClose:Function;
      public var onMessage:Function;

      public var myIndex:int = -1;
      public var maxPlayers:int = 0;
      public var peers:Array = [];

      private var _sock:Socket;
      private var _buf:ByteArray;
      private var _closed:Boolean = false;

      // Lưu ý: không khởi tạo thuộc tính bằng `new` ở cấp class, trình biên dịch JPEXS sinh mã sai chỗ đó.
      public function NetClient()
      {
         super();
         _buf = new ByteArray();
      }

      public function get connected() : Boolean
      {
         return _sock != null && _sock.connected && !_closed;
      }

      public function connect(param1:String, param2:int) : void
      {
         _closed = false;
         _sock = new Socket();
         _sock.endian = Endian.BIG_ENDIAN;
         _sock.addEventListener(Event.CONNECT,connectHandler);
         _sock.addEventListener(Event.CLOSE,closeHandler);
         _sock.addEventListener(IOErrorEvent.IO_ERROR,errorHandler);
         _sock.addEventListener(SecurityErrorEvent.SECURITY_ERROR,errorHandler);
         _sock.addEventListener(ProgressEvent.SOCKET_DATA,dataHandler);
         _sock.connect(param1,param2);
      }

      public function close() : void
      {
         _closed = true;
         if(_sock)
         {
            try
            {
               _sock.close();
            }
            catch(e:Error)
            {
            }
            _sock = null;
         }
      }

      public function send(param1:int, param2:ByteArray = null) : void
      {
         if(!connected)
         {
            return;
         }
         var n:int = param2 ? param2.length : 0;
         _sock.writeShort(n + 1);
         _sock.writeByte(param1);
         if(n > 0)
         {
            _sock.writeBytes(param2,0,n);
         }
         _sock.flush();
      }

      public function sendCommand(param1:int) : void
      {
         send(param1);
      }

      private function connectHandler(param1:Event) : void
      {
         if(onConnect != null)
         {
            onConnect();
         }
      }

      private function closeHandler(param1:Event) : void
      {
         fireClose("Mất kết nối");
      }

      private function errorHandler(param1:Event) : void
      {
         fireClose("Không kết nối được");
      }

      private function fireClose(param1:String) : void
      {
         if(_closed)
         {
            return;
         }
         _closed = true;
         if(onClose != null)
         {
            onClose(param1);
         }
      }

      private function dataHandler(param1:ProgressEvent) : void
      {
         if(!_sock)
         {
            return;
         }
         var chunk:ByteArray = new ByteArray();
         _sock.readBytes(chunk,0,_sock.bytesAvailable);
         _buf.position = _buf.length;
         _buf.writeBytes(chunk);
         _buf.position = 0;
         while(_buf.bytesAvailable >= 2)
         {
            var len:int = _buf.readUnsignedShort();
            if(_buf.bytesAvailable < len)
            {
               _buf.position -= 2;
               break;
            }
            var from:int = _buf.readUnsignedByte();
            var type:int = len > 1 ? _buf.readUnsignedByte() : 0;
            var body:ByteArray = new ByteArray();
            if(len > 2)
            {
               _buf.readBytes(body,0,len - 2);
            }
            handle(from,type,body);
         }
         var rest:ByteArray = new ByteArray();
         if(_buf.bytesAvailable > 0)
         {
            _buf.readBytes(rest,0,_buf.bytesAvailable);
         }
         _buf = rest;
      }

      private function handle(param1:int, param2:int, param3:ByteArray) : void
      {
         if(param1 == RELAY)
         {
            if(param2 == 1)
            {
               myIndex = param3.readUnsignedByte();
               maxPlayers = param3.readUnsignedByte();
            }
            else if(param2 == 2)
            {
               var j:int = param3.readUnsignedByte();
               if(peers.indexOf(j) == -1)
               {
                  peers.push(j);
               }
            }
            else if(param2 == 3)
            {
               var l:int = param3.readUnsignedByte();
               var k:int = peers.indexOf(l);
               if(k != -1)
               {
                  peers.splice(k,1);
               }
            }
            param3.position = 0;
         }
         if(onMessage != null)
         {
            onMessage(param1,param2,param3);
         }
      }
   }
}
