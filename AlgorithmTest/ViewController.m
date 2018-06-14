//
//  ViewController.m
//  AlgorithmTest
//
//  Created by Jack on 6/6/17.
//  Copyright © 2017 Jack. All rights reserved.
//

#import "ViewController.h"
//#import "UIViewController+A.h"
//#import "ViewController+A.h"
#import "ViewController+B.h"

#import "FinalClass.h"
#import <QuickLook/QuickLook.h>

@interface ViewController ()<QLPreviewControllerDataSource, QLPreviewControllerDelegate>

@property (nonatomic, strong) NSString *target;
@property (nonatomic, copy) void(^testBlock)();


@end


@implementation ViewController

NSString *const testStringConst = @"1234";
NSString const *testConstString = @"1234";
NSString *testString;

- (void)testMethod {
//    testStringConst = @"qee";
    
    //打印对象的内存地址
//    NSLog(@"testString 内存地址1：%p",@"1234);
    
//    testString = @"sdf";
    //打印对象的内存地址
    NSLog(@"testString2 内存地址1：%p",testConstString);
    
    testConstString = @"qwe";
    //打印对象的内存地址
    NSLog(@"testString2 内存地址1：%p",testConstString);
    
    testString = testStringConst;
//    testString = testConstString;
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    NSString *a = [self testMethod];
    if(0) {
        NSLog(@"===");
    } else {
        NSLog(@"=else=");
    }
    
    int i = 10;
    NSLog(@"%i", (i == 10) && 3);
    
//    NSMutableString *mStr = [@"123" mutableCopy];
//    self.target = mStr;
//    [mStr appendString:@"456"];
//    NSLog(@"%@", self.target);
    
//    [FinalClass new];
//    
//    [FinalClass new];
    
//    [self trace];
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
    
    
    //....
//    dispatch_queue_t queue = dispatch_queue_create("parallel", DISPATCH_QUEUE_CONCURRENT);
//    for (int i = 0; i < 200 ; i++) {
//        dispatch_async(queue, ^{
//            self.target = [NSString stringWithFormat:@"ksddkjalkjd%d",i];
//            NSLog(@"%@", self.target);
//        });
//    }
    
//    dispatch_queue_t concurrentQueue = dispatch_queue_create("com.gcd.concurrentQueue", DISPATCH_QUEUE_CONCURRENT);
//    dispatch_semaphore_t semaphore = dispatch_semaphore_create(2);
//    __block NSString *strTest = @"test";
//    
//    dispatch_async(concurrentQueue, ^{
//        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
//        if ([strTest isEqualToString:@"test"]) {
//            NSLog(@"--%@--1-", strTest);
//            [NSThread sleepForTimeInterval:1];
//            if ([strTest isEqualToString:@"test"]) {
//                [NSThread sleepForTimeInterval:1];
//                NSLog(@"--%@--2-", strTest);
//            } else {
//                NSLog(@"====changed===");
//            }
//        }
//        dispatch_semaphore_signal(semaphore);
//    });
//    dispatch_async(concurrentQueue, ^{
//        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
//        NSLog(@"--%@--3-", strTest);
//        dispatch_semaphore_signal(semaphore);
//    });
//    dispatch_async(concurrentQueue, ^{
//        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
//        strTest = @"modify";
//        NSLog(@"--%@--4-", strTest);
//        dispatch_semaphore_signal(semaphore);
//    });
//    dispatch_async(concurrentQueue, ^{
//        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
//        NSLog(@"--%@--5-", strTest);
//        dispatch_semaphore_signal(semaphore);
//    });
}


- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
//    if ([QLPreviewController canPreviewItem:[[NSBundle mainBundle] URLForResource:@"test" withExtension:@"pdf"]])
//    {
//        QLPreviewController *previewController = [[QLPreviewController alloc] init];
//        previewController.dataSource = self;
//        [self addChildViewController:previewController];
//        [self.view addSubview:previewController.view];
//        [previewController didMoveToParentViewController:self];
//    }
}

-(NSInteger) numberOfPreviewItemsInPreviewController:(QLPreviewController *)controller
{
    return 1;
}

- (id <QLPreviewItem>)previewController:(QLPreviewController *)controller previewItemAtIndex:(NSInteger)index
{
    NSURL *pdfURL = [[NSBundle mainBundle] URLForResource:@"test" withExtension:@"pdf"];
    return pdfURL;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (void)trace {
//    NSLog(@"ViewController");
//}

@end
