//
//  LFSlideSwitch.swift
//  SayWhere
//  仿HomeKit开关样式
//  Created by 王力丰 on 2017/2/3.
//  Copyright © 2017年 LifengWang. All rights reserved.
//

import Foundation
import UIKit
public var on = false;


let paddingWidth = 7
var switchView  = UIView.init()

class LFSlideSwitch:  UIView{
    
    override func draw(_ rect: CGRect) {
        self.backgroundColor = UIColor.white;
        //放入开关的背景
        let bgview = UIView.init(frame: CGRect.init(origin: CGPoint.init(x: 0, y: 0), size: CGSize.init(width: self.frame.size.width, height: self.frame.size.height)));
        bgview.backgroundColor = UIColor.white;
        bgview.alpha = 0.3;
        bgview.layer.cornerRadius = 25;
        bgview.layer.masksToBounds = true;
        self.addSubview(bgview);
        
        //显示一个开关拨片
        switchView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: (self.frame.size.width - (CGFloat)(paddingWidth * 2)), height: (self.frame.size.height / 2-(CGFloat)(paddingWidth * 2))));
        switchView.center = CGPoint.init(x: self.frame.size.width / 2, y: self.frame.size.height / 4);
        switchView.backgroundColor = UIColor.white;
        switchView.layer.cornerRadius = 25;
        switchView.layer.masksToBounds = true;
        self.addSubview(switchView);
        
        //放入手势操作
        let panGesture = UIPanGestureRecognizer.init(target: self, action: #selector(LFSlideSwitch.pangesture(sender:)));
        self.addGestureRecognizer(panGesture);
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setOn() {
        switchView.center = CGPoint.init(x: self.frame.size.width/2, y: self.frame.size.height/4);
        on = true;
    }
    
    func setOff() {
        switchView.center = CGPoint.init(x: self.frame.size.width/2, y: self.frame.size.height*3/4);
        on = false;
    }
    
    func setOnWithAnimate() {
        UIView.animate(withDuration: 0.5, animations: {
            self.setOn();
        })
    }
    
    func setOffWithAnimate() {
        UIView.animate(withDuration: 0.5, animations:{
            self.setOff();
        })
    }
    
    func isOn() -> Bool {
        return on;
    }
    
    @objc func pangesture(sender:UIPanGestureRecognizer) {
        if (on) {
            switch sender.state {
            case UIGestureRecognizerState.began:
                break;
            case UIGestureRecognizerState.changed:
                if (sender.translation(in: self).y > 0 && sender.translation(in: self).y < 2*self.frame.size.height / 4) {
                    UIView.animate(withDuration: 0.1, animations: { 
                        switchView.center = CGPoint.init(x: switchView.center.x, y: self.frame.size.height/4+sender.translation(in: self).y);
                    })
                }
                break;
            case UIGestureRecognizerState.cancelled: break
            case UIGestureRecognizerState.ended:
                if (sender.translation(in: self).y > self.frame.size.height/4) {
                    UIView.animate(withDuration: 0.3, animations: { 
                        switchView.center = CGPoint.init(x: self.frame.size.width/2, y: self.frame.size.height*3/4);
                    })
                    on = false;
                }else {
                    UIView.animate(withDuration: 0.3, animations: { 
                        switchView.center = CGPoint.init(x: self.frame.size.width/2, y: self.frame.size.height/4);
                    })
                    on = true;
                }
                break;
            default:
                break;
            }
        } else {
            switch sender.state {
            case UIGestureRecognizerState.began:
                break;
            case UIGestureRecognizerState.changed:
                if (sender.translation(in: self).y < 0 && sender.translation(in: self).y > -2*self.frame.size.height / 4) {
                    UIView.animate(withDuration: 0.1, animations: {
                        switchView.center = CGPoint.init(x: switchView.center.x, y: self.frame.size.height*3/4+sender.translation(in: self).y);
                    })
                }
                break;
            case UIGestureRecognizerState.cancelled: break
            case UIGestureRecognizerState.ended:
                if (sender.translation(in: self).y > -self.frame.size.height/4) {
                    UIView.animate(withDuration: 0.3, animations: {
                        switchView.center = CGPoint.init(x: self.frame.size.width/2, y: self.frame.size.height*3/4);
                    })
                    on = false;
                }else {
                    UIView.animate(withDuration: 0.3, animations: {
                        switchView.center = CGPoint.init(x: self.frame.size.width/2, y: self.frame.size.height/4);
                    })
                    on = true;
                }
                break;
            default:
                break;
            }

        
        }
        
    }
}
