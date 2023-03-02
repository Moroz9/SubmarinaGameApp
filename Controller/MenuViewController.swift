
import Foundation
import UIKit

class MenuViewController : UIViewController {
    
    //MARK:  - IBOtlets

    
    override func viewDidLoad()  {
            super.viewDidLoad()
        }
    
    //MARK: - IBActions
    
    @IBAction func settingsButton(_ sender: UIButton) {
        guard let controler = self.storyboard?.instantiateViewController(withIdentifier: "SettingViewController") as? SettingViewController else { return}
        self.present(controler, animated: true, completion: nil)
    }
    
    @IBAction func newGameButton(_ sender: UIButton) {
        guard let controler = self.storyboard?.instantiateViewController(withIdentifier: "GameViewController") as? GameViewController else { return}
        self.present(controler, animated: true)
    }
    
    
    @IBAction func resultButton(_ sender: UIButton) {
        guard  let controler = self.storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as? ResultViewController else {return}
        
        self.present(controler, animated: true, completion: nil)
    }
    
}
