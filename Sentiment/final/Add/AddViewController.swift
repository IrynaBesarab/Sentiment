import UIKit

class AddViewController: UIViewController, UITextViewDelegate  {
    
    var realmData : [DataForRealm] = []
    let customAlert = MyAlert()
    let constants = Constants()
    
    var addControllerViewModel = AddControllerViewModel()

    @IBOutlet weak var textForDiaryTextView: UITextView!
    @IBOutlet weak var redView: UIView!
    @IBOutlet weak var orangeView: UIView!
    @IBOutlet weak var blueView: UIView!
    @IBOutlet weak var yellowView: UIView!
    @IBOutlet weak var greenView: UIView!
    @IBOutlet weak var redImageViewButtonOutlet: UIButton!
    @IBOutlet weak var orangeImageViewButtonOutlet: UIButton!
    @IBOutlet weak var yellowImageViewButtonOutlet: UIButton!
    @IBOutlet weak var blueImageViewBUttonOutlet: UIButton!
    @IBOutlet weak var greenImageViewButtonOutlet: UIButton!
    @IBOutlet weak var appIconImageView: UIImageView!
    @IBOutlet weak var nameOfIconField: UITextField!
    @IBOutlet weak var scaleTextField: UITextField!
    @IBOutlet weak var dayLabel: UITextField!
    @IBOutlet weak var monthYearLabel: UITextField!
    @IBOutlet weak var saveButtonOutlet: UIButton!
    
    var textDayLabel: String = ""
    var textMonthYearLabel: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: - appearence
        textForDiaryTextView.layer.cornerRadius = 15
        textDayLabel = "\(addControllerViewModel.presentDay(dareFormat: "dd."))"
        textMonthYearLabel = "\(addControllerViewModel.presentDay(dareFormat: "MMMM YYYY"))"

        if let patternImage = UIImage(named: constants.backgroudImageName) {
          view.backgroundColor = UIColor(patternImage: patternImage)
        }
        
        redView.backgroundColor = UIColor(red: 217/255.0, green: 80/255.0, blue: 138/255.0, alpha: 1.0)
        orangeView.backgroundColor = UIColor(red: 254/255.0, green: 149/255.0, blue: 7/255.0, alpha: 1.0)
        yellowView.backgroundColor = UIColor(red: 254/255.0, green: 247/255.0, blue: 120/255.0, alpha: 1.0)
        blueView.backgroundColor = UIColor(red: 53/255.0, green: 194/255.0, blue: 209/255.0, alpha: 1.0)
        greenView.backgroundColor = UIColor(red: 106/255.0, green: 167/255.0, blue: 134/255.0, alpha: 1.0)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.dayLabel.text = textDayLabel
        self.monthYearLabel.text = textMonthYearLabel

        textForDiaryTextView.textColor = .white
        textForDiaryTextView.font = UIFont(name: "Papyrus", size: 20)
        
        // MARK: - appearence
        redView.layer.cornerRadius = 8
        orangeView.layer.cornerRadius = 8
        yellowView.layer.cornerRadius = 8
        blueView.layer.cornerRadius = 8
        greenView.layer.cornerRadius = 8
        
        redView.alpha = 1
        orangeView.alpha = 1
        yellowView.alpha = 1
        blueView.alpha = 1
        greenView.alpha = 1
        textForDiaryTextView.isEditable = false
        textForDiaryTextView.alpha = 0.5
        saveButtonOutlet.alpha = 0.3
        saveButtonOutlet.isEnabled = false
        scaleTextField.text = ""
    }
    
    @IBAction func redViewButton(_ sender: Any) {
        redView.alpha = 1
        orangeView.alpha = 0.4
        yellowView.alpha = 0.4
        blueView.alpha = 0.4
        greenView.alpha = 0.4
        scaleTextField.text = "1"
        textForDiaryTextView.isEditable = true
        textForDiaryTextView.alpha = 1
        saveButtonOutlet.alpha = 1
        saveButtonOutlet.isEnabled = true
    }
    
    @IBAction func orangeViewButton(_ sender: Any) {
        orangeView.alpha = 1
        redView.alpha = 0.4
        yellowView.alpha = 0.4
        blueView.alpha = 0.4
        greenView.alpha = 0.4
        scaleTextField.text = "2"
        textForDiaryTextView.isEditable = true
        textForDiaryTextView.alpha = 1
        saveButtonOutlet.alpha = 1
        saveButtonOutlet.isEnabled = true
    }
    
    @IBAction func yellowViewButton(_ sender: Any) {
        yellowView.alpha = 1
        orangeView.alpha = 0.4
        redView.alpha = 0.4
        blueView.alpha = 0.4
        greenView.alpha = 0.4
        scaleTextField.text = "3"
        textForDiaryTextView.isEditable = true
        textForDiaryTextView.alpha = 1
        saveButtonOutlet.alpha = 1
        saveButtonOutlet.isEnabled = true
    }
    
    @IBAction func blueViewButton(_ sender: Any) {
        blueView.alpha = 1
        orangeView.alpha = 0.4
        yellowView.alpha = 0.4
        redView.alpha = 0.4
        greenView.alpha = 0.4
        scaleTextField.text = "5"
        textForDiaryTextView.isEditable = true
        textForDiaryTextView.alpha = 1
        saveButtonOutlet.alpha = 1
        saveButtonOutlet.isEnabled = true
    }
    
    @IBAction func greanViewButton(_ sender: Any) {
        greenView.alpha = 1
        orangeView.alpha = 0.4
        yellowView.alpha = 0.4
        blueView.alpha = 0.4
        redView.alpha = 0.4
        scaleTextField.text = "4"
        textForDiaryTextView.isEditable = true
        textForDiaryTextView.alpha = 1
        saveButtonOutlet.alpha = 1
        saveButtonOutlet.isEnabled = true
    }

    
    @IBAction func saveButton(_ sender: Any) {
          guard let data = prepareDataForSavingInRealm() else  {return}
        
          let dataManager = DataManager()
          guard let realm = dataManager.realm else { return }

          if realm.objects(DataForRealm.self).filter("dateOfAdded = '\(dayLabel.text!)  \(monthYearLabel.text!)'").first == nil {
              dataManager.save(dataToSave: data)
              self.realmData = dataManager.getData()
              animationSaveButton()
          } else {
              self.customAlert.showAlert(title: "Error", message: "This date s already exist. Please select another one", on: self)
          }
      }
    
    
    func animationSaveButton () {
        UIView.animate(withDuration: 2, delay: 0, options: []) {
            self.appIconImageView.rotate()
        } completion: { completed in
            self.customAlert.showAlert(title: "Done", message: "Information succesfully saved!", on: self)
        }
    }
    
    @objc func dismissAlert() {
        customAlert.dismissAlert()
    }
    
    func prepareDataForSavingInRealm() -> DataForRealm? {
        let data = DataForRealm()
        data.diaryNote = textForDiaryTextView.text
        data.scaleOfMood = scaleTextField.text
        data.dateOfAdded = "\(dayLabel.text!)  \(monthYearLabel.text!)"
        return data
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        var newText = textForDiaryTextView.text!
        newText.removeAll { (character) -> Bool in
            return character == " " || character == "\n"
        }
        return (newText.count + text.count) <= constants.maxCharacterNumberTextForDiary
    }
}
