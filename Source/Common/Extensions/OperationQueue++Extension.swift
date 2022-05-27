//
//  OperationQueue++Extension.swift
//  StateFullOperation
//
//  Created by Kiarash Vosough on 8/18/1400 AP.
//

import Foundation

extension OperationQueue {
    
    @discardableResult
    public func addTask(identifier: OperationIdentifier = .unique(),
                        queuePriority: Operation.QueuePriority = .normal,
                        qualityOfService: QualityOfService = .default,
                        _ operationBlock: @escaping SafeOperation.OperationBlock,
                        willCanceled: WorkItem? = nil,
                        didCanceled: WorkItem? = nil,
                        willFinished: WorkItem? = nil,
                        didFinished: WorkItem? = nil) throws -> SafeOperation {
        let operation = SafeOperation(configuration: .init(identifier: identifier,
                                                           queuePriority: queuePriority,
                                                           qualityOfService: qualityOfService))
        operation.operationExecutable = operationBlock
        operation.willCanceledOperationAction = willCanceled
        operation.didCanceledOperationAction = didCanceled
        operation.willFinishedOperationAction = willFinished
        operation.didFinishedOperationAction = didFinished
        try operation.enqueue(into: self)
        return operation
    }
    
    @discardableResult
    public func addTask(identifier: OperationIdentifier = .unique(),
                        queuePriority: Operation.QueuePriority = .normal,
                        qualityOfService: QualityOfService = .default,
                        _ operationBlock: @escaping SafeOperation.OperationBlock,
                        willCanceled: @escaping () -> Void = {},
                        didCanceled: @escaping () -> Void = {},
                        willFinished: @escaping () -> Void = {},
                        didFinished: @escaping () -> Void = {},
                        willExecuting: @escaping () -> Void = {},
                        didExecuting: @escaping () -> Void = {}) throws -> SafeOperation {
        let operation = SafeOperation(configuration: .init(identifier: identifier,
                                                           queuePriority: queuePriority,
                                                           qualityOfService: qualityOfService))
        operation.operationExecutable = operationBlock
        operation.willCanceledOperationAction = WorkItem(block: willCanceled)
        operation.didCanceledOperationAction = WorkItem(block: didCanceled)
        operation.willFinishedOperationAction = WorkItem(block: willFinished)
        operation.didFinishedOperationAction = WorkItem(block: didFinished)
        try operation.enqueue(into: self)
        return operation
    }
}
