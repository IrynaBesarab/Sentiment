import Foundation
import RealmSwift

class DataForRealm: Object {
    @objc dynamic var dateOfAdded: String!
    @objc dynamic var sphere: String!
    @objc dynamic var scaleOfMood: String!
    @objc dynamic var diaryNote: String?
    @objc dynamic var photoOfDay: String?
    
    init(dateOfAdded:String, sphere: String, scaleOfMood: String, diaryNote:String){
        self.dateOfAdded = dateOfAdded
        self.sphere = sphere
        self.scaleOfMood = scaleOfMood
        self.diaryNote = diaryNote
    }
    
    private override init() {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
