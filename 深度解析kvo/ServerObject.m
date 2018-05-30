//
//  ServerObject.m
//  深度解析kvo
//
//  Created by zhuo on 2018/5/29.
//  Copyright © 2018年 zhuo. All rights reserved.
//

#import "ServerObject.h"

@implementation ServerObject

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"value"]) {
        NSLog(@"value的值为%@", change[NSKeyValueChangeNewKey]);
    } else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}


@end
