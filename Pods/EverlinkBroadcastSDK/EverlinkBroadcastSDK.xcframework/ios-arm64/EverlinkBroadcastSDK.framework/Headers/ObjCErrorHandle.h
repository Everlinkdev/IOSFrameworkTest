//
//  ObjCErrorHandle.h
//  Everlink tech demo
//
//  Created by Nathan Kuruvilla on 16/06/2024.
//

#import <Foundation/Foundation.h>

@interface ObjCErrorHandle : NSObject

+ (BOOL)catchException:(void(^)(void))tryBlock error:(__autoreleasing NSError **)error;

@end
