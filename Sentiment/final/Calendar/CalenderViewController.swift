import UIKit
import FSCalendar

class CalenderViewController: UIViewController, FSCalendarDelegate {
    
    var calendarViewModel = CalendarViewModel()
    let constants = Constants()
    @IBOutlet weak var calendar: FSCalendar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calendar.delegate = self
        calendar.scrollDirection = FSCalendarScrollDirection.horizontal
        calendar.locale = NSLocale(localeIdentifier: "en_US") as Locale
        
        if let patternImage = UIImage(named: constants.backgroudImageName ) {
            view.backgroundColor = UIColor(patternImage: patternImage)
        }
        calendar?.backgroundColor = .clear
        calendar.appearance.headerTitleColor = .black
        calendar.appearance.titleDefaultColor = .brown
        calendar.appearance.titleFont = .systemFont(ofSize: CGFloat(16))
        calendar.appearance.weekdayTextColor = .black
    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        
        var monthYearDateString = calendarViewModel.monthYearDateFormation(date)
        var dateString = calendarViewModel.dateFormation(date)
        guard let addVC = tabBarController?.viewControllers?[2] else { return }
        if let navigationController = addVC as? UINavigationController {
            if let viewController = navigationController.viewControllers.first {
                if let addViewController = viewController as? AddViewController {
                    addViewController.textDayLabel = dateString
                    addViewController.textMonthYearLabel = monthYearDateString
                }
            }
        }
        tabBarController?.selectedViewController = addVC
    }
}
