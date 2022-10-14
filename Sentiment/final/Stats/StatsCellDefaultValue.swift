import Foundation

struct StatsCellDefaultValue {
        
    var chartsDefaultValueOne = 0
    var chartsDefaultValueTwo = 0
    var chartsDefaultValueThree = 0
    var chartsDefaultValueFour = 0
    var chartsDefaultValueFive = 0
    
    let mood = ["1", "2", "3", "4", "5"]
    
    
    mutating func chartValueCreating() {
        let importedRealmData = DataManager().getData()
        let dataMoodCount = importedRealmData.sum(of: \.scaleOfMood)
        
        for (key, value) in dataMoodCount {
            if key == "1"  {
                chartsDefaultValueOne = value
            }
            if key == "2"  {
                chartsDefaultValueTwo = value
            }
            if key == "3"  {
                chartsDefaultValueThree = value
            }
            if key == "4"  {
                chartsDefaultValueFour = value
            }
            if key == "5"  {
                chartsDefaultValueFive = value
            }
        }
    }
    
    func moodCountArreyCreating() -> [String] {
        let moodCount = ["\(chartsDefaultValueOne)", "\(chartsDefaultValueTwo)", "\(chartsDefaultValueThree)", "\(chartsDefaultValueFour)", "\(chartsDefaultValueFive)"]
        return moodCount
    }
}

extension Sequence {
    func sum<T: Hashable>(of property: (Element) -> T) -> [T: Int] {
        reduce(into: [:]) { $0[property($1), default: 0] += 1 }
    }
    func sum<T: Hashable, A: AdditiveArithmetic>(of property: (Element) -> T, by adding: (Element) -> A) -> [T: A] {
        reduce(into: [:]) { $0[property($1), default: .zero] += adding($1) }
    }
}
