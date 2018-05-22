//
//  SuperObject.m
//  AlgorithmTest
//
//  Created by Jack on 22/05/2018.
//  Copyright © 2018 Jack. All rights reserved.
//

#import "SuperClass.h"

@implementation SuperClass

+(void)load {
    NSLog(@"%s", __PRETTY_FUNCTION__);
}

+(void)initialize {
    NSLog(@"%s", __PRETTY_FUNCTION__);
}

@end
