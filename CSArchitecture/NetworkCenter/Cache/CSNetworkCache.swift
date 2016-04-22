//
//  CSNetworkCache.swift
//  CSArchitecture
//
//  Created by 李长松 on 16/4/10.
//  Copyright © 2016年 Li. All rights reserved.
//
import Foundation
import KMCache

class CSNetworkCache: NSObject {
    // TODO: 是否是使用KMCache
    static let memoryCache = CSNetworkCache()
    private let cache = KMCache(type: .ReleaseByTime)
    
    override init() {
        super.init()
        
        self.cache.needRefreshCacheWhenUsed = false
        self.cache.maxCount = 2000
    }
    // 根据key存储缓存
    func setObject(object: NSObjectProtocol, forKey key: NSObjectProtocol) {
        self.cache.setCacheObject(object, forKey: key)
    }
    // 根据key获取缓存
    func objectForKey(key: NSObjectProtocol) -> NSObjectProtocol? {
        return self.cache.objectForKey(key)
    }
    
    func size() -> UInt {
        return self.cache.size()
    }}
