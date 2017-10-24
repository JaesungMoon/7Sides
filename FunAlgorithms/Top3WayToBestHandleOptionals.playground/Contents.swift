//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

class MyViewController: UIViewController {
    let redLabel: UILabel = {
       let label = UILabel()
        label.text = "5"
        label.backgroundColor = .red
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.textAlignment = .center
        return label
    }()
    
    let blueLabel: UILabel = {
        let label = UILabel()
        label.text = "4"
        label.backgroundColor = .blue
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.textAlignment = .center
        return label
    }()
    
    let winnerLabel: UILabel = {
        let label = UILabel()
        label.text = "Who won?"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Roll Dices", style: .plain, target: self, action: #selector(handleRollDices))
        
        // let's make our lives easier with UIStackView
        let arrangedSubviews = [redLabel, blueLabel]
        let stackView = UIStackView(arrangedSubviews: arrangedSubviews)
        stackView.distribution = .fillEqually
        stackView.spacing = 12
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        stackView.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 12).isActive = true
        stackView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(winnerLabel)
        NSLayoutConstraint.activate(
            [winnerLabel.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 12),
             winnerLabel.widthAnchor.constraint(equalTo: view.widthAnchor),
             winnerLabel.heightAnchor.constraint(equalToConstant: 24)
            ])
    }
    
    //MARK: handle
    @objc func handleRollDices() {
        let redValue = arc4random_uniform(6) + 1
        redLabel.text = "\(redValue)"
        
        let blueValue = arc4random_uniform(6) + 1
        blueLabel.text = "\(blueValue)"
        
        redLabel.text = nil
        evaluateWinner()
    }
    
    fileprivate func evaluateWinner() {
        winnerLabel.text = "Figuring out whe won..."
        
        if let redText = redLabel.text {
            if let blueText = blueLabel.text {
                if redText == blueText {
                    winnerLabel.text = "Tie"
                } else if redText > blueText {
                    winnerLabel.text = "Red Won"
                } else {
                    winnerLabel.text = "Blue Won"
                }
            }
            
        }
        
        
        
//        if redLabel.text == blueLabel.text {
//            winnerLabel.text = "Tie"
//        } else if redLabel.text! > blueLabel.text! {
//            winnerLabel.text = "Red Won"
//        } else {
//            winnerLabel.text = "Blue Won"
//        }
    }
    
    
    
}
// Present the view controller in the Live View window

PlaygroundPage.current.liveView = UINavigationController(rootViewController: MyViewController())


