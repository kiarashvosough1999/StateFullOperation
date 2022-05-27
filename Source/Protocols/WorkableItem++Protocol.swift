//
//  WorkableItem.swift
//  StateFullOperation
//
//  Created by Kiarash Vosough on 5/27/22.
//

import Foundation

public protocol WorkableItem {
    
    var isCancelled: Bool { get }
    
    func performSync(on queue: DispatchQueue)
    
    func performAsync(on queue: DispatchQueue)

    func perform()

    func wait()

    func wait(timeout: DispatchTime) -> DispatchTimeoutResult

    func wait(wallTimeout: DispatchWallTime) -> DispatchTimeoutResult

    func notify(qos: DispatchQoS, flags: DispatchWorkItemFlags, queue: DispatchQueue,_ execute: @escaping @convention(block) () -> Void)

    func notify(queue: DispatchQueue, execute: DispatchWorkItem)

    func cancel()
}
