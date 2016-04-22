//
//  ViewControllerDataCenter.swift
//  CSArchitecture
//
//  Created by 李长松 on 16/4/22.
//  Copyright © 2016年 Li. All rights reserved.
//

import Foundation
import CocoaLumberjack

class ViewControllerDataCenter : NSObject {
    var userTable: UserTable?
    var messageTable: MessageTable?

    func fetchItemListWithFilter(filter: [String : String]?) {
        userTable = UserTable()
        let condition = DatabaseCommandCondition()
        condition.whereConditions = "user_id >= 0"
        condition.orderBy = "user_name"
        let result = userTable!.fetchWithSQL(nil, condition: condition)
        let record = result![0] as! UserRecode
        
        DDLogVerbose("++++"+record.user_name!)
        
        messageTable = MessageTable()
        let conditionMessage = DatabaseCommandCondition()
        conditionMessage.whereConditions = "message_id >= 0"
        let resultMessage = messageTable!.fetchWithSQL(nil, condition: conditionMessage)
        let recordMessage = resultMessage![0] as! MessageRecode
        
        DDLogVerbose("----"+recordMessage.message_text!)
        
    }
}


