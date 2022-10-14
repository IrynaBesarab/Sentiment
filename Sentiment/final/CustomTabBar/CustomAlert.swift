import UIKit

class MyAlert {
    
    let constants = Constants()
    
    private let backgroundView: UIView = {
        let backgroundView = UIView()
        backgroundView.backgroundColor = .black
        backgroundView.alpha = 0
        return backgroundView
    }()
    
    private let alertView: UIView = {
        let alert = UIView()
        alert.backgroundColor = .white
        alert.layer.masksToBounds = true
        alert.layer.cornerRadius = 12
        return alert
    }()
    
    private var myTargetView: UIView?
    
    func showAlert(title: String,
                   message: String,
                   on viewController: UIViewController) {
        guard let targetView = viewController.view else {
            return
        }
        
        myTargetView = targetView
        
        backgroundView.frame = targetView.bounds
        targetView.addSubview(backgroundView)
        
        targetView.addSubview(alertView)
        alertView.backgroundColor = UIColor(red: 106/255.0, green: 167/255.0, blue: 134/255.0, alpha: 1.0)
        
        alertView.frame = CGRect(x: 40,
                                 y: -300,
                                 width: targetView.frame.size.width-80,
                                 height: 300)
        
        let titleLabel = UILabel(frame: CGRect(x: 0,
                                               y: 20,
                                               width: alertView.frame.size.width,
                                               height: 89))
        titleLabel.text = title
        titleLabel.textColor = .white
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont(name: "Papyrus", size: 25)
        alertView.addSubview(titleLabel)
        
        let messageLabel = UILabel(frame: CGRect(x: 0,
                                                 y: 80,
                                                 width: alertView.frame.size.width,
                                                 height: 170))
        messageLabel.numberOfLines = 0
        messageLabel.text = message
        messageLabel.textAlignment = .center
        messageLabel.textColor = .white
        messageLabel.font = UIFont(name: "Papyrus", size: 20)
        
        alertView.addSubview(messageLabel)
        
        let button = UIButton(frame: CGRect(x: 85,
                                            y: alertView.frame.size.height-70,
                                            width: alertView.frame.size.width / 2,
                                            height: 50))
        
        button.setTitle("ok",
                        for: .normal)
        button.layer.borderWidth = 0.5
        button.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0)
        button.backgroundColor = .white
        button.layer.cornerRadius = 20
        button.titleLabel?.font =  UIFont(name: "Papyrus", size: 20)
        button.titleLabel?.textColor = .gray
        button.setTitleColor(.link, for: .normal)
        button.addTarget(self,
                         action: #selector(dismissAlert),
                         for: .touchUpInside)
        alertView.addSubview(button)
        
        
        UIView.animate(withDuration: 0.25) {
            self.backgroundView.alpha = self.constants.alertBackgroundAlpha
        } completion: { done in
            if done { UIView.animate(withDuration: 0.25, delay: 0, options: []) {
                self.alertView.center = targetView.center
                }
            }
        }
    }
    
    @objc func dismissAlert() {
        
        guard let targetView = myTargetView else {
            return
        }
        
        UIView.animate(withDuration: 0.25) {
            self.alertView.frame = CGRect(x: 40,
                                          y: targetView.frame.size.height,
                                          width: targetView.frame.size.width-80,
                                          height: 300)
        } completion: { done in
            if done {
                UIView.animate(withDuration: 0.25, delay: 0, options: []) {
                    self.backgroundView.alpha = 0
                    self.alertView.removeFromSuperview()
                    self.backgroundView.removeFromSuperview()
                }
            }
        }
    }
}
