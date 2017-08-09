//
//  AlgorithmTests.m
//  AlgorithmTests
//
//  Created by Jack on 6/7/17.
//  Copyright © 2017 Jack. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <UIKit/UIKit.h>

@interface StringTestObject:NSObject

@property (nonatomic, strong) NSString *strStrong;

@property (nonatomic, copy) NSString *strCopy;

@end

@implementation StringTestObject

@end

@interface AlgorithmTests : XCTestCase

@end

@implementation AlgorithmTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    
    NSString *string1 = @"abc";
    NSString *string2 = @"abc";
    
    NSString *stringCopy = [string1 copy];
    NSMutableString *stringMCopy = [string1 mutableCopy];
    NSLog(@"string1: %p, %p", string1, &string1);
    NSLog(@"string1: %p, string2: %p", string1, string2);
    NSLog(@"stringCopy: %p, %p", stringCopy, &stringCopy);
    NSLog(@"stringMCopy: %p, %p", stringMCopy, &stringMCopy);
    
    
    NSString *element_01 = @"abc";
    NSString *element_02 = @"def";
    NSString *element_03 = @"ghi";
    NSMutableArray *array = [NSMutableArray arrayWithArray:@[element_01, element_02, element_03]];
    
    NSArray *arrayCopy = [array copy];
    NSMutableArray *arrayMCopy = [array mutableCopy];
    
    NSLog(@"array: %p, %p; array.firstObject: %p", array, &array, array.firstObject);
    NSLog(@"arrayCopy: %p, %p; arrayCopy.firstObject: %p", arrayCopy, &arrayCopy, arrayCopy.firstObject);
    NSLog(@"arrayMCopy: %p, %p; arrayMCopy.firstObject: %p", arrayMCopy, &arrayMCopy, arrayMCopy.firstObject);
    
    
    NSMutableString *string = [NSMutableString stringWithFormat:@"abc"];
    StringTestObject *testStr = [StringTestObject new];
    
    testStr.strStrong = string;
    testStr.strCopy = string;
    NSLog(@"strStrong: %@", testStr.strStrong);
    NSLog(@"strCopy: %@", testStr.strCopy);
    
    [string appendFormat:@"def"];
    NSLog(@"strStrong: %@", testStr.strStrong);
    NSLog(@"strCopy: %@", testStr.strCopy);
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
