import Foundation

/// An option set representing the reachability status
public struct NetworkStatus: OptionSet, Equatable, Hashable, Sendable {
 
    // MARK: - Options
    
    /// A network status that is reachable over wifi
    public static let wifi = NetworkStatus(rawValue: 1 << 0)
    
    /// A network status that is reachable over cellular networks
    public static let cellular = NetworkStatus(rawValue: 1 << 1)
    
    /// A network status that is not reachable
    public static let unreachable: NetworkStatus = []
    
    /// A network status that is fully reachable
    public static let fullyReachable: NetworkStatus = [.wifi, .cellular]
    
    // MARK: - Initializers
    
    /// Create a `NetworkStatus` from a raw value
    /// - Parameter rawValue: The raw value
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
    
    // MARK: - API
    
    /// Wether or not the network status is reachable over any connection
    public var isReachable: Bool {
        contains(.wifi) || contains(.cellular)
    }
    
    // MARK: - OptionSet
    
    public let rawValue: Int
    
}
