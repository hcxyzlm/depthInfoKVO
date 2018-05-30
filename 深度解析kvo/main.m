//
//  main.m
//  深度解析kvo
//
//  Created by zhuo on 2018/5/29.
//  Copyright © 2018年 zhuo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TargetObject.h"
#import "ServerObject.h"
#import <objc/runtime.h>

static void PrintDescription(NSString * name, id obj);
/*
 kvo 实现原理
 会创建一个NSKVONotifying_ClassObject的一个派生类
 1. 当一个类对象被观察时， 系统会在动态运行时动态创建一个类，在这个派生类重写属性的setter方法
 2. 可以使用swizzle的方式，查看运行时创建的类是什么
 **/

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        TargetObject *target = [[TargetObject alloc] init];
        target.value = 5;
        
        ServerObject *observer =[[ServerObject alloc] init];
        
        [target addObserver:observer forKeyPath:@"value" options:NSKeyValueObservingOptionNew context:nil];
        
        PrintDescription(@"traget", target);
        
        target.value = 6;
        
        Class instanceclas = object_getClass(target);
        PrintDescription(@"traget", instanceclas);
    }
    return 0;
}

static NSArray * ClassMethodNames(Class c)

{
    
    NSMutableArray * array = [NSMutableArray array];
    
    unsigned int methodCount = 0;
    
    Method * methodList = class_copyMethodList(c, &methodCount);
    
    unsigned int i;
    
    for(i = 0; i < methodCount; i++) {
        
        [array addObject: NSStringFromSelector(method_getName(methodList
                                                              
                                                              [i]))];
        
    }
    
    free(methodList);
    
    return array;
    
}

static void PrintDescription(NSString * name, id obj) {
    
    Class instanceclas = object_getClass(obj);
    Class class = objc_getMetaClass(NSStringFromClass([obj class]).UTF8String);
    NSString *str = [NSString stringWithFormat:@"\n\t%@: %@\n\tobjectName= %s, \nimplement methods=%@,\n libobjc%@", name, obj, class_getName([obj class]),ClassMethodNames(class), NSStringFromClass(instanceclas)];
    
    //    NSString * str = [NSString stringWithFormat:
    //                      @"\n\t%@: %@\n\tNSObject class %s\n\tlibobjc class %s\n\t implements methods <%@>",
    //                      name,
    //                      obj,
    //                      class_getName([obj class]),
    //                      [ClassMethodNames(objc_getMetaClass(NSStringFromClass(obj.clas))) componentsJoinedByString:@","]];
    NSLog(@"%@", str);
    //
}
