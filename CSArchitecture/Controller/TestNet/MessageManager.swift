//
//  MessageManager.swift
//  TestNetWorking
//
//  Created by 李长松 on 16/4/5.
//  Copyright © 2016年 Li. All rights reserved.
//

import Foundation
import Alamofire
import CocoaLumberjack

class MessageManager: CSAPIBaseManager,CSAPIManagerDelegate,CSAPIManagerApiCallBackDelegate,CSAPIManagerParamSourceDelegate {
    // 版本号
    var apiVersion: String {
        get{return ""}
    }
    // 请求URL
    var apiName: String {
        get{return "messages/getMessageData.php"}
    }
    // 请求方式
    var httpMethod: Alamofire.Method {
        get{return .POST}
    }
    // 服务器配置
    var server: CSServer {
        get{return kServer}
    }
    
    override init() {
        super.init()
        self.shouldAutoCacheResultWhenSuccess = true
//        self.callBackDelegate = self
//        self.paramSource = self
    }
    
    // MARK : 回调方法位置的选择,如果想回调会manager中，放开init中的注释，将controller中设置的代理的代码注释掉
    // 网络请求成功后回调
    func ApiManager(apiManager: CSAPIBaseManager, finishWithOriginData data: AnyObject) -> Void {
        DDLogVerbose(String(data))
    }
    // 网络请求失败后回调
    func ApiManager(apimanager: CSAPIBaseManager, failedWithError error: CSAPIManagerErrorType) -> Void {
        
    }
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
}
