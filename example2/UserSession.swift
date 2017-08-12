import Foundation

import RealmSwift

// TODO: Realmは使わない方針
class UserSession: Object {
    dynamic var userID = 0
    dynamic var key = ""
}
