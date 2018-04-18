//
//  ViewController.m
//  NSSetTask
//
//  Created by lizaveta shulskaya on 18.04.2018.
//  Copyright © 2018 lizaveta shulskaya. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    // Use NSSet to exclude duplicates from array
    //............................................................................................
    NSAutoreleasePool *myPool = [[NSAutoreleasePool alloc] init];
    NSMutableArray *array = [[NSMutableArray alloc] init];
    for (int i = 0; i < 10; i++) {
    [array addObject:[NSNumber numberWithInteger: i]];
    [array addObject:[NSNumber numberWithInteger: i]];
    }
    NSLog(@"%@", array);
    NSSet *set = [[NSSet setWithArray: array] copy];
    NSLog(@"%@", set);
     
    // Check what is faster: Create an array of 100 numbers. Check whether number 74 is contained inside an array. Transform array into NSSet and check whether number 74 is contained inside NSSet.
    //............................................................................................
    NSMutableArray *mutableArray = [[NSMutableArray alloc] init];
    for(int i = 0; i < 100; i++) {
        [mutableArray addObject:[NSNumber numberWithInteger:i]];
    }
    
    // Time for array //0.000020
    double startTime = CACurrentMediaTime();
    NSLog(@"Time for array: %f", (unsigned long)[mutableArray indexOfObject:[NSNumber numberWithInteger:74]],
          CACurrentMediaTime() - startTime);
    
    // Time for set //0.000001
    NSSet *mySet = [[NSSet setWithArray:mutableArray] copy];
    startTime = CACurrentMediaTime();
    NSLog(@"Time for set: %f", [mySet containsObject:[NSNumber numberWithInteger:74]] ? @"YES": @"NO",
          CACurrentMediaTime() - startTime);
    
    [myPool release];
    [array release];
    [mutableArray release];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
