//
//  ViewController.m
//  AlgorithmTest
//
//  Created by Jack on 6/6/17.
//  Copyright © 2017 Jack. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    
//    dispatch_semaphore_t signal;
//    signal = dispatch_semaphore_create(3);
//    
//    dispatch_queue_attr_t priorityAttr = dispatch_queue_attr_make_with_qos_class (DISPATCH_QUEUE_SERIAL, QOS_CLASS_UTILITY,-1);
//    
//    dispatch_queue_t queue = dispatch_queue_create("test.queue", priorityAttr);
//    
//    dispatch_sync(queue, ^{
//        sleep(300);
//        NSLog(@"Semaphore 1");
//        dispatch_semaphore_signal(signal);
//        
//        sleep(300);
//        NSLog(@"Semaphore 2");
//        dispatch_semaphore_signal(signal);
//        
//        sleep(300);
//        NSLog(@"Semaphore 3");
//        dispatch_semaphore_signal(signal);
//    });
//    
//    NSLog(@"Wait");
//    dispatch_semaphore_wait(signal, DISPATCH_TIME_FOREVER);
//    
//    NSLog(@"Complete");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
