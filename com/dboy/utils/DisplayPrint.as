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
		private var _display:DisplayObject;
		
		private var _start:String = "=====START======";
		
		private var _end:String = "=====END======";
		
		private var _split:String = "\n";
		
		public function DisplayPrint(display:DisplayObject,startStr:String = null,endStr:String = null,splitStr:String = null)
		{
			_display = display;	
			_start = startStr ? startStr : _start;
			_end = endStr ? endStr : _end;
			_split = splitStr ? splitStr : _split;
		}
		
		/**
		 * 打印所有子对象 
		 * 
		 */		
		public function printTotalElements():void
		{
			var list:Vector.<DisplayObject> = getTotalElementsList();
			var str:String = _start;
			for(var i:int = 0;i < list.length;i++)
			{
				str += _split;
				str += list[i].toString() + " " + list[i].name;
			}
			str += _split + "TOTAL=" + list.length;
			str += _split + _end;
			trace(str)
		}
		
		/**
		 * 返回所有子对象列表 
		 * @return 
		 * 
		 */		
		public function getTotalElementsList():Vector.<DisplayObject>
		{
			var container:DisplayObjectContainer = _display as DisplayObjectContainer;
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