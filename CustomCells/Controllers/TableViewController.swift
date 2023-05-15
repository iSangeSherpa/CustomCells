import UIKit
import SnapKit

class TableViewController: UIViewController {
        
    // MARK: Variables
    
    var tableView : UITableView = {
       var tableView = UITableView()
        tableView.register(
            CustomTableViewCell.self,
            forCellReuseIdentifier: CustomTableViewCell.identifier
        )
        return tableView
    }()
    
    
    // MARK: Main Calling Method
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    private func setupUI() {
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { maker in
            maker.leading.top.trailing.bottom.equalToSuperview()
        }
    }
    
}




extension TableViewController : UITableViewDelegate, UITableViewDataSource {
    
    // Section Configurations
//    func numberOfSections(in tableView: UITableView) -> Int { 4 }
//    
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat { 50 }
//    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let view = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height/2))
//        view.backgroundColor = .green
//        return view
//    }
    
    
    // Row Configurations
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as! CustomTableViewCell
        
        // MARK: Cell Configuration
        cell.backgroundColor = .darkGray
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
    }
    
}
