//
//  NSIndexPath+AddProperty.m
//  ChangeRowHeight
//
//  Created by 李阳 on 16/1/2016.
//  Copyright © 2016 LiChunYang. All rights reserved.
//

#import "NSIndexPath+AddProperty.h"
#import <objc/runtime.h>

static const char * __isOpen = "__isOpen";

@implementation NSIndexPath (AddProperty)

- (void)setIsOpen:(BOOL)isOpen {
    objc_setAssociatedObject(self, __isOpen, @(isOpen), OBJC_ASSOCIATION_ASSIGN);
}

- (BOOL)isOpen {
    NSNumber * number = objc_getAssociatedObject(self, __isOpen);
    return [number boolValue];
}

@end
