//
//  FoundationMacro.h
//  Yingke
//
//  Created by mayw on 2016/11/7.
//  Copyright © 2016年 mayw. All rights reserved.
//

#ifndef FoundationMacro_h
#define FoundationMacro_h

// NSLog
#ifndef __OPTIMIZE__
#define NSLog(...) NSLog(__VA_ARGS__)
#else
#define NSLog(...)
#endif

// Weak Strong
#define WEAKSELF typeof(self) __weak weakSelf = self;
#define STRONGSELF typeof(self) __strong strongSelf = self;

// Singletion
#define DISPATCH_ONCE_CLASS \
static id shared = nil; \
\
+ (instancetype)shared \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
shared = [[self alloc] init]; \
}); \
return shared; \
} \
\
+ (instancetype)allocWithZone:(struct _NSZone *)zone \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
shared = [super allocWithZone:zone]; \
}); \
return shared; \
} \

#define SuppressPerformSelectorLeakWarning(Stuff) \
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
Stuff; \
_Pragma("clang diagnostic pop") \
} while (0)

#endif /* FoundationMacro_h */
