import UIKit

class ButtonTabBarViewController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        setupMiddleButton()
        setupCalendarButton()
        setupInteractionButton()
        setupDiaryButton()
        setupStatisticButton()
    }
    
    func setupMiddleButton() {
        let middleButton = UIButton(frame: CGRect(x: (self.view.bounds.width / 2) - 30, y: -20, width: 70, height: 70))
        middleButton.setBackgroundImage(UIImage(named: "AddIcon"), for: .normal)
        middleButton.layer.shadowColor = UIColor.black.cgColor
        middleButton.layer.shadowOpacity = 0.3
        middleButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        
        self.tabBar.addSubview(middleButton)
        middleButton.addTarget(self, action: #selector(addButtonAction), for: .touchUpInside)
        
        self.view.layoutIfNeeded()
    }
    
    @objc func addButtonAction(sender: UIButton) {
        self.selectedIndex = 2
    }
    
    func setupCalendarButton() {
        let calendarButton = UIButton(frame: CGRect(x: (self.view.bounds.width / 2) - 185, y: -5, width: 60, height: 60))
        
        calendarButton.setBackgroundImage(UIImage(named: "CalendarIcon"), for: .normal)
        calendarButton.layer.shadowColor = UIColor.black.cgColor
        calendarButton.layer.shadowOpacity = 0.1
        calendarButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        
        self.tabBar.addSubview(calendarButton)
        calendarButton.addTarget(self, action: #selector(calendarButtonAction), for: .touchUpInside)
        
        self.view.layoutIfNeeded()
    }
    
    @objc func calendarButtonAction(sender: UIButton) {
        self.selectedIndex = 0
    }
    
    func setupInteractionButton() {
        let interactionButton = UIButton(frame: CGRect(x: (self.view.bounds.width / 2) - 110, y: -5, width: 60, height: 60))
        
        interactionButton.setBackgroundImage(UIImage(named: "InteractionIcon"), for: .normal)
        interactionButton.layer.shadowColor = UIColor.black.cgColor
        interactionButton.layer.shadowOpacity = 0.1
        interactionButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        
        self.tabBar.addSubview(interactionButton)
        interactionButton.addTarget(self, action: #selector(interactionButtonAction), for: .touchUpInside)
        
        self.view.layoutIfNeeded()
    }
    
    @objc func interactionButtonAction(sender: UIButton) {
        self.selectedIndex = 1
    }
    
    func setupStatisticButton() {
        let statisticButton = UIButton(frame: CGRect(x: (self.view.bounds.width / 2) + 55, y: -5, width: 60, height: 60))
        
        statisticButton.setBackgroundImage(UIImage(named: "StatsIcon"), for: .normal)
        statisticButton.layer.shadowColor = UIColor.black.cgColor
        statisticButton.layer.shadowOpacity = 0.1
        statisticButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        
        self.tabBar.addSubview(statisticButton)
        statisticButton.addTarget(self, action: #selector(statisticButtonAction), for: .touchUpInside)
        
        self.view.layoutIfNeeded()
    }
    
    @objc func statisticButtonAction(sender: UIButton) {
        self.selectedIndex = 3
    }
    
    func setupDiaryButton() {
        let diaryButton = UIButton(frame: CGRect(x: (self.view.bounds.width / 2) + 125, y: -5, width: 60, height: 60))
        
        diaryButton.setBackgroundImage(UIImage(named: "DiaryIcon"), for: .normal)
        diaryButton.layer.shadowColor = UIColor.black.cgColor
        diaryButton.layer.shadowOpacity = 0.1
        diaryButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        
        self.tabBar.addSubview(diaryButton)
        diaryButton.addTarget(self, action: #selector(diaryButtonAction), for: .touchUpInside)
        
        self.view.layoutIfNeeded()
    }
    
    @objc func diaryButtonAction(sender: UIButton) {
        self.selectedIndex = 4
    }
}
