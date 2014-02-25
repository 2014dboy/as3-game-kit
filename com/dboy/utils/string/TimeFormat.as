package com.dboy.utils.string
{
	
	/**
	 * 时间字符串格式化
	 * @author 2014dboy
	 * 
	 */	
	public class TimeFormat
	{
		public function TimeFormat()
		{
			
		}
		
		/**
		 * 格式化秒 
		 * @param seconds 秒
		 * @return 00:00:00
		 * 
		 */		
		public function formatTime(seconds:uint):String
		{
			var h:uint = seconds / 3600;
			var m:uint = (seconds % 3600) / 60;
			var s:uint = seconds % 60;
			var fillFormat:FillFormat = new FillFormat();
			return fillFormat.fillZero(h,2) + ":" + fillFormat.fillZero(m,2) + ":" + fillFormat.fillZero(s,2);
		}
	}
}