//
//  ViewController.swift
//  HW2_00457049
//
//  Created by User08 on 2019/4/14.
//  Copyright © 2019 JRU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBOutlet weak var numberLabel: UILabel!
    @IBAction func sliderChange(_ sender: UISlider) {
        sender.value.round()
        numberLabel.text = Int(sender.value).description
    }
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var savestone: UISwitch!
    @IBOutlet weak var lottery: UISegmentedControl!
    @IBOutlet weak var pic: UIImageView!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var text: UITextView!
    
    
    @IBAction func calculate(_ sender: Any) {
        var w = 0.03
        var ssr = 0
        if lottery.selectedSegmentIndex == 1 {
            w = w * 2
        }
        if savestone.isOn {
            w = w * 10
        }
        var stoneNum = Int(slider.value)
        
        let exp = Double(stoneNum / 300) * w
    
        while (stoneNum > 300){
            var ran = Double.random(in: 1...100)
            stoneNum = stoneNum - 300
            if ran < (100 * w){
                ssr = ssr + 1
            }
        }
        var w1 = w * 100
        if(ssr >= Int(exp)){
            text.text = "目前SSR機率是"+String(w1)+"%，你共抽到"+String(ssr)+"張ssr"
            
            pic.image=UIImage(named:"歐皇")
        }
        else{
            text.text = "目前SSR機率是"+String(w1)+"%，你共抽到"+String(ssr)+"張ssr"
            pic.image=UIImage(named:"死去")
        }
        
    }
    
}

