import UIKit

class ThirdViewController: UIViewController {

    var text = ""

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(text)
        self.textLabel.text = self.text
    }
    
    
    
    @IBAction func izmenitView(_ sender: UIButton) {
        let myImage = UIImage(named: "imeg4" )
        self.imageView.image = myImage
    }
    
    
    @IBOutlet weak var textLabel: UILabel!
    
    
}
