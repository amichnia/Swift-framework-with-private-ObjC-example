# Swift framework with a private Objective-C classes. The "Good", the "Bad", and the "Ugly".

I was recently working on a closed source Swift framework. Unluckily, some parts of the code were in Objective C (relying on pure C libraries). In this article I will highlight some of the problems when having frameworks with mixed Swift/ObjC code. I will show some approaches I tried when struggling to make ObjC code internal. Making it invisible to the framework users, but still accessible from Swift code gave me a serious headache. And I will share a solution that finally worked out in my case.

## The Problem

There are a lot of articles and tutorials about Swift/ObjC interoperability, but they rarely focus on frameworks targets. It seems that even when you have it in place, it is still close to impossible to effectively hide your Objective C part from framework users (at least as long as you want to expose it to the Swift part).

Let's assume you created a framework, named **MyFramework**, with following members:

```objc
// MyVeryPrivateClass.h

@interface MyVeryPrivateClass: NSObject

- (void) doSomethingImportantWithAttribute:(NSInteger) attribute;

@end
```

```swift
// MyPublicClass.swift

public class MyPublicClass {
    private var privateClass: MyVeryPrivateClass?

    ...

    func doSomethingWithPrivateClass() {
        privateClass?.doSomethingImportant(withAttribute: 2)
    }
}
```

Our Swift class depends on Objective C class, so it needs to know about it somehow. But still, we want this behaviour in the client app:

```swift
// Somewhere in the wild west
import MyFramework

...

// This should work
let publicClass = MyPublicClass()
publicClass.doSomethingWithPrivateClass()

...

// This should not be possible, nor even compile,
// as it should not be able to see MyVeryPrivateClass
let privateClass = MyVeryPrivateClass()
privateClass.doSomethingImportant(withAttribute: 13)
```

Seems easy, right?

Well, I thought so as well. I got so used to `open`, `public`, `internal` and `private` access modifiers in Swift, that I did not really thought it might be a problem in ObjC.

But it is.

Let's sum up our problem:

- we have a mixed Objective C, C (or C++), Swift framework target
- we need to expose an ObjC members to Swift code
- we don't want end users, to see our ObjC members

## Solutions

I have to say a had a problem to match what I tried within following categories. OK, I'm pretty sure about **the Ugly** one, but first two are just my arbitrary feelings about what seems to be easier and more in line with 'default' approach, which should not lead to any serious problems.

### The "Good" yet not working



Let's sum up the solution:

**Pros:**
+ Its intended way to do Swift ObjC interoperability

**Cons:**
+ All Objective C members exposed to Swift are also visible to the user
+ Common issues with modular headers

### The "Bad" which almost works

Let's sum up the solution:

**Pros:**
+ It already gives some kind of control over what is visible to the user by default
+ We can emphasise, that "private" submodule is for internal use only and it should not be used directly

**Cons:**
+ All Objective C members exposed to Swift are also visible to the user, but it requires to add additional import statement.
+ It requires manual module maps, it's harder to setup, easier to break

### The "Ugly" which actually works

Let's sum up the solution:

**Pros:**
+ **It actually hides ObjC members** from framework users
+ No need to care about manual headers

**Cons:**
+ You need some additional members to cross Swift-ObjC boundary
+ Ugly as hell

## Summary
