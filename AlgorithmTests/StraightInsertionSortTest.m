//
//  StraightInsertionSortTest.m
//  AlgorithmTest
//
//  Created by Jack on 17/10/2017.
//  Copyright © 2017 Jack. All rights reserved.
//

#import <XCTest/XCTest.h>

// 插入排序复杂度分析：

//从空间上来看，它只需要一个记录的辅助空间，因此关键是看它的时间复杂度。当最好的情况，时间复杂度为O(n)。当最坏的情况，即待排序表示逆序的情况，如{6,5,4,3,2},此时需要比较(n+2)(n-1)/2次，记录的移动次数也达到(n+4)(n-1)/2次。如果排序记录是随机的，那么根据概率相同的原则，平均比较和移动次数约为n2/4次，因此插入排序法的时间复杂度为O(n2)，该排序比冒泡和选择排序的性能要好一些。

@interface StraightInsertionSortTest : XCTestCase

@property (nonatomic, strong) NSMutableArray *testData;

@end

@implementation StraightInsertionSortTest

- (void)setUp {
    [super setUp];
    
    self.testData = @[@16,@1,@2,@9,@7,@12,@5,@3,@8,@13,@10].mutableCopy;
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    NSLog(@"org array: %@", [self.testData componentsJoinedByString:@","]);
    
    for (int i = 0; i < self.testData.count; i++) {
        id temp = self.testData[i];
        
        int j = i;
        while (j > 0 && temp < self.testData[j-1]) {
            self.testData[j] = self.testData[j-1];
            j--;
        }
        self.testData[j] = temp;
    }
    
    NSLog(@"sorted array: %@", [self.testData componentsJoinedByString:@","]);
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
