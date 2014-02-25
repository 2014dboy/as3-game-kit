package com.dboy.utils.string
{
	import flash.utils.Endian;
	
	/**
	 * 字符填充
	 * @author 2014dboy
	 * 
	 */	
	public class FillFormat
	{
		public function FillFormat()
		{
			
		}
		
		/**
		 * 字符填充
		 * 输入12、0、4，输出0012
		 *  
		 * @param str 原字符串
		 * @param fillStr 填充字符串
		 * @param fillNum 填充数量
		 * @param endin BIG_ENDIAN
		 * @return 新字符串 
		 * 
		 */		
		public function fill(str:String,fillStr:String,fillNum:int,endin:String = null):String
		{
			var addStr:String = "";
			
			for(var i:int = 0;i < fillNum;i++)
			{
				addStr += fillStr;
			}
			
			if(! endin || endin == Endian.BIG_ENDIAN)
			{
				return  addStr + str;
			}
			else
			{
				return  str + addStr;
			}
		}
		
		/**
		 * 零位填充 12 -> 0012 
		 * @param num 原数
		 * @param totalNum 总位数
		 * @return 新字符串
		 * 
		 */		
		public function fillZero(num:uint,totalNum:int):String
		{
			var str:String = num.toString();
			var sl:int = str.length;
			if(totalNum <= sl)
				return str;
				
			return fill(str,"0",totalNum - sl);
		}
	}
}