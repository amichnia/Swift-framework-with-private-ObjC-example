//
//  MyPrivateClass.m
//  MyFramework
//
//  Created by Andrzej Michnia on 14/02/2019.
//  Copyright © 2019 GirAppe Studio. All rights reserved.
//

#import "MyPrivateClass.h"

@implementation MyPrivateClass

@synthesize privateProperty;

+ (void)load {
    // Use it to register self class in the "Swift world"
    [Factory registerPrivateClassTypeWithType:[MyPrivateClass class]];
}

- (void)doSomethingInternalWithSecretAttribute:(NSInteger)attribute {
    NSLog(@"INTERNAL METHOD CALLED WITH SUCCESS %ld", (long)attribute);
}

@end
