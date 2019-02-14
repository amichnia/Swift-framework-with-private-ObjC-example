//
//  SwiftToObjectiveC.h
//  FrameworkPrivateExample
//
//  Created by Andrzej Michnia on 14/02/2019.
//  Copyright © 2019 GirAppe Studio. All rights reserved.
//

#ifndef SwiftToObjectiveC_h
#define SwiftToObjectiveC_h

#import <MyFramework/MyFramework-Swift.h>

// Expose internal Swift members
// This code is auto-generated when you make your Swift member public
// You can use it to your advantage to simplify generating this "bridges"

SWIFT_PROTOCOL_NAMED("MyPrivateClassProtocol")
@protocol MyPrivateClassProtocol

@property (nonatomic, readonly, copy) NSString * _Nonnull privateProperty;

- (nonnull instancetype)init;
- (void)doSomethingInternalWithSecretAttribute:(NSInteger)attribute;

@end

// Expose Factory we will use to register classes withing Swift scope
// It actaully needs only one static method to register, passing Class type

SWIFT_CLASS("Factory")
@interface Factory : NSObject

+ (void) registerPrivateClassTypeWithType:(Class <MyPrivateClassProtocol> _Nonnull)type;

@end

#endif /* SwiftToObjectiveC_h */
