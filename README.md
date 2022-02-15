# StateFullOpertaion

[![Swift](https://img.shields.io/badge/Swift-5.3_or_Higher-orange?style=flat-square)](https://img.shields.io/badge/Swift-5.1_5.2_5.3_5.4-Orange?style=flat-square)
[![Platforms](https://img.shields.io/badge/Platforms-iOS_9_or_Higher-yellowgreen?style=flat-square)](https://img.shields.io/badge/Platforms-macOS_iOS_tvOS_watchOS_Linux_Windows-Green?style=flat-square)
[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/Alamofire.svg?style=flat-square)](https://img.shields.io/cocoapods/v/Alamofire.svg)
[![Twitter](https://img.shields.io/badge/twitter-@Vosough_k-blue.svg?style=flat-square)](https://twitter.com/AlamofireSF)
[![Build Status](https://travis-ci.org/joemccann/dillinger.svg?branch=master)](https://travis-ci.org/joemccann/dillinger)

Unleash the power of Operation with StateFullOpertaion

- [Features](#features)
- [Requirements](#requirements)
- [Installation](#installation)
- [SampleProject](#sample)
- [Usage](#usage)
- [Contributors](#contributors)
- [License](#license)

## Requirements

| Platform | Minimum Swift Version | Installation | Status |
| --- | --- | --- | --- |
| iOS 9.0+ | 5.3 | [CocoaPods](#cocoapods) | Tested |
| iOS 9.0+ | 5.3 | [SPM](#swift-package-manager) | Tested |

## Installation

### CocoaPods

[CocoaPods](https://cocoapods.org) is a dependency manager for Cocoa projects. For usage and installation instructions, visit their website. To integrate StateFullOpertaion into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
pod 'StateFullOperation'
```

### Swift Package Manager

The [Swift Package Manager](https://swift.org/package-manager/) is a tool for automating the distribution of Swift code and is integrated into the `swift` compiler. 

Once you have your Swift package set up, adding Alamofire as a dependency is as easy as adding it to the `dependencies` value of your `Package.swift`.

```swift
dependencies: [
    .package(url: "https://github.com/kiarashvosough1999/StateFullOperation.git", .upToNextMajor(from: "1.0.0"))
]
```


## Sample

I have provided one sample project in the repository. To use it clone the repo, Source files for these are in the `Example` directory in project navigator. Have fun!

## Usage


### SafeOperation

SafeOperation is a convinient way of using operation.
It offers new features which the operation itself does not support or could be so tricky to use.

> Subclasses must not override any method of the base Opertaion Class or call them
 , instead they can override the provided method on protocol `OperationLifeCycleProvider` to take control of what should be done.
 
> `enqueue` can be use to add operation to a Queue, just make sure you provide operation a queue within its initializer.

#### Subclassing
 
 ```swift
 class MyOperation: SafeOperation {
    
    override func shouldStartOperation() throws {
        /// do anything before the operation start
        /// call `super.shouldStartOperation()` in order to start operation
        try super.shouldStartOperation()
    }
    
    // Operation Logic
    
    override func operation() throws {
        /// impelement your logic here
        /// call `cancelRunnable()` whenever the task should be canceled
	    /// call `finishOperation()` whenever the task finished
    }
    
    // Compeletion
    
    override func finishOperation() throws {
        try super.finishRunnable()
        /// make sure you call `super.finishRunnable()` in order to change the operation flags
    }

    override func didFinishOperation() {
        /// This method will be called after operation finished and after after `finishOperation()` called
    }  

    override func willFinishOperation() {
        /// This method will be called before operation being finished
    }
    
    // Cancelation
    
    override func cancelOperation() throws {
        try super.cancelOperation()
        /// Make sure you call `super.cancelOperation()` in order to change operation flag
    }
    
    override func willCancelOperation() {
        /// This method will be called  before operation being canceled
    } 
    
    override func didCancelOperation() {
        /// After operation canceled and after the operation is poped from queue this method will be called
    }
}
 ```

#### Closure

you may want to add operation with out all feature it provide with subclassing, using new method on OperationQueue can become handy.

```swift

let queue = OperationQueue()

queue.addOperation(identifier: .unique(), queuePriority: .normal, qualityOfService: .background) { completed in
   // your code
	
   // after you've done the completed block should be called to dequeue operation from queue
   ompleted()
	
} onCompleted: {
   // will be call just right before the dequeing operation from queue
} onCanceled: {
   // called when `cancelRunnable()` is called
} onFinished: {
   // called when `completed()` is called inside operation block
} onExecuting: {
   // called when opertion is enqued and started
}

```


## Contributors

Feel free to share your ideas or any other problems. Pull requests are welcomed.

## License

CocoAttributedStringBuilder is released under an MIT license. See [LICENSE](https://github.com/kiarashvosough1999/StateFullOpertaion/blob/master/LICENSE) for more information.
