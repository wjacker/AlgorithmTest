//
//  ScanLensTest.m
//  AlgorithmTest
//
//  Created by Jack on 6/7/17.
//  Copyright © 2017 Jack. All rights reserved.
//

#import <XCTest/XCTest.h>

//题目描述
//
//在N*M的草地上，提莫种了K个蘑菇，蘑菇爆炸的威力极大，兰博不想贸然去闯，而且蘑菇是隐形的。只 有一种叫做扫描透镜的物品可以扫描出隐形的蘑菇，于是他回了一趟战争学院，买了2个扫描透镜，一个 扫描透镜可以扫描出(3*3)方格中所有的蘑菇，然后兰博就可以清理掉一些隐形的蘑菇。 问：兰博最多可以清理多少个蘑菇？
//
//注意：每个方格被扫描一次只能清除掉一个蘑菇。
//
//输入描述:
//
//第一行三个整数：N，M，K，(1≤N，M≤20，K≤100)，N，M代表了草地的大小；
//接下来K行，每行两个整数x，y(1≤x≤N，1≤y≤M)。代表(x，y)处提莫种了一个蘑菇。
//一个方格可以种无穷个蘑菇。
//
//输出描述:
//
//输出一行，在这一行输出一个整数，代表兰博最多可以清理多少个蘑菇。

@interface MGPoint : NSObject

@property (nonatomic) int x;
@property (nonatomic) int y;
@property (nonatomic, strong) NSString *key;

- (instancetype)initWithString:(NSString *)inputString;

@end


@implementation MGPoint

- (instancetype)initWithString:(NSString *)inputString {
    self = [super init];
    NSArray *inputArray = [inputString componentsSeparatedByCharactersInSet: [NSCharacterSet characterSetWithCharactersInString:@","]];
    self.key = inputString;
    self.x = [inputArray.firstObject intValue];
    self.y = [inputArray.lastObject intValue];
    return self;
}

- (NSString *)description {
    return self.key;
}


@end

@interface ScanLensTest : XCTestCase

@property (nonatomic, strong) NSString *tempFilePath;

@end

@implementation ScanLensTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    NSString *documentDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    self.tempFilePath = [NSString stringWithFormat:@"%@ScanlensTest.txt", documentDir];
    //generate test data
    [[NSFileManager defaultManager] createFileAtPath:self.tempFilePath contents:nil attributes:nil];
    
    NSMutableArray* allInputStrings = [NSMutableArray new];
    int n = arc4random()%20 + 1;
    int m = arc4random()%20 + 1;
    int k = arc4random()%100 + 1;
    
    [allInputStrings addObject:[NSString stringWithFormat:@"%i,%i,%i", n, m, k]];
    for (int index = 1; index <= k; index++) {
        int x = arc4random()%n + 1;
        int y = arc4random()%m + 1;
        [allInputStrings addObject:[NSString stringWithFormat:@"%i,%i", x, y]];
    }
    
    NSString *inputStr = [allInputStrings componentsJoinedByString:@"\n"];
    
    [inputStr writeToFile:self.tempFilePath atomically:YES encoding:NSUTF8StringEncoding error:nil];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    
    [[NSFileManager defaultManager] removeItemAtPath:self.tempFilePath error:nil];
}

- (void)testScanLens {
    NSDate *methodStart = [NSDate date];
    //NSString *filePath = @"scanlens";
    //NSString *fileRoot = [[NSBundle mainBundle] pathForResource:filePath ofType:@"txt"];
    
    // read everything from text
    NSString* fileContents = [NSString stringWithContentsOfFile:self.tempFilePath
                                                       encoding:NSUTF8StringEncoding error:nil];
    
    // first, separate by new line
    NSArray* allInputStrings = [fileContents componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
    
    // then break down even further
    NSString *initParamsStr = [allInputStrings firstObject];
    
    // choose whatever input identity you have decided. in this case ;
    NSArray *initParams = [initParamsStr componentsSeparatedByCharactersInSet: [NSCharacterSet characterSetWithCharactersInString:@","]];
    
    
    
    int n = [initParams[0] intValue];
    int m = [initParams[1] intValue];
    int k = [initParams[2] intValue];
    
    NSMutableArray *pointList = [NSMutableArray new];
    MGPoint *point;
    for (int i = 1; i < [allInputStrings count]; i++) {
        point = [[MGPoint alloc] initWithString:[allInputStrings objectAtIndex:i]];
        [pointList addObject:point];
    }
    
    NSString *output = @"\n";
    for (int x = 1; x <= n; x++) {
        for(int y = 1; y<= m; y++) {
            int count = 0;
            for (MGPoint *point in pointList) {
                if(point.x == x && point.y == y) {
                    count++;
                }
            }
            
            output = [output stringByAppendingString:[NSString stringWithFormat:@"  %i", count]];
        }
        output = [output stringByAppendingString:@"\n"];
    }
    NSLog(@"%@", output);
    
    NSDate *initFinish = [NSDate date];
    NSTimeInterval initTime = [initFinish timeIntervalSinceDate:methodStart];
    NSLog(@"initTime = %f", initTime);
    
    NSArray *resultList;
    resultList = [self findMaxPoint:pointList n:n m:m];
    
    NSInteger maxCount = [resultList count];
    NSLog(@"first:%@", resultList);
    
    [pointList removeObjectsInArray:resultList];
    
    resultList = [self findMaxPoint:pointList n:n m:m];
    NSLog(@"second:%@", resultList);
    maxCount += [resultList count];
    
    NSLog(@"max reulst:%li", (long)maxCount);
    
    NSDate *methodFinish = [NSDate date];
    NSTimeInterval executionTime = [methodFinish timeIntervalSinceDate:initFinish];
    NSLog(@"executionTime = %f", executionTime);
}

- (NSArray *)findMaxPoint:(NSArray *)inputList n:(int)n m:(int)m {
    NSMutableDictionary *temDic = [NSMutableDictionary new];
    NSArray *resultList = @[];
    int mgCount = 0;
    for (int x = 1; x <= n - 2; x++) {
        for(int y = 1; y<= m - 2; y++) {
            [temDic removeAllObjects];
            int tmpCount = 0;
            for (MGPoint *point in inputList) {
                if(point.x >= x && point.x <= x + 2 && point.y >= y && point.y <= y +2 && ![[temDic allKeys] containsObject:point.key]) {
                    [temDic setObject:point forKey:point.key];
                    tmpCount++;
                }
            }
            if(tmpCount >= mgCount) {
                mgCount = tmpCount;
                resultList = [NSArray arrayWithArray:[temDic allValues]];
            }
        }
    }
    return resultList;
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
