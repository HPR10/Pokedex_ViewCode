import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    let request = ResquestPokedex()
  
    private var collectionView: UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showPokedex()

        self.title = "Pokedex"
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 34)
        ]
        navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 25
        layout.minimumInteritemSpacing = 0
        layout.collectionView?.layer.cornerRadius = 20.0
        layout.itemSize = CGSize(width: (view.frame.size.width/2)-10, height: (view.frame.size.width/2))
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        guard let collectionView = collectionView else {
            return
        }
        
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        view.addSubview(collectionView)
        collectionView.frame = view.bounds
        

    }
    
    func showPokedex()
    {
      //Passando nil como URL ele vai pegar a URL padrão
      request.getAllPokemons(url: nil)
      { (response) in
        switch response
        {
          case .success(let model):
            //Print do model
            print("X GET ALL POKEMONS \(model) \n")
            //Chamo a proxima função para exibir um pokemon especifico
            self.showPokemons()
          case .serverError(let description):
            print("Server Erro \(description)")
          case .noConnection(let description):
            print("No Connection \(description)")
          case .timeOut(let description):
            print("Time Out \(description)")
        case .invalidResponse:
            return
        }
      }
    }
    
    func showPokemons()
    {
      //Um id é passado para que busque um pokemon especifico
      request.getPokemon(id: 35)
      { (response) in
        switch response
        {
          case .success(let model):
            print("Y GET POKEMON \(model) \n")
            self.showImagePokemon(urlImage: model.urlImage)
          case .serverError(let description):
            print("Server Erro \(description)")
          case .noConnection(let description):
            print("No Connection \(description)")
          case .timeOut(let description):
            print("Time Out \(description)")
        case .invalidResponse:
            return
        }
      }
    }
    
    func showImagePokemon(urlImage:String)
    {
      request.getImagePokemon(url: urlImage)
      { (response) in
        switch response
        {
          case .success(let model):
            print("Z IMAGE POKEMON \(model)")
          case .serverError(let description):
            print("Server Erro \(description)")
          case .noConnection(let description):
            print("No Connection \(description)")
          case .timeOut(let description):
            print("Time Out \(description)")
        case .invalidResponse:
            return
        }
      }
    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath)
        return cell
    }
}





