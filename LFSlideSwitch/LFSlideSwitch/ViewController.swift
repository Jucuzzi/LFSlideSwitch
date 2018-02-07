//
//  ViewController.swift
//  LFSlideSwitch
//
//  Created by 王力丰 on 2018/2/7.
//  Copyright © 2018年 LiFeng Wang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.initView()
    }
    
    func initView() -> (){
        self.view.backgroundColor = UIColor.init(red: 0/255, green: 171/255, blue: 253/255, alpha: 1)
        let slideSwitch = LFSlideSwitch.init(frame: CGRect.init(x: 100, y: 200, width: UIScreen.main.bounds.size.width - 200, height: (UIScreen.main.bounds.size.width - 200)*2))
        slideSwitch.backgroundColor = UIColor.clear
        self.view.addSubview(slideSwitch)
        slideSwitch.setOnWithAnimate()
        slideSwitch.setOnWithAnimate()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

