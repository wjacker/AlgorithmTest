//
//  RuntimeTestViewController.swift
//  AlgorithmTest
//
//  Created by Jack on 18/08/2017.
//  Copyright © 2017 Jack. All rights reserved.
//

import UIKit

class LessStepTestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let step = leesStepChange(startIndex: 0, source: &source, dest: &dest);
        print("min step: \(step))");
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var source = [1, 9, 3, 3];
    var dest = [2, 3, 1, 3];
    
    func minStepChange(startIndex:Int, source:inout [Int], dest:inout [Int]) -> Int {
        print(source);
        let sourceNumber = source[startIndex];
        let destNumber = dest[startIndex];
        
        if(sourceNumber == destNumber) {
            if(startIndex == source.count - 1) {
                return 0;
            } else {
                return minStepChange(startIndex: startIndex + 1, source: &source, dest: &dest);
            }
        }
        
        var findMinExcangeIndex = startIndex;
        var minStep = abs(sourceNumber - destNumber);
        var newStep = 0;
        for i in startIndex ..< source.count {
            if(source[i] != dest[i]) {
                newStep = abs(source[i] - destNumber) + abs(sourceNumber - dest[i]) + 1;
                if(newStep < (abs(sourceNumber - destNumber) + abs(source[i] - dest[i]))) {
                    findMinExcangeIndex = i;
                    minStep = abs(source[i] - destNumber) + 1;
                }
            }
        }
        
        //exchange index
        let temp = source[findMinExcangeIndex];
        source[findMinExcangeIndex] = source[startIndex];
        source[startIndex] = temp;
        
        if(startIndex == source.count - 1) {
            return minStep;
        } else {
            return minStep + minStepChange(startIndex: startIndex + 1, source: &source, dest: &dest);
        }
    }
}
