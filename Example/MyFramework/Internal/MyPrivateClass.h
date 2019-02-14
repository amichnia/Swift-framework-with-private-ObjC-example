//
//  MyPrivateClass.h
//  MyFramework
//
//  Created by Andrzej Michnia on 14/02/2019.
//  Copyright © 2019 GirAppe Studio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SwiftToObjectiveC.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyPrivateClass : NSObject<MyPrivateClassProtocol>

@property (nonatomic, readonly, copy) NSString* privateProperty;

- (void) doSomethingInternalWithSecretAttribute:(NSInteger)attribute;

@end

NS_ASSUME_NONNULL_END
