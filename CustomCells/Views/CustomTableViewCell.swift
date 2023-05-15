import UIKit
import SnapKit

struct Brand {
    var brandName : String
    var brandLogo : UIImage?
}

class CustomTableViewCell: UITableViewCell {

    // MARK: Variables
    static let identifier = "CustomTableViewCell"
    
    var brands = [Brand]()
    
    var layout : UICollectionViewFlowLayout = {
       var layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 20, right: 10)
        layout.scrollDirection = .horizontal
        return layout
    }()

    lazy var collectionView : UICollectionView = {
        var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(
            CustomCollectionViewCell.self,
            forCellWithReuseIdentifier: CustomCollectionViewCell.identifier
        )
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .darkGray
        return collectionView
    }()
    
    
    // MARK: Main Calling method
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
        createBrands()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupUI() {
        contentView.addSubview(collectionView)
        
        collectionView.snp.makeConstraints { maker in
            maker.leading.trailing.equalToSuperview()
            maker.top.equalToSuperview().offset(10)
            maker.bottom.equalToSuperview().offset(-10)
            
        }
    }
    
    
    func createBrands() {
        brands.append(Brand(brandName: "Brand 1", brandLogo: UIImage(named: "img1")))
        brands.append(Brand(brandName: "Brand 2", brandLogo: UIImage(named: "img2")))
        brands.append(Brand(brandName: "Brand 3", brandLogo: UIImage(named: "img3")))
        brands.append(Brand(brandName: "Brand 4", brandLogo: UIImage(named: "img4")))
    }
}




extension CustomTableViewCell : UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return brands.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 130)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as! CustomCollectionViewCell
        
        // MARK: Cell Configuration
        let brand = brands[indexPath.row]
        cell.label.text = brand.brandName
        cell.imageView.image = brand.brandLogo
        cell.backgroundColor = .white
        
        return cell
    }
    
}
