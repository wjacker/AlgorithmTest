//
//  QuickSortTest.m
//  AlgorithmTests
//
//  Created by Jack on 22/02/2018.
//  Copyright © 2018 Jack. All rights reserved.
//

#import <XCTest/XCTest.h>

//快速排序（Quicksort）是对冒泡排序的一种改进。
//快速排序由C. A. R. Hoare在1962年提出。它的基本思想是：通过一趟排序将要排序的数据分割成独立的两部分，其中一部分的所有数据都比另外一部分的所有数据都要小，然后再按此方法对这两部分数据分别进行快速排序，整个排序过程可以递归进行，以此达到整个数据变成有序序列。

@interface QuickSortTest : XCTestCase

@property (nonatomic, strong) NSMutableArray *testData;

@end

@implementation QuickSortTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    self.testData = @[@16,@1,@2,@9,@7,@12,@5,@3,@8,@13,@10].mutableCopy;
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    
    [self quickSort:self.testData];
    
}

- (NSArray *)quickSort:(NSArray *)inputArr {
    if(inputArr == nil || inputArr.count <= 0) {
        NSLog(@"输入数组为空或无效");
        return nil;
    }
    
    NSMutableArray *results = [inputArr mutableCopy];
    [self quickSort:results low:0 high:[results count] - 1];
    
    NSLog(@"New Array: %@", [results componentsJoinedByString:@","]);
    return results;
}

- (void)quickSort:(NSMutableArray *)inputArr low:(int)low high:(int)high {
    int i = low;
    int j = high;
    if(i >= j) {
        return;
    }
    
    float key = [[inputArr objectAtIndex:low] floatValue];
    
    while (i < j) {
        while (i < j && [[inputArr objectAtIndex:j] floatValue] >= key ) {
            j--;
        }
        [inputArr setObject:[inputArr objectAtIndex:j] atIndexedSubscript:i];
        while (i < j && [[inputArr objectAtIndex:i] floatValue] <= key ) {
            i++;
        }
        [inputArr setObject:[inputArr objectAtIndex:i] atIndexedSubscript:j];
    }
    [inputArr setObject:[NSNumber numberWithFloat:key] atIndexedSubscript:i];
    
    [self quickSort:inputArr low:low high:i-1];
    [self quickSort:inputArr low:j+1 high:high];
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
