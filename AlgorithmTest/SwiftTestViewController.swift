//
//  SwiftTestViewController.swift
//  AlgorithmTest
//
//  Created by Jack on 09/08/2017.
//  Copyright © 2017 Jack. All rights reserved.
//

import UIKit

class SwiftTestViewController: UIViewController,UITableViewDelegate {
    var aBool:Bool = true
    var aInt:UInt = 0
    var aFloat:Float = 12.3
    var aDouble:Double = 12345.67
    var aString:String = "abc"
    var aObject:AnyObject? = nil

    override func viewDidLoad() {
        super.viewDidLoad()

        self.showClassRuntime(aClass: SwiftTestViewController.self)
        // Do any additional setup after loading the view.
        
        self.methodSwizze(aClass: object_getClass(self), orgSelector: #selector(SwiftTestViewController.viewDidAppear(_:)), swizzeSelector: #selector(SwiftTestViewController.sz_viewDidAppear(_:)))
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("F:\(#function) L:\(#line)")
    }
    
    
    func sz_viewDidAppear(_ animated: Bool) {
        print("F:\(#function) L:\(#line)")
    }
    
    func testReturnVoidWithId(aId:AnyObject) {
        
    }
    
    func testReturnVoidWithBool(aBool:Bool, aInt:UInt, aFloat:Float, aDouble:Double,aString:String, aObject:AnyObject?) {
        
    }
    
    func testReturnTuple(aBool:Bool, aInt:UInt, aFloat:Float, aDouble:Double,aString:String, aObject:AnyObject?) -> (Bool, Float, Double, String, AnyObject?) {
        return (true, 12.3,1234.56,"abc",nil)
    }
    
    func testReturnVoidWithCharacter(aCharacter:Character) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
    
    func showClassRuntime(aClass:AnyClass) {
        print("=====method list=====")
        var methodNum:UInt32 = 0
        var dst:Int8 = 0;
        let methodList = class_copyMethodList(aClass, &methodNum)!
        
        for index in 0..<methodNum {
            let method:Method = methodList[Int(index)]!
            print("methodName:\(method_getName(method)!)")
            method_getReturnType(method, &dst, MemoryLayout<Int8>.size)
            print("returnType:\(Character(UnicodeScalar(UInt8(dst))))")
            print("TypeEncoding:\(String(cString:method_getTypeEncoding(method)))\n")
        }
        
        print("=====property list=====")
        var propertyNum:UInt32 = 0
        let propertyList = class_copyPropertyList(aClass, &propertyNum)!
        
        for index in 0..<propertyNum {
            let property:objc_property_t = propertyList[Int(index)]!
            print("propertyName:\(String(cString:property_getName(property)))")
            print("propertyAttributes:\(String(cString:property_getAttributes(property)))\n")
        }
    }
    
    func methodSwizze(aClass:AnyClass, orgSelector:Selector, swizzeSelector:Selector) {
        let orgMethod = class_getClassMethod(aClass, orgSelector)
        let orgImg = class_getMethodImplementation(aClass, orgSelector)
        let swizzeMethod = class_getClassMethod(aClass, swizzeSelector)
        let swizzeImg = class_getMethodImplementation(aClass, swizzeSelector)
        
        let didAddMethod = class_addMethod(aClass, orgSelector, swizzeImg, method_getTypeEncoding(swizzeMethod))
        if(didAddMethod) {
            class_replaceMethod(aClass, swizzeSelector, method_getImplementation(orgMethod), method_getTypeEncoding(orgMethod))
        } else {
            method_exchangeImplementations(orgImg, swizzeImg)
        }
    }
}
