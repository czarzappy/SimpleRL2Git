/*
 * Copyright (c) 2009 the original author or authors
 *
 * Permission is hereby granted to use, modify, and distribute this file
 * in accordance with the terms of the license agreement accompanying it.
 */

package simple.common.utilities.modular.mvcs
{
	import org.robotlegs.mvcs.Mediator;
	import simple.common.utilities.modular.core.IModuleEventDispatcher;
	import simple.common.utilities.modular.core.IModuleCommandMap;
	
	import flash.events.Event;
	
	public class ModuleMediator extends Mediator
	{
		[Inject]
		public var moduleDispatcher:IModuleEventDispatcher;
	   		
		[Inject]
		public var moduleCommandMap:IModuleCommandMap;
	                                                                   
	
		// Helper functions for passing events between / around modules
		protected function redispatchToModules(e:Event):void{
			moduleDispatcher.dispatchEvent(e);
		}
	
		protected function redispatchInternally(e:Event):void{
			// you could equally use the dispatch(e) helper, but sometimes longhand offers clarity
			eventDispatcher.dispatchEvent(e);
		}

                // extra sugar to reduce boilerplate on the transfer of events
                protected function mapRedispatchInternally(eventType:String):void{
			eventMap.mapListener(moduleDispatcher, eventType, redispatchInternally);
		}
		
		protected function mapRedispatchToModules(eventType:String):void{
			eventMap.mapListener(eventDispatcher, eventType, redispatchToModules);
		}

	
	}
	
}