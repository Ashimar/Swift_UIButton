//
//  ViewController.swift
//  Swift_UIButton
//
//  Created by zhenhuaonline on 16/8/12.
//  Copyright © 2016年 Winnie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        /*
         1，按钮的创建
         （1）按钮有下面四种类型：
         UIButtonType.ContactAdd：前面带“+”图标按钮，默认文字颜色为蓝色，有触摸时的高亮效果
         UIButtonType.DetailDisclosure：前面带“!”图标按钮，默认文字颜色为蓝色，有触摸时的高亮效果
         UIButtonType.System：前面不带图标，默认文字颜色为蓝色，有触摸时的高亮效果
         UIButtonType.Custom：定制按钮，前面不带图标，默认文字颜色为白色，无触摸时的高亮效果
         UIButtonType.InfoDark：为感叹号“!”圆形按钮
         UIButtonType.InfoLight：为感叹号“!”圆形按钮
         */
        
        // 初始化UIButton  创建一个ContactAdd类型的按钮
        let button:UIButton = UIButton(type:.ContactAdd)
    
        button.frame = CGRectMake(10, 30, 100, 30)
        // 设置 按钮 文字
        button.setTitle("点我", forState: UIControlState.Normal)
        self.view.addSubview(button)
        
        // （2）对于Custom定制类型按钮，代码可简化为：
        
        let buttonOfCustom = UIButton(frame:CGRectMake(30,100,100,100))
        self.view.addSubview(buttonOfCustom)
        
//        2、按钮文字设置
        buttonOfCustom.setTitle("普通状态", forState: UIControlState.Normal)        // 普通状态下的文字
        buttonOfCustom.setTitle("触摸状态", forState: UIControlState.Highlighted)   // 触摸状态下的文字
        buttonOfCustom.setTitle("禁用状态", forState: UIControlState.Disabled)  // 禁用状态下的文字
        buttonOfCustom.setTitle("选中状态", forState: UIControlState.Selected)  // 选中状态下的文字
        
//        3、按钮文字颜色的设置
        buttonOfCustom.setTitleColor(UIColor.blackColor(), forState: .Normal)   // 普通状态下文字的颜色
        buttonOfCustom.setTitleColor(UIColor.greenColor(), forState: .Highlighted)  // 触摸状态下文字的颜色
        buttonOfCustom.setTitleColor(UIColor.grayColor(), forState: .Disabled)      // 禁用状态下文字的颜色
        
//        4、按钮文字阴影颜色的设置
        buttonOfCustom.setTitleShadowColor(UIColor.blueColor(), forState: .Normal) // 普通状态下文字的颜色
        buttonOfCustom.setTitleShadowColor(UIColor.yellowColor(), forState: .Highlighted)   // 触摸状态下文字的颜色
       buttonOfCustom.setTitleShadowColor(UIColor.redColor(), forState: .Disabled)     // 禁用状态下文字的颜色
        
//        5、按钮背景颜色设置
        button.backgroundColor = UIColor.blueColor()
        
        // 设置前景颜色
        button.tintColor = UIColor.whiteColor()
        
//        6、按钮文字图标的设置
        let buttonOfImage = UIButton(frame:CGRectMake(130, 100, 60, 60))
        self.view.addSubview(buttonOfImage)
        
        buttonOfImage.setImage(UIImage(named: "my_list_icon6"), forState: .Normal)  // 设置图标
        buttonOfImage.adjustsImageWhenHighlighted = true   // 使触摸模式下按钮也不会变暗
        buttonOfImage.adjustsImageWhenDisabled = false  // 使禁用模式下按钮也不会变暗
        
//        7、设置按钮背景图片
        buttonOfCustom.setBackgroundImage(UIImage(named: "1_ashimar_a"), forState: .Normal)
        buttonOfCustom.setBackgroundImage(UIImage(named: "2"), forState: .Highlighted)
        
//        8、按钮触摸点击事件响应
        // 不传递触摸对象（即点击按钮）
        buttonOfImage.addTarget(self, action: #selector(tapped), forControlEvents: .TouchUpInside)
        
        
        // 传递触摸对象（即点击的按钮），需要在定义action参数时，方法名称后面带上冒号：
        buttonOfCustom.addTarget(self, action: #selector(tapped2(_:)), forControlEvents: .TouchUpInside)
        
        /*
         按钮状态类型：
         Normal         普通
         Highlighted    高亮
         Selected       选中
         Focused        集中
         Application
         Reserved
         
         常用的触摸事件类型：
         TouchDown：单点触摸按下事件，点触屏幕
         TouchDownRepeat：多点触摸按下事件，点触计数大于1，按下第2、3或第4根手指的时候
         TouchDragInside：触摸在控件内拖动时
         TouchDragOutside：触摸在控件外拖动时
         TouchDragEnter：触摸从控件之外拖动到内部时
         TouchDragExit：触摸从控件内部拖动到外部时
         TouchUpInside：在控件之内触摸并抬起事件
         TouchUpOutside：在控件之外触摸抬起事件
         TouchCancel：触摸取消事件，即一次触摸因为放上太多手指而被取消，或者电话打断
         */
//        9、设置按钮的圆角
        buttonOfCustom.layer.cornerRadius = 50
        buttonOfCustom.layer.masksToBounds = true
        
        let button4 = UIButton(frame:CGRectMake(250, 100, 100, 60))
        button4.backgroundColor = UIColor.orangeColor()
        self.view.addSubview(button4)
        /* 使用 UIBezierPath 绘制 指定角为 圆角 button,
         TopLeft:   左上角
         TopRight:  右上角
         BottomLeft:左下角
         BottomRight:右下角
         AllCorners: 所有角
         }
         
        */
        let maskPath = UIBezierPath(roundedRect:button4.bounds, byRoundingCorners:[UIRectCorner.TopLeft,UIRectCorner.BottomLeft] , cornerRadii:CGSizeMake(10.0, 10.0))
        
        let maskLayer = CAShapeLayer()
        maskLayer.frame = button4.bounds
        maskLayer.path = maskPath.CGPath
        
        button4.layer.mask = maskLayer
        
//        10、设置按钮的边框颜色及边框宽度
        buttonOfCustom.layer.borderColor = UIColor.orangeColor().CGColor
        buttonOfCustom.layer.borderWidth = 2
        
/*       11、按钮偏移量
         contentEdgeInsets 内容偏移（文字+图片）
         imageEdgeInsets    图片偏移
         titleEdgeInsets    文字偏移
 */
//        UIEdgeInsets(top: 10, left:0, bottom: 0, right: 0)
        let button2 = UIButton(frame:CGRectMake(20, 250, 60, 60))
        self.view.addSubview(button2)
        button2.backgroundColor = UIColor.yellowColor()
        button2.setTitle("上下", forState: .Normal)
        button2.setTitleColor(UIColor.blackColor(), forState: .Normal)
        button2.setImage(UIImage(named: "my_list_icon6"), forState: .Normal)
        
        // 设置按钮的内容的偏移位置
        button2.contentEdgeInsets = UIEdgeInsets(top:0,left:-20, bottom: -20,right: 0)
        // 设置按钮的
        button2.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 50, -55)
        
        let button3 = UIButton(frame:CGRectMake(120, 250, 100, 60))
        self.view.addSubview(button3)
        button3.backgroundColor = UIColor.brownColor()
        button3.setTitle("左边", forState: .Normal)
        button3.setImage(UIImage(named: "login_sina"), forState: .Normal)
        button3.setTitleColor(UIColor.blackColor(), forState: .Normal)
        // 内容偏移（文字+图片）
        button3.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0)
        // 图片偏移
        button3.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -80)
        // 文字偏移
        button3.titleEdgeInsets = UIEdgeInsetsMake(0, -80, 0, 0)
        
    }
    
    func tapped(){
        print("tapped")
    }
    
    
    func tapped2(button:UIButton){
        
        button.selected = !button.selected
        
        // 判断是否为选中状态
        if button.selected {
            print(button.titleForState(.Selected))
        } else {
            print(button.titleForState(.Normal))
        }
    }
    
    /**
     *  获取字符串的宽度和高度
     *
     *  @param text:NSString
     *  @param font:UIFont
     *
     *  @return CGRect
     */
    class func getTextRectSize(text:NSString,font:UIFont,size:CGSize) -> CGRect {
        
        let attributes = [NSFontAttributeName:font]
        let option = NSStringDrawingOptions.UsesLineFragmentOrigin
        let rect:CGRect = text.boundingRectWithSize(size, options: option, attributes: attributes, context: nil)
        
        print("rect:\(rect)")
        
        return rect;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

