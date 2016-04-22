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



class ViewController: UIViewController ,CSAPIManagerApiCallBackDelegate,CSAPIManagerParamSourceDelegate, ViewManagerCallBackDelegate{
    
    var messageReformer: MessageReformer?
    var messageManager: MessageManager?
    var viewControllerHelper: ViewControllerHelper?
    var viewDataCenter: ViewControllerDataCenter?
    
    //MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(nameInput)
        self.view.addSubview(passwordInput)
        layoutPageSubViews()
        
        testPersistance()
        
//        testNet()
        
        testHelper()
    }
    // MARK: - ViewManagerCallBackDelegate
    func callBackSuccess() {
        DDLogVerbose("Helper请求回调")
    }
    
    func callBackFailue() {
        
    }

    //MARK: - CSAPIManagerParamSourceDelegate
    func paramsForApi(manager: CSAPIBaseManager) -> [String: AnyObject] {
        var dic = [String: AnyObject]()
        dic["user_type"] = 1
        dic["page"] = "1"
        dic["count"] = "15"
        dic["type"] = ""
        dic["read"] = ""
        dic["mk"] = "058a93b373fb62e906bf9bc1ed9bd28f"
        dic["userID"] = "32319"
        return dic
    }
    
    //MARK: - CSAPIManagerApiCallBackDelegate
    func ApiManager(apiManager: CSAPIBaseManager, finishWithOriginData data: AnyObject) -> Void {
        if apiManager.isKindOfClass(MessageManager) {
            let city = apiManager.fetchData(messageReformer!) as! MessageModel
            DDLogVerbose(String(city))
        }
    }
    func ApiManager(apimanager: CSAPIBaseManager, failedWithError error: CSAPIManagerErrorType) -> Void {
        
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
    // 网络请求回调放到ViewController中
    func testNet() {
        messageManager = MessageManager()
        // 自己判断回调放到父类还是子类中
        messageManager!.callBackDelegate = self
        messageManager?.paramSource = self
        messageManager?.loadData()
        messageReformer = MessageReformer()
    }
    
    func testPersistance() {
        // 插入
        let table = UserTable()
        let newUser = UserRecode(name: "dfsdf", uid: "224")
        table.replaceRecord(newUser)
        // 插入
        let mesTable = MessageTable()
        let mesRecord = MessageRecode(id: "1", text: "消息")
        mesTable.replaceRecord(mesRecord)
        // 查询
//        let tableFetch = UserTable()
//        let condition = DatabaseCommandCondition()
//        condition.whereConditions = "user_id >= 0"
//        condition.orderBy = "user_name"
//        let result = tableFetch.fetchWithSQL(nil, condition: condition)
//        let record = result![0] as! UserRecode
//        DDLogVerbose(record.user_id!)
        
        viewDataCenter = ViewControllerDataCenter()
        viewDataCenter?.fetchItemListWithFilter(nil)
        
        
        // 删除
//        let conditionDelete = DatabaseCommandCondition()
//        conditionDelete.whereConditions = "user_id = 224"
//        let resultDelete = tableFetch.deleteWithSQL(conditionDelete)
//        DDLogVerbose(String(resultDelete))
        // 修改
//        let tableUpdate = UserTable()
//        let userUpdate = UserRecode(name: "你好", uid: "1")
//        let conditionUpdate = DatabaseCommandCondition()
//        conditionUpdate.whereConditions = "user_id = 9"
//        let resultUpdate = tableUpdate.updateRecord(userUpdate, condition: conditionUpdate)
//        DDLogVerbose(String(resultUpdate))
    
        // 删除数据库表
//        let command = CSPersistanceQueryCommand(name: "testBase")
//        let success = command.dropTable("tes")
//        DDLogVerbose(String(success))
        
        //修改表字段
//        let command = CSPersistanceQueryCommand(name: "testBase")
//        let success = command.alterTableColumn("testTable", withColumName: "user_sex", columnInfo: "TEXT")
//        DDLogVerbose(String(success))
    
    }
    
    // 网络请求回调放到Helper中
    func testHelper() {
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

