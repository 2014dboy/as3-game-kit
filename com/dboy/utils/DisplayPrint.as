package com.dboy.utils
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	
	/**
	 * 显示对象打印
	 * @author 2014dboy
	 * 
	 */	
	public class DisplayPrint
	{
		private const START_LINE:String = "=====START======";
		
		private const END_LINE:String = "=====END======";
		
		private const SPLIT:String = "\n";
		
		public function DisplayPrint()
		{
			
		}
		
		/**
		 * 打印所有子对象 
		 * 
		 */		
		public function printTotalElements(display:DisplayObject):void
		{
			var list:Vector.<DisplayObject> = getTotalElementsList(display);
			var str:String = START_LINE;
			for(var i:int = 0;i < list.length;i++)
			{
				str += SPLIT;
				str += list[i].toString() + " " + list[i].name;
			}
			str += SPLIT + "TOTAL=" + list.length;
			str += SPLIT + END_LINE;
			trace(str)
		}
		
		/**
		 * 返回所有子对象列表 
		 * @return 
		 * 
		 */		
		public function getTotalElementsList(display:DisplayObject):Vector.<DisplayObject>
		{
			var container:DisplayObjectContainer = display as DisplayObjectContainer;
			var elementList:Vector.<DisplayObject> = new Vector.<DisplayObject>();
			if(! container)
				return elementList;
			
			//递归遍历
			pushElement(container,elementList);
			return elementList;
		}
		
		private function pushElement(display:DisplayObjectContainer,totalList:Vector.<DisplayObject>):void
		{
			for(var i:int = 0;i < display.numChildren;i++)
			{
				var son:DisplayObject = display.getChildAt(i);
				totalList.push(son);
				if(son is DisplayObjectContainer)
					pushElement(son as DisplayObjectContainer,totalList);
			}
		}
	}
}