
import Foundation
import UIKit

class GameViewController: UIViewController {
    // MARK: - IBOutlets
    
    @IBOutlet weak var submarinaObstacleView: UIView!
    @IBOutlet weak var shipObstacleView: UIView!
    @IBOutlet weak var diveTimeOutSubmarina: UIView!
    @IBOutlet weak var timeOutProgressiwView: UIProgressView!
    
    @IBOutlet weak var fishOneObstacleView: UIView!
    @IBOutlet weak var fishTwoObstacleView: UIView!
    @IBOutlet weak var fishThreeObstacleView: UIView!
    
    
    @IBOutlet weak var submarinaLightConstraint: NSLayoutConstraint!
    
    // MARK: - Variables And Properties
    
    var timerForSubmarina = Timer()
    var timerForFishShip = Timer()
    var timeForSubmarina = 20
    var speed: TimeInterval = 20
    
    
    
    // MARK: - IBActions
    
    @IBAction func stendUpSubmarina(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
        UIView.animate(withDuration: 1) {
            self.submarinaObstacleView.frame.origin.y -= 10 }
    }
    
    @IBAction func dowenUpSubmarina(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
        UIView.animate(withDuration: 1) {
            self.submarinaObstacleView.frame.origin.y += 10 }
    }
    
    
    
    // MARK: - View Controller
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fishMove()
        
        timerForSubmarina = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(diveTimeSubmarina), userInfo: nil, repeats: true)
        
        timerForFishShip = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(intersectsWithDamage), userInfo: nil, repeats: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        fishDamageMove()
        
    }
    //MARK: -  Flow funcs
    
    @objc func diveTimeSubmarina() {
        timeForSubmarina -= 1
        intersectsSubmarineOver()
        if timeForSubmarina == 0 {
            timerForSubmarina.invalidate()
            showAlert()
        }
    }
    
    func intersectsSubmarineOver() {
        if submarinaObstacleView.frame.intersects(diveTimeOutSubmarina.frame) {
            timeForSubmarina = 10
            
            timeOutProgressiwView.progress += 0.1432
            UIView.animate(withDuration: 0.3) {
                self.view.layoutIfNeeded()
            }
        } else {
            timeOutProgressiwView.progress -= 0.053
            UIView.animate(withDuration: 0.3) {
                self.view.layoutIfNeeded()
            }
        }
    }
    
    @objc func intersectsWithDamage() {
        if submarinaObstacleView.frame.intersects(shipObstacleView.frame) {
            self.showAlert()
        } else {
            print("no ")
        }
    }
    
    func fishMove() {
        let upSwipeRecognaizer = UISwipeGestureRecognizer(target: self, action: #selector(stendUpSubmarina))
        upSwipeRecognaizer.direction = .up
        self.view.addGestureRecognizer(upSwipeRecognaizer)
        
        let downSwipeRecognaizer = UISwipeGestureRecognizer(target: self, action: #selector(dowenUpSubmarina))
        downSwipeRecognaizer.direction = .down
        self.view.addGestureRecognizer(downSwipeRecognaizer)
    }
    
    func fishDamageMove() {
        
        UIView.animate(withDuration: self.speed ,
                       delay: 3,
                       options: [],
                       animations: { [weak self] in
            self?.shipObstacleView.frame.origin.x -= 1000
            self?.view.layoutIfNeeded()
        }, completion: nil)
//
//        UIView.animate(withDuration: 0.3) {
//            self.fishOneObstacleView.frame.origin.x -= 0
//        } completion: { _ in
//            self.fishOneObstacleView.frame.origin.x -= 100
//        }
//
//        UIView.animate(withDuration: self.speed ,
//                       delay: 6,
//                       options: [],
//                       animations: { [weak self] in
//            self?.fishTwoObstacleView.frame.origin.x -= 1200
//            self?.view.layoutIfNeeded()
//        }, completion: nil)
//
//        UIView.animate(withDuration: 5 ,
//                       delay: 0,
//                       options: [],
//                       animations: { [weak self] in
//            self?.submarinaObstacleView.frame.origin.x += 220
//            self?.view.layoutIfNeeded()
//        }, completion: nil)
//
//        UIView.animate(withDuration: self.speed ,
//                       delay: 4,
//                       options: [],
//                       animations: { [weak self] in
//            self?.fishThreeObstacleView.frame.origin.x -= 1000
//            self?.view.layoutIfNeeded()
//        }, completion: nil)
    }
    
    
    
    //MARK: -  Private funcs
    
    
    private func showAlert() {
        timerForSubmarina.invalidate()
        let showAletGameOver = UIAlertController(title:"GAME OVER", message: "Reply ?", preferredStyle: UIAlertController.Style.alert)
        let yesAlert = UIAlertAction(title: "Yes", style: .destructive){_ in
        }
        let noAletrt = UIAlertAction(title: "No", style: .default){_ in
            
        }
        showAletGameOver.addAction(yesAlert)
        showAletGameOver.addAction(noAletrt)
        present(showAletGameOver, animated: true)
    }
    
}


