import UIKit

struct CalendarViewModel {
    func monthYearDateFormation(_ date: Date) -> String {
        let monthYearFormatter = DateFormatter()
        monthYearFormatter.locale = NSLocale(localeIdentifier: "en_US") as Locale
        //EEEE day of week; DD number of day of the year
        monthYearFormatter.dateFormat = "MMMM YYYY"
        let monthYearString = monthYearFormatter.string(from: date)
        return monthYearString
        
    }
    
    func dateFormation(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = NSLocale(localeIdentifier: "en_US") as Locale
        dateFormatter.dateFormat = "dd."
        let dateString = dateFormatter.string(from: date)
        return dateString
    }
}
