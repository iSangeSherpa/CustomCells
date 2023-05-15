import UIKit
import SnapKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    // MARK: Variables
    
    public var brands = [Brand]()
    
    static let identifier = "CustomCollectionViewCell"
    
    var label : UILabel = {
       var label = UILabel()
        label.text = "Error"
        return label
    }()
    
    var imageView: UIImageView = {
       var imageView = UIImageView()
        imageView.image = UIImage(systemName: "questionmark")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    
    // MARK: Main calling method
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(label)
        contentView.addSubview(imageView)
        
        imageView.snp.makeConstraints { maker in
            maker.top.leading.trailing.equalToSuperview()
            maker.bottom.equalTo(label.snp.top)
            maker.height.width.equalTo(100)
        }
        
        label.snp.makeConstraints { maker in
            maker.center.equalTo(imageView.snp.center)
            maker.top.equalTo(imageView.snp.bottom)
            maker.bottom.equalToSuperview()
//            maker.top.equalTo(imageView.snp.bottom)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
