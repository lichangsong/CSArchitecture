//
//  CSPersistanceQueryCommand+DataManipulations.swift
//  CSArchitecture
//
//  Created by 李长松 on 16/4/10.
//  Copyright © 2016年 Li. All rights reserved.
//

import Foundation
import CocoaLumberjack
// 数据操作
extension CSPersistanceQueryCommand {
    
    func insertTable(tableName: String, columnList: [String]?) -> String {
        guard let columnList = columnList else{
            return ""
        }
        if columnList.count == 0 {
            return ""
        }
        var sql = "replace into \(tableName) ("
        
        let content = NSMutableArray()
        let values = NSMutableArray()
        
        for key in columnList {
            content.addObject("\(key)")
            values.addObject(":\(key)")
        }
        sql += "\(content.componentsJoinedByString(","))) values (\(values.componentsJoinedByString(",")))"
        DDLogVerbose(sql)
        return sql
    }
    // TODO: 添加使用insert方法添加数据库数据的方法
    func insertTable() {
        
    }
    
    func deleteTable(tableName: String, withCondition: DatabaseCommandCondition) -> String{
        var sql = "delete from \(tableName)"
        withCondition.applyConditionToCommand(&sql)
        return sql
    }
    
    //update testTable set user_name = 'sdf' where user_id = 222
    /**
    修改数据库表信息(该方法不会直接调用)
    
    - parameter tableName:     表名
    - parameter withCondition: 修改条件
    - parameter columnDic:     修改后的数据
    
    - returns: 返回操作数据库的字符串
    */
    func updateTable(tableName: String, withCondition: DatabaseCommandCondition, columnDic: [String : String]?) -> String {
        guard let columnDic = columnDic else{
            return ""
        }
        if columnDic.keys.count == 0 {
            return ""
        }
        var setSQL = ""
        for (key,value) in columnDic {
            setSQL = setSQL + key + " = '" + value + "',"
        }
        var updateSQL = ""
        if columnDic.keys.count > 1 {
            let index = setSQL.startIndex.advancedBy(0) //swift 2.0+
            let index2 = setSQL.endIndex.advancedBy(-1) //swift 2.0+
            let range = Range<String.Index>(start: index,end: index2)
            updateSQL = setSQL.substringWithRange(range)
        }
        var sql = "update \(tableName) set \(updateSQL) "
        withCondition.applyConditionToCommand(&sql)
        return sql
    }

}