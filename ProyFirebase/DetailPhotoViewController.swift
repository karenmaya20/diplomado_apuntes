
import UIKit

class DetailPhotoViewController: UIViewController{
    
    var imagen: UIImage!
    
    let imageUp: UIButton = {
        let a = UIButton(type: .system)
        return a
    }()
    
    let photoView: UIImageView = {
        let pv = UIImageView(frame: CGRect(x: 8, y: 8, width: 300, height: 300))
        return pv
    }()
    let saveButton: UIButton = {
        let b = UIButton(type: .system)
        b.setTitle("Descargar Imagen", for: .normal)
        b.translatesAutoresizingMaskIntoConstraints = false
        b.addTarget(self, action: #selector(savePhoto), for: .touchUpInside)
        return b
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        photoView.image = imagen
        view.addSubview(photoView)
        view.addSubview(saveButton) //añadirlo a la vista
        view.addSubview(imageUp)
        photoView.center = view.center
        
        saveButton.topAnchor.constraint(equalTo: photoView.bottomAnchor, constant: 10).isActive = true
        saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
    }
    
    @objc func savePhoto(){
        print("Save")
        guard let image = photoView.image else { return }
        UIImageWriteToSavedPhotosAlbum(image, nil, #selector(image(_ :didFinishSavingWithError:contextInfo:)), nil)
    
        
        func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer){
            print("Guardando")
        }
    }
}
