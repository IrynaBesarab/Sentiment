import UIKit

struct AddControllerViewModel {
 
    func presentDay(dareFormat: String) -> String {
        let presentDay = Date()
        let formatDay = DateFormatter()
        formatDay.timeStyle = .none
        formatDay.dateStyle = .long
        formatDay.locale = NSLocale(localeIdentifier: "en_US") as Locale
        formatDay.dateFormat = dareFormat
        let presentDayString = formatDay.string(from: presentDay)
        return presentDayString
    }
    
}

extension UIView {
    func rotate() {
        let rotation : CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotation.toValue = NSNumber(value: Double.pi * 2)
        rotation.duration = 1
        rotation.isCumulative = true
        rotation.repeatCount = 2
        self.layer.add(rotation, forKey: "rotationAnimation")
    }
}
