import UIKit
import Gemini

class DiaryMainCollectionViewCell: GeminiCell {

    @IBOutlet weak var mainViewDiary: UIView!
    @IBOutlet weak var dateLabelViewCell: UITextField!
    @IBOutlet weak var moodScaleTextField: UITextField!
    @IBOutlet weak var diaryTextView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        diaryTextView.layer.cornerRadius = 18
        mainViewDiary.layer.cornerRadius = 15
        diaryTextView.font = UIFont(name: "Papyrus", size: 20)
    }
}
