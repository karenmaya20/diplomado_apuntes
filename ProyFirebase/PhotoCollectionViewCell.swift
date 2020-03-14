
import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    var photoView: UIImageView = {
        let pv = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        return pv
    }()
    override init(frame: CGRect) { //Creando objetos ...
        super.init(frame: frame)
        print("Pintando")
        addSubview(photoView)
    }
    
    required init?(coder: NSCoder) { //
        super.init(coder: coder)
    }
    
}
