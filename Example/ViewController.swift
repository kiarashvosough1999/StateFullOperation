//
//  ViewController.swift
//  Example
//
//  Created by Kiarash Vosough on 8/16/1400 AP.
//

import UIKit
import StateFullOperation

class ViewController: UIViewController {

    let queue = OperationQueue()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            let op = MyOperation(configuration: .init())
            try op.enqueue(into: queue)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 9) {
                print(self.queue.operationCount)
            }
            
            let op1 = try queue.addTask(identifier: .unique(), queuePriority: .low, qualityOfService: .default, { completed in
                Thread.sleep(forTimeInterval: 6)
                print("completed")
                try completed()
            }, willCanceled: {
                print("willCanceled")
            }, didCanceled: {
                print("didCanceled")
            }, willFinished: {
                print("willFinished")
            }, didFinished: {
                print("didFinished")
            }, willExecuting: {
                print("willExecuting")
            }, didExecuting: {
                print("didExecuting")
            })
            
            try op1.finishOperation()
            
        } catch {
            print(error)
        }
    }

}


class MyOperation: SafeOperation {
   
   override func shouldStartOperation() throws {
       try super.shouldStartOperation()
       /// do some pre-requireties before the runnable start
   }
   
   override func operation() throws {
       /// impelement your task here
       /// call `cancelRunnable()` whenever the task finish
       print("start")
       let sDate = Date()
       Thread.sleep(forTimeInterval: 5)
       let eDate = Date()
       print("end", eDate.timeIntervalSince(sDate))
       try finishOperation()
   }
   
   override func cancelOperation() throws {
       try super.cancelOperation()
       /// make sure you call `super.cancelRunnable()` in order to change operation flag
   }
   
   override func didCancelOperation() {
       /// after operation canceled and before the operation is poped from queue this method will be called
   }
}
