//
//  WorkItem.swift
//  StateFullOperation
//
//  Created by Kiarash Vosough on 5/27/22.
//

import Foundation

public struct WorkItem: WorkableItem {
    
    internal let workItem: DispatchWorkItem
    
    public var isCancelled: Bool { workItem.isCancelled }
    
    public init(qos: DispatchQoS = .unspecified, flags: DispatchWorkItemFlags = [], block: @escaping @convention(block) () -> Void) {
        self.workItem = DispatchWorkItem(qos: qos, flags: flags, block: block)
    }
    
    public func performSync(on queue: DispatchQueue) {
        queue.sync(execute: workItem)
    }
    
    public func performAsync(on queue: DispatchQueue) {
        queue.async(execute: workItem)
    }

    public func perform() {
        workItem.perform()
    }

    public func wait() {
        workItem.wait()
    }

    public func wait(timeout: DispatchTime) -> DispatchTimeoutResult {
        workItem.wait(timeout: timeout)
    }

    public func wait(wallTimeout: DispatchWallTime) -> DispatchTimeoutResult {
        workItem.wait(wallTimeout: wallTimeout)
    }

    public func notify(qos: DispatchQoS = .unspecified, flags: DispatchWorkItemFlags = [], queue: DispatchQueue,_ execute: @escaping @convention(block) () -> Void) {
        workItem.notify(qos: qos, flags: flags, queue: queue, execute: execute)
    }

    public func notify(queue: DispatchQueue, execute: DispatchWorkItem) {
        workItem.notify(queue: queue, execute: execute)
    }

    public func cancel() {
        workItem.cancel()
    }
}
