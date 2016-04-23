//
//  CSPersistanceRecordProtocol.swift
//  CSArchitecture
//
//  Created by 李长松 on 16/4/10.
//  Copyright © 2016年 Li. All rights reserved.
//

import Foundation
protocol CSPersistanceRecordProtocol : NSObjectProtocol{
    /**
     插入数据时使用(待优化)
     
     - parameter table: <#table description#>
     
     - returns: <#return value description#>
     */
    func dictionaryRepresentationInTable(table: CSPersistanceTableProtocol) -> [String: AnyObject]?
    /**
     更新数据时使用(待优化)
     
     - parameter table: <#table description#>
     
     - returns: <#return value description#>
     */
    func dictionaryRepresentationUpdateInTable(table: CSPersistanceTableProtocol) -> [String: AnyObject]?
    
    func arrayColumnInTable(table: CSPersistanceTableProtocol) -> [String]?
    
    /**
     将返回字典处理成Recorde
     
     - parameter dictionary: 数据库中存储数据
     */
    func objectRepresentationWithDictionary(dictionary : [String : AnyObject])
}