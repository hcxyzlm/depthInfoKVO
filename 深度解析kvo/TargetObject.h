//
//  TargetObject.h
//  深度解析kvo
//
//  Created by zhuo on 2018/5/29.
//  Copyright © 2018年 zhuo. All rights reserved.
//

#import <Foundation/Foundation.h>


// 手动实现键值观察， 1. 重写seter方法，调用willChangeValueForKey和didChangeValueForKey
// 2.automaticallyNotifiesObserversForKey,监听减值的key= value

@interface TargetObject : NSObject

@property (nonatomic,assign) NSInteger value; // kvo的值

@end
