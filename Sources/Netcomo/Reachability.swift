//
//  File.swift
//  
//
//  Created by Varun Santhanam on 1/9/22.
//

import Foundation
import SystemConfiguration

#if canImport(Combine)
    import Combine
#endif

public final class Reachability {
    
    public init() throws {
        reachabilitySerialQueue = DispatchQueue(label: "com.varunsanthanam.Netcomo", qos: .default, target: nil)
        var zeroAddress = sockaddr()
        zeroAddress.sa_len = UInt8(MemoryLayout<sockaddr>.size)
        zeroAddress.sa_family = sa_family_t(AF_INET)

        guard let ref = SCNetworkReachabilityCreateWithAddress(nil, &zeroAddress) else {
            throw NSError()
        }
        reachabilityRef = ref
    }
    
    // MARK: - Private
    
    private let reachabilityRef: SCNetworkReachability
    private let reachabilitySerialQueue: DispatchQueue
    
}


