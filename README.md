# LFSlideSwitch
An iOS Smart slide switch
![](https://github.com/Jucuzzi/LFSlideSwitch/blob/master/Preview.jpg)
## 如何使用
### 只需要在需要使用到的地方加入以下代码
```c
let slideSwitch = LFSlideSwitch.init(frame: CGRect.init(x: 100, y: 200, width: UIScreen.main.bounds.size.width - 200, height: (UIScreen.main.bounds.size.width - 200)*2))
slideSwitch.backgroundColor = UIColor.clear
self.view.addSubview(slideSwitch)
slideSwitch.setOnWithAnimate()
```
### 如何获取开关的状态
```c
slideSwitch.isOn()
```
### 如何打开关闭开关（无动画）
```c
slideSwitch.setOn()
slideSwitch.setOff()
```
### 如何打开关闭开关（有动画）
```c
slideSwitch.setOnWithAnimate()
slideSwitch.setOffWithAnimate()
```
## 使用要求
iOS8.0及以上
## 关于控件的使用背景
homekit中的开关大型，上下拨动，移动优雅，判断准确，非常适合于单页面只有一个的主要开关，给人印象深刻，本开关以swift重写，希望可以满足大家的需求
有问题可以及时反馈给我

email：917609510@qq.com

