//
//  UserDefaultsExtension.swift
//  LockScreenGithub
//
//  Created by Marwan Ayman on 23.02.21.
//

import Foundation

extension UserDefaults {
    func decode<T: Codable>(for type: T.Type, using key: String) -> T? {
        let defaults = UserDefaults.standard
        guard let data = defaults.object(forKey: key) as? Data else {return nil}
        let decodedObject = try? PropertyListDecoder().decode(type, from: data)
        return decodedObject
    }

    func encode<T: Codable>(for type: T, using key: String) {
        let defaults = UserDefaults.standard
        let encodedData = try? PropertyListEncoder().encode(type)
        defaults.set(encodedData, forKey: key)
        defaults.synchronize()
    }
}
