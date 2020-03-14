import UIKit

private let reuseIdentifier = "celda"

class PhotoCollectionViewController: UICollectionViewController {
    
    var urlList: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
        // Por si no llega a funcionar collectionView.delegate = self
        
        getPhotos()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return urlList.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PhotoCollectionViewCell
    
        let url = urlList[indexPath.item]
        let urlPhoto = URL(string: url)
        
        URLSession.shared.dataTask(with: urlPhoto!){ (data, _, _) in
            guard let data = data else {
                cell.photoView.image = UIImage(named: "anon")
                return
            }
            DispatchQueue.main.async{
                cell.photoView.image = UIImage(data: data)
            }
        }.resume()
        //cell.backgroundColor = .black
        cell.photoView.image = UIImage(named: "anon") //nombre de la foto descargada
        cell.layer.borderColor = UIColor.black.cgColor
        
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        let cell = collectionView.cellForItem(at: indexPath) as! PhotoCollectionViewCell
        let detailView = DetailPhotoViewController() //instancia
        //present(detailView, animated: true)
        detailView.imagen = cell.photoView.imagen
        navigationController?.pushViewController(detailView, animated: true)
        
        
    }
    
    func getPhotos(){
        let urlFlickr = "https://www.flickr.com/services/rest/?method=flickr.photos.search&api_key=ca8aa2ae5c208b3e28e2dd5ada0f1407&tags=mexico&format=json&nojsoncallback=1"
        
        let url = URL(string: urlFlickr)
        
        let jsondecoder = JSONDecoder()
        
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if let error = error{
                print(error.localizedDescription)
                return
            }
            
            if let data = data, let results = try? jsondecoder.decode(ResultsSeach.self, from: data){
                let photos = results.photos.photo
                var temp:[String] = []
                for photo in photos{
                    let url = "https://farm\(photo.farm).staticflickr.com/\(photo.server)/\(photo.id)_\(photo.secret)_b.jpg"
                    temp.append(url)
                }
                self.urlList = temp
                DispatchQueue.main.async{
                    self.collectionView.reloadData()
                }
            }
        }.resume()
    }

}

//agregar funcionalidades: Separar protocolos
extension PhotoCollectionViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
}
func collectionView(_ collectionView: UICollectionView, layoutcollectionViewLayout: UICollectionViewLayout, insertForSectionAt section: Int) -> UIEdgeInsets{
    return UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
}


