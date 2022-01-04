import UIKit
import TinyConstraints

class CustomCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CustomCollectionViewCell"
    
    private let imagePokemon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "pokebola2")
        return imageView
    }()
    
    private let namePokemon: UILabel = {
        let label = UILabel()
        label.text = "  Nome do pokemon  "
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.layer.shadowColor = UIColor.black.cgColor
        label.layer.shadowRadius = 2.0
        label.layer.shadowOpacity = 0.5
        label.layer.shadowOffset = CGSize(width: 1, height: 1)
        label.layer.masksToBounds = false
        return label
    }()
    
    private let typePokemon: UILabel = {
        let label = UILabel()
        label.text = "  tipo  "
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        label.layer.backgroundColor = UIColor.black.cgColor.copy(alpha: 0.3)
        label.backgroundColor = .clear
        label.layer.cornerRadius = 8
        label.clipsToBounds = true
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = .white
        layoutSubviews()
        
        layer.cornerRadius = 25
        clipsToBounds = true
        
    }
    
    override func layoutSubviews() {
        
        contentView.addSubview(namePokemon)
        contentView.addSubview(imagePokemon)
        contentView.addSubview(typePokemon)
        
        namePokemon.topToSuperview(offset: 16)
        namePokemon.leadingToSuperview(offset: 4)
        
        typePokemon.leadingToSuperview(offset: 16)
        typePokemon.top(to: namePokemon , offset: 48)
        
        imagePokemon.width(120)
        imagePokemon.height(120)
        imagePokemon.top(to: namePokemon , offset: 60)
        imagePokemon.trailingToSuperview(offset: 16)
        
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
