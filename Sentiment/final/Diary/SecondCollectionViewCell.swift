import UIKit

class SecondCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var secondImageView: UIImageView!
    @IBOutlet weak var addGifImageView: UIImageView!
    let constants = Constants()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        secondImageView.image = UIImage(named: constants.diaryCellImageName)
        secondImageView.layer.cornerRadius = 15
        let addGif = UIImage.gifImageWithName(constants.diaryGifName)
        addGifImageView.image = addGif
    }
}
