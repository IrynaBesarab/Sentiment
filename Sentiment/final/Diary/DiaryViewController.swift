import UIKit
import Gemini

class DiaryViewController: UIViewController {
    
    @IBOutlet weak var collectionView: GeminiCollectionView!
    
    var dataFromAddViewController : [DataForRealm] = []
    let constants = Constants()
    
    override func viewDidLoad() {
        super.viewDidLoad()
 // MARK: - ColectionView animation
        collectionView.gemini
            .scaleAnimation()
            .scale(0.75)
            .scaleEffect(.scaleUp)
        
// MARK: - Cell register
        let secondNib = UINib(nibName: "\(DiaryMainCollectionViewCell.self)", bundle: nil)
        
        collectionView.register(secondNib,
                                forCellWithReuseIdentifier: "\(DiaryMainCollectionViewCell.self)")
        
        let firstNib = UINib(nibName: "\(SecondCollectionViewCell.self)", bundle: nil)
        
        collectionView.register(firstNib,
                                forCellWithReuseIdentifier: "\(SecondCollectionViewCell.self)")
        
        collectionView.showsHorizontalScrollIndicator = false
        
// MARK: - appearence
        if let patternImage = UIImage(named: constants.backgroudImageName) {
          view.backgroundColor = UIColor(patternImage: patternImage)
        }
        collectionView.backgroundColor = .clear
    }

    override func viewWillAppear(_ animated: Bool) {
        dataFromAddViewController = DataManager().getData()
        collectionView.reloadData()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.collectionView.animateVisibleCells()
    }
 
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if let cell = cell as? DiaryMainCollectionViewCell {
            self.collectionView.animateCell(cell)
        }
    }
}



extension DiaryViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataFromAddViewController.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            guard let cellOne = collectionView.dequeueReusableCell(withReuseIdentifier: "SecondCollectionViewCell", for: indexPath) as? SecondCollectionViewCell else {
                fatalError("Wrong cell type for section 0. Expected SecondCollectionViewCell")
            }
            return cellOne
            
        } else {
            guard let cellTwo = collectionView.dequeueReusableCell(withReuseIdentifier: "DiaryMainCollectionViewCell", for: indexPath) as? DiaryMainCollectionViewCell else {
                fatalError("Wrong cell type for section 0. Expected DiaryMainCollectionViewCell")
            }
            let item = dataFromAddViewController[indexPath.row-1]
            cellTwo.dateLabelViewCell.text = item.dateOfAdded
            cellTwo.diaryTextView.text = item.diaryNote
            cellTwo.moodScaleTextField.text = item.scaleOfMood
            cellTwo.layer.shadowColor = UIColor.black.cgColor
            cellTwo.layer.shadowOffset = CGSize(width: 0, height: 0)
            cellTwo.layer.shadowRadius = constants.shadowRadius
            cellTwo.layer.shadowOpacity = constants.shadowOpacity
            cellTwo.layer.masksToBounds = false
            
            self.collectionView.animateCell(cellTwo)
            
            return cellTwo
        }
    }
}
extension DiaryViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 250, height: 437)
    }
    
}

extension DiaryViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
        let cellOne = collectionView.cellForItem(at: indexPath) as? SecondCollectionViewCell
           
        if  cellOne!.isSelected == true {
            guard let addViewController = tabBarController?.viewControllers?[2] else {
              return  print("Error. Cannot open chosen View Controller")
            }
            tabBarController?.selectedViewController = addViewController
            }
        }
    }
}
