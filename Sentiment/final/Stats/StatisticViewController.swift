import UIKit
import Charts

class StatisticViewController: UIViewController {
    
    let constants = Constants()
    @IBOutlet weak var statsCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let patternImage = UIImage(named: constants.backgroudImageName) {
          view.backgroundColor = UIColor(patternImage: patternImage)
        }
        statsCollectionView.backgroundColor = .clear
        
        
        let firstNib = UINib(nibName: "\(FirstStatCollectionViewCell.self)", bundle: nil)
        
        statsCollectionView.register(firstNib,
                                     forCellWithReuseIdentifier: "\(FirstStatCollectionViewCell.self)")
        
        let secondNib = UINib(nibName: "\(SecondStatCollectionViewCell.self)", bundle: nil)
        
        statsCollectionView.register(secondNib,
                                     forCellWithReuseIdentifier: "\(SecondStatCollectionViewCell.self)")
        
        statsCollectionView.showsVerticalScrollIndicator = false
        
    }
}

extension StatisticViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            guard let cellOne = collectionView.dequeueReusableCell(withReuseIdentifier: "FirstStatCollectionViewCell", for: indexPath) as? FirstStatCollectionViewCell else {
                fatalError("Wrong cell type for section 0. Expected FirstStatCollectionViewCell")
            }
            cellOne.createChart()
            
            return cellOne
            
        } else  {
            guard let cellTwo = collectionView.dequeueReusableCell(withReuseIdentifier: "SecondStatCollectionViewCell", for: indexPath) as? SecondStatCollectionViewCell else {
                fatalError("Wrong cell type for section 0. Expected SecondStatCollectionViewCell")
            }
            cellTwo.createChart()
            return cellTwo
        } 
    }
}

extension StatisticViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        20
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 334, height: 312)
    }
}
