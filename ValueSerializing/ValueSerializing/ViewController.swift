//
//  ViewController.swift
//  ValueSerializing
//
//  Created by viky on 2/9/19.
//  Copyright © 2019 viky. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    struct Person: Codable {
        let firstName: String
        let lastName: String
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Print out the temp dirctory path to the debug console, so that you can follow the generated file
        print("Temp Directory URL: \(tempDir)")
        
        runValueSerializingDemo()
        runCodableValueSerializingDemo()
        runCodableValueSerializingIndexSetDemo()
        runCustomCodeableTypeDemo()
    }
    
    let tempDir: URL = {
        return FileManager.default.temporaryDirectory
    }()
    
    func runValueSerializingDemo() {
        // NSArray and NSDictionary provide methods that generate property list file. Conversely NSArray and NSDictionary also provide initializers that can create NSArray and NSDictionary base on the property list content of a give file.
        let arr = ["ElementA", "ElementB", "ElementC"]
        let f = tempDir.appendingPathComponent("array.plist")
        try! (arr as NSArray).write(to: f)
    }

    func runCodableValueSerializingDemo() {
        // You can serialize an object without cross the bridge into the Object-C world, provided it adopts the Codable protocol. In effect, every native swift type and every Fundation overlay type does adopt to the Codable protocol.
        let arr = ["ElementA", "ElementB", "ElementC"]
        let f = tempDir.appendingPathComponent("codeble.array.plist")
        let pencoder = PropertyListEncoder()
        pencoder.outputFormat = .xml
        let d = try! pencoder.encode(arr)
        try! d.write(to: f)
    }
    
    func runCodableValueSerializingIndexSetDemo() {
        // You can't write an NSIndexSet directly info a property list using Object-C, because Object-C has no notion of NSIndexSet as a property list type. But the Swift Function overlay type, IndexSet, is Codable.
        let f = tempDir.appendingPathComponent("codeble.indexSet.plist")
        let pencoder = PropertyListEncoder()
        pencoder.outputFormat = .xml
        let d = try! pencoder.encode(IndexSet([1,2,3]))
        try! d.write(to: f)
    }
    
    func runCustomCodeableTypeDemo() {
        // You own custom type can adopt Codable and enable them encodable in the same way. if the properties themselves are all Codable, in the simplest case, adopting Codable is all you need to do.
        let you = Person(firstName: "Your First Name", lastName: "Your Last Name")
        
        let f = tempDir.appendingPathComponent("customCodeble.person.plist")
        let pencoder = PropertyListEncoder()
        pencoder.outputFormat = .xml
        let d = try! pencoder.encode(you)
        try! d.write(to: f)
        
        // encode to json
        let jf = tempDir.appendingPathComponent("customCodeble.person.json")
        let jencoder = JSONEncoder()
        jencoder.outputFormatting = .prettyPrinted
        let jd = try! jencoder.encode(you)
        print(String(data: jd, encoding: .utf8)!)
        try! jd.write(to: jf)
    }
}

