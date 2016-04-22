//
//  CSPersistanceRecord.swift
//  CSArchitecture
//
//  Created by 李长松 on 16/4/10.
//  Copyright © 2016年 Li. All rights reserved.
//

import Foundation
import CocoaLumberjack
class CSPersistanceRecord:NSObject,CSPersistanceRecordProtocol {
    /**
     获取对应的Table表的结构信息(用于插入数据)
     
     - parameter table: 遵循CSPersistanceTableProtocol的table
     
     - returns: 表的结构信息字典
     */
    func dictionaryRepresentationInTable(table: CSPersistanceTableProtocol) -> [String: AnyObject]? {
        
        return["":""]
    }
    
    func dictionaryRepresentationUpdateInTable(table: CSPersistanceTableProtocol) -> [String : String]? {
        return["":""]
    }
    /**
     获取对应的Table表需要插入的字段名数组
     
     - parameter table: 遵循CSPersistanceTableProtocol的table
     
     - returns: 表的字段数组
     */
    func arrayColumnInTable(table: CSPersistanceTableProtocol) -> [String]? {
        var columnArray:[String] = []
        for columnKey in table.tableColumnInfo.keys {
            columnArray.append(columnKey)
        }
        return columnArray
    }
    /**
     将字典转换成Record对象
     
     - parameter dictionary: 需要转换的数据库字典
     */
    func objectRepresentationWithDictionary(dictionary: [String : AnyObject]) {
        for (key,value) in dictionary {
            self.setValue(String(value), forKey: key)
        }
    }
    
}