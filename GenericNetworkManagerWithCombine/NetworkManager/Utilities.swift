//
//  Utilities.swift
//  GenericNetworkManagerWithCombine
//
//  Created by İhsan Akbay on 2.04.2024.
//

import Foundation

/// Get the environment values
var ENV: ApiKeyable {
    #if DEBUG
    return ConfigEnv()
    #else
    // you can change this if you have different env files
    return ConfigEnv()
    #endif
}

protocol ApiKeyable {
    var API_KEY: String { get }
    var API_HOST: String { get }
}

/// Read plist to get env values
class BaseEnv {
    enum Key: String {
        case API_KEY
        case API_HOST
    }

    let dict: NSDictionary

    init(resourceName: String) {
        guard let filePath = Bundle.main.path(forResource: resourceName, ofType: "plist"),
              let plist = NSDictionary(contentsOfFile: filePath)
        else {
            fatalError("Couldn't find file '\(resourceName)' plist")
        }
        self.dict = plist
    }
}

/// The name "Config" is a plist file you can create
class ConfigEnv: BaseEnv, ApiKeyable {
    init() {
        super.init(resourceName: "Config")
    }

    var API_KEY: String {
        dict.object(forKey: Key.API_KEY.rawValue) as? String ?? ""
    }

    var API_HOST: String {
        dict.object(forKey: Key.API_HOST.rawValue) as? String ?? ""
    }
}
