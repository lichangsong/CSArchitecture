//
//  ViewController.swift
//  CSArchitecture
//
//  Created by 李长松 on 16/4/10.
//  Copyright © 2016年 Li. All rights reserved.
//

import UIKit
import SnapKit
import CocoaLumberjack

class ViewController: UIViewController , ViewManagerCallBackDelegate{
    
    var viewControllerHelper: ViewControllerHelper?
    
    //MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(nameInput)
        self.view.addSubview(passwordInput)
        layoutPageSubViews()
        initHelper()
    }
    
    // MARK: - ViewManagerCallBackDelegate
    func callBackSuccess() {
        DDLogVerbose("Helper请求回调")
    }
    
    func callBackFailue() {
        DDLogVerbose("Helper请求回调失败")
    }
    
    // MARK: - private methods
    // 界面布局
    func layoutPageSubViews() {
        nameInput.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(self.view).offset(10)
            make.right.equalTo(self.view).offset(-10)
            make.top.equalTo(self.view).offset(90)
            make.height.equalTo(30)
        }
        passwordInput.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(self.view).offset(10)
            make.right.equalTo(self.view).offset(-10)
            make.top.equalTo(nameInput.snp_bottom).offset(20)
            make.height.equalTo(30)
        }
    }
    
    // 初始化Helper
    func initHelper() {
        viewControllerHelper = ViewControllerHelper()
        viewControllerHelper?.callBackDelegate = self
        viewControllerHelper?.messageManager?.loadData()
    }
    
    // MARK: - getters and setters
    // 账号
    var _nameInput: UITextField?
    var nameInput: UITextField {
        get {
            if _nameInput == nil {
                _nameInput = UITextField()
                _nameInput!.backgroundColor = UIColor.orangeColor()
                _nameInput!.placeholder = "账号"
            }
            return _nameInput!
        }
    }
    // 密码
    var _passwordInput: UITextField?
    var passwordInput: UITextField {
        get {
            if _passwordInput == nil {
                _passwordInput = UITextField()
                _passwordInput!.backgroundColor = UIColor.orangeColor()
                _passwordInput!.placeholder = "密码"
            }
            return _passwordInput!
        }
    }
}

