//
//  ViewController.m
//  FFPredicateDemo
//
//  Created by 黄鹏飞 on 16/2/25.
//  Copyright © 2016年 黄鹏飞. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
@property NSString *firstName;
@property NSString *lastName;
@property NSNumber *age;
@end

@implementation Person

- (NSString *)description {
    return [NSString stringWithFormat:@"%@ %@", self.firstName, self.lastName];
}

@end


#import "ViewController.h"

@interface ViewController ()
@property (strong,nonatomic) NSMutableArray *personArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self test2];
}

- (void)test{
    NSArray *arr = @[@"hah",@"abcdh",@"abhaha",@"",@"xigua"];
    NSString *fileStr1 = @"h";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"self CONTAINS %@",fileStr1];
    NSLog(@"predicate :%@",[arr filteredArrayUsingPredicate:predicate]);
}

#pragma  mark -- 过滤数组
- (void)test1{
    NSArray *firstNames = @[ @"Alice", @"Bob", @"Charlie", @"Quentin" ];
    NSArray *lastNames = @[ @"Smith", @"Jones", @"Smith", @"Alberts" ];
    NSArray *ages = @[@24, @27, @33, @31];
    self.personArray = [NSMutableArray array];
    [firstNames enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        Person *person = [[Person alloc] init];
        person.firstName = firstNames[idx];
        person.lastName = lastNames[idx];
        person.age = ages[idx];
        [self.personArray addObject:person];
    }];

    NSPredicate *bobPredicate = [NSPredicate predicateWithFormat:@"firstName = 'Bob'"];
    NSPredicate *smithPredicate = [NSPredicate predicateWithFormat:@"lastName = %@", @"Smith"];
    NSPredicate *thirtiesPredicate = [NSPredicate predicateWithFormat:@"age >= 30"];
    
    NSLog(@"Bobs: %@", [self.personArray filteredArrayUsingPredicate:bobPredicate]);
    
    NSLog(@"Smiths: %@", [self.personArray filteredArrayUsingPredicate:smithPredicate]);
    
    NSLog(@"30's: %@", [self.personArray filteredArrayUsingPredicate:thirtiesPredicate]);
    
    NSLog(@"============================================================");
}

- (void)test2{
    NSArray *firstNames = @[ @"Alice", @"Bob", @"Charlie", @"Quentin" ];
    NSArray *lastNames = @[ @"Smith", @"Jones", @"Smith", @"Alberts" ];
    NSArray *ages = @[@24, @27, @33, @31];
    self.personArray = [NSMutableArray array];
    [firstNames enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        Person *person = [[Person alloc] init];
        person.firstName = firstNames[idx];
        person.lastName = lastNames[idx];
        person.age = ages[idx];
        [self.personArray addObject:person];
    }];
    
   NSPredicate *blockPredicate = [NSPredicate predicateWithBlock:^BOOL(id  _Nonnull evaluatedObject, NSDictionary<NSString *,id> * _Nullable bindings) {
        
        return [evaluatedObject firstName].length < 5;
    }];
    
     NSLog(@"blockPredicate :%@", [self.personArray filteredArrayUsingPredicate:blockPredicate]);
    NSLog(@"============================================================");
}

@end
