//

import UIKit

class CustomCotroller: UIView {

    @IBOutlet weak var labe: UILabel!
    
    static func instansFromNib() -> CustomCotroller {
        return UINib(nibName: "CustomView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! CustomCotroller
    }
    
    func congigure(text: String){
        labe.text = text
        
    }

}
