//
//  OperationControlable++Protocol.swift
//  StateFullOperation
//
//  Created by Kiarash Vosough on 2/15/22.
//

import Foundation

/// This is an abstract protocol for **Operation**.
/// It is impelemented by ``SafeOperation`` in order to provide an interface to use **Opreation** in more convinient way than the basic methods it has.
/// Some of the methods are working behalf of Operation's original method.
public protocol OperationControlable: AnyObject {

    typealias OperationCompletedSignal = () throws -> Void

    typealias OperationBlock = (OperationCompletedSignal) throws -> Void
    
    /// Trigger when operation is about to be canceled.
    var willCanceledOperationAction: WorkableItem? { get }
    
    /// Trigger when operation was canceled.
    var didCanceledOperationAction: WorkableItem? { get }
    
    /// Trigger when operation is about to be finished.
    var willFinishedOperationAction: WorkableItem? { get }

    /// Trigger when operation was finished.
    var didFinishedOperationAction: WorkableItem? { get }
    

    /// For simple use of executing block known as `WorkItem`.
    var operationExecutable: OperationBlock? { get }
    
    
    /// ٍEnququ Self in `OperationQueue` to start
    /// This method should be called instead of `operationQueue.addOperation(self)`
    /// `operationQueue.addOperation(self)` was imeplemnted in super class with more safety
    ///  - Throws: queueFoundNil ---> if the `OperationQueue` is nil
    func enqueue<T>(into queue: T) throws where T: OperationQueue
    
    /// This method does not force your operation code to stop.
    /// Instead, it updates the object’s internal flags to reflect the change in state.
    /// If the operation has already finished executing, this method has no effect.
    /// Canceling an operation that is currently in an operation queue, but not yet executing,
    /// makes it possible to remove the operation from the queue sooner than usual.
    func cancelOperation() throws
    
    func finishOperation() throws
}
