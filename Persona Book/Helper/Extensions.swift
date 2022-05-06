//
//  Helpers.swift
//  Persona Book
//
//  Created by peo on 2022/04/16.
//

import Foundation

extension String {
    func localized(bundle: Bundle = .main, tableName: String = "Localizable") -> String {
        return NSLocalizedString(self, tableName: tableName, value: "**\(self)**", comment: "")
    }
}

extension Int {
    var personality: Personality {
        switch self {
        case 0:
            return Personality.ISTP
        case 1:
            return Personality.ISFP
        case 2:
            return Personality.INTP
        case 3:
            return Personality.INFP
        case 4:
            return Personality.ISTJ
        case 5:
            return Personality.INTJ
        case 6:
            return Personality.ISFJ
        case 7:
            return Personality.INFJ
        case 8:
            return Personality.ESTP
        case 9:
            return Personality.ESFP
        case 10:
            return Personality.ENTP
        case 11:
            return Personality.ENFP
        case 12:
            return Personality.ESTJ
        case 13:
            return Personality.ENTJ
        case 14:
            return Personality.ESFJ
        default:
            return Personality.ENFJ
        }
    }
}
