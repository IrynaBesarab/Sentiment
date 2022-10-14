import UIKit

class InteractionViewController: UIViewController {
    
    let constants = Constants()

    @IBOutlet weak var gifImageView: UIImageView!
    @IBOutlet weak var numberDaysUCare: UITextField!
    @IBOutlet weak var viewDaysUCare: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let plantGif = UIImage.gifImageWithName(constants.interactionGifName)
        gifImageView.image = plantGif
        viewDaysUCare.layer.cornerRadius = 40
        if let patternImage = UIImage(named: constants.backgroudImageName) {
          view.backgroundColor = UIColor(patternImage: patternImage)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        var importedRealmData = DataManager().getData()
        numberDaysUCare.text = "\(importedRealmData.count)"
    }
}
    
