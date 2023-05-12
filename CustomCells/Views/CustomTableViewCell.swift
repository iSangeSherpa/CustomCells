import UIKit
import SnapKit

class CustomTableViewCell: UITableViewCell {
    
    static let identifier = "CustomTebleViewCell"
    
    var image: UIImageView = {
       var image = UIImageView()
        image.image = UIImage(systemName: "questionmark")
//        image.frame.size = CGSize(width: 100, height: 100)
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(image)
        
        image.snp.makeConstraints { maker in
            maker.centerX.equalToSuperview()
            maker.top.leading.equalToSuperview().offset(10)
            maker.bottom.equalToSuperview().offset(-10)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
