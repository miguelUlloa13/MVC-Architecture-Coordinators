import UIKit
import Kingfisher

class CharacterListViewController: UIViewController {
    
    // MARK: IBOutlets
    @IBOutlet weak var CharacterTableView: UITableView!
    @IBOutlet weak var activityView: UIActivityIndicatorView!
    
    // MARK: Properties
    let apiClient = ListOfCharactersAPIClient()
    var characterList: [CharacterDataModel] = []
    
    // var characterDetailCoordinator: CharacterDetailPushCoordinator?
    var characterDetailCoordinator: CharacterDetailModalCoordinator?
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CharacterTableView.delegate = self
        CharacterTableView.dataSource = self
        CharacterTableView.register(UINib(nibName: "CharacterListTableViewCell", bundle: nil), forCellReuseIdentifier: "CharacterListTableViewCell")
        activity(isHidden: false)
        configureTableView()

        
    }
    
    private func activity(isHidden : Bool){
        if !isHidden{
            activityView.startAnimating()
        }else{
            activityView.stopAnimating()
        }
        activityView.isHidden = isHidden
    }
    
    private func configureTableView(){
        Task {
            let result = await apiClient.getListOfCharacters()
            switch result {
            case .success(let model):
                print(model.results)
                characterList = model.results
                activity(isHidden : true)
                CharacterTableView.reloadData()
                
            case .failure(let error):
                print(error)
            }
        }
    }
    

}
 
extension CharacterListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characterList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = CharacterTableView.dequeueReusableCell(withIdentifier: "CharacterListTableViewCell", for: indexPath) as! CharacterListTableViewCell
        let character = characterList[indexPath.row]
        
        cell.characterID.text = character.id.description
        cell.characterNameLbl.text = character.name
        cell.characterSpecie.text = character.species
 
        cell.characterImage.kf.setImage(with: URL(string: character.image))
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let character = characterList[indexPath.row]
        
        /*
         // Forma sin patron coordinator
        let characterDetailViewController = CharacterDetailViewController(characterDataModel: character)
        
        self.present(characterDetailViewController, animated: true)
         */
        
        /*
        // forma cordinator push
        self.characterDetailCoordinator = CharacterDetailPushCoordinator(navigationController: self.navigationController, characterModel: character)
        self.characterDetailCoordinator?.start()
        */
        
        // forma coordinator modal
        self.characterDetailCoordinator = CharacterDetailModalCoordinator(viewController: self, characterModel: character)
        self.characterDetailCoordinator?.start()
    }
}


