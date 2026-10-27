package ǿ
{
   import ǹ.ȇ;
   
   public class ȋ extends ȇ
   {
      
      public function ȋ()
      {
         super(<language>
				<!--加载中的提示信息-->
				<progress en="Loading..." zh-CN="正在加载文件" zh-TW="正在加載檔案" ru="погрузка..."/>
				<!--加载被取消提示信息-->
				<unload en="Unloaded" zh-CN="加载被取消" zh-TW="加載被取消" ru="выгружен"/>
				<!--网络问题提示信息-->
				<ioError en="Net error, please refresh to reload!" zh-CN="加载发生错误，如需重新加载请刷新页面" zh-TW="加載發生錯誤，重新加載請刷新頁面" ru="ошибка ввода-вывода"/>
			</language>
			);
      }
      
      public function get §̐§() : String
      {
         return $get(112,114,111,103,114,101,115,115);
      }
      
      public function get §̑§() : String
      {
         return $get(117,110,108,111,97,100);
      }
      
      public function get §̒§() : String
      {
         return $get(105,111,69,114,114,111,114);
      }
   }
}

