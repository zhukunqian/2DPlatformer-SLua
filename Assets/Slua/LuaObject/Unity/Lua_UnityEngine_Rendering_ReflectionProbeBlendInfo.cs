﻿using UnityEngine;
using System;
using LuaInterface;
using SLua;
using System.Collections.Generic;
public class Lua_UnityEngine_Rendering_ReflectionProbeBlendInfo : LuaObject {
	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static public int constructor(IntPtr l) {
		try {
			UnityEngine.Rendering.ReflectionProbeBlendInfo o;
			o=new UnityEngine.Rendering.ReflectionProbeBlendInfo();
			pushValue(l,o);
			return 1;
		}
		catch(Exception e) {
			LuaDLL.luaL_error(l, e.ToString());
			return 0;
		}
	}
	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static public int get_probe(IntPtr l) {
		try {
			UnityEngine.Rendering.ReflectionProbeBlendInfo self;
			checkType(l,1,out self);
			pushValue(l,self.probe);
			return 1;
		}
		catch(Exception e) {
			LuaDLL.luaL_error(l, e.ToString());
			return 0;
		}
	}
	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static public int set_probe(IntPtr l) {
		try {
			UnityEngine.Rendering.ReflectionProbeBlendInfo self;
			checkType(l,1,out self);
			UnityEngine.ReflectionProbe v;
			checkType(l,2,out v);
			self.probe=v;
			setBack(l,self);
			return 0;
		}
		catch(Exception e) {
			LuaDLL.luaL_error(l, e.ToString());
			return 0;
		}
	}
	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static public int get_weight(IntPtr l) {
		try {
			UnityEngine.Rendering.ReflectionProbeBlendInfo self;
			checkType(l,1,out self);
			pushValue(l,self.weight);
			return 1;
		}
		catch(Exception e) {
			LuaDLL.luaL_error(l, e.ToString());
			return 0;
		}
	}
	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static public int set_weight(IntPtr l) {
		try {
			UnityEngine.Rendering.ReflectionProbeBlendInfo self;
			checkType(l,1,out self);
			System.Single v;
			checkType(l,2,out v);
			self.weight=v;
			setBack(l,self);
			return 0;
		}
		catch(Exception e) {
			LuaDLL.luaL_error(l, e.ToString());
			return 0;
		}
	}
	static public void reg(IntPtr l) {
		getTypeTable(l,"UnityEngine.Rendering.ReflectionProbeBlendInfo");
		addMember(l,"probe",get_probe,set_probe,true);
		addMember(l,"weight",get_weight,set_weight,true);
		createTypeMetatable(l,constructor, typeof(UnityEngine.Rendering.ReflectionProbeBlendInfo),typeof(System.ValueType));
	}
}
