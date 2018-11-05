//
//  ViewControllerA.m
//  AlgorithmTest
//
//  Created by Jack on 12/12/2017.
//  Copyright © 2017 Jack. All rights reserved.
//

#import "ViewController+A.h"

@implementation ViewController(A)

+ (void)classTrace {
    NSLog(@"%s", __PRETTY_FUNCTION__);
}

- (void)trace {
    NSLog(@"%s", __PRETTY_FUNCTION__);
}

@end
