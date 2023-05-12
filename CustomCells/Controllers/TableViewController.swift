import UIKit
import SnapKit


class TableViewController: UIViewController {
    
    lazy var tableView : UITableView = {
        var table = UITableView()
        table.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
        table.delegate = self
        table.dataSource = self
        return table
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupUI()
    }
    
    func setupUI() {
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { maker in
            maker.leading.top.bottom.trailing.equalTo(view.safeAreaLayoutGuide)
        }
    }
}


extension TableViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as! CustomTableViewCell
        
        // Configure the cell
        cell.image.image = UIImage(named: "img2")
        
        return cell
    }
    
}
