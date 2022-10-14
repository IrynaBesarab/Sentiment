import RealmSwift
import Foundation

struct DataManager {
    let realm = try? Realm()

    func save(dataToSave: DataForRealm) {
        try? realm?.write {
            realm?.add(dataToSave)
        }
    }
    
    func delete(dataToDelete: DataForRealm) {
        try? realm?.write {
            realm?.delete(dataToDelete)
        }
    }
    
    func getData() -> [DataForRealm] {
        var data = [DataForRealm]()
        
        guard let dataToRealm = realm?.objects(DataForRealm.self) else {
            return []
        }
        for datum in dataToRealm {
            data.append(datum)
        }
        return data
    }
    
    func deleteAll() -> [DataForRealm] {
        var data = [DataForRealm]()
        
        try? realm?.write {
            realm?.deleteAll()
        }
        return data
    }
}
