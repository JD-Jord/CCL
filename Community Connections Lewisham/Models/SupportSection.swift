//
// tried to create a class for specific pages of form but proved undoable due to not being able to override the inits of UIViewController through a subclass, will do lots of copying and pasting instead
//
//
//
////  SupportSection.swift
////  Community Connections Lewisham
////
////  Created by cex on 18/07/2022.
////
//
//import Foundation
//import UIKit
//
//class SupportSectionViewController: UIViewController {
//
//    let support: [String]
//
//    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
//        print("init nibName style")
//        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
//        self.support = []
//
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.hideKeyboardOnTaps()
//
//       tableView.dataSource = self
//       tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
//
//    }
//
//
//}
//
//
//extension SupportSectionViewController: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return support.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let newSupport = support[indexPath.row]
//
//        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! TickboxCell
//        cell.supportBtn.setTitle(newSupport, for: .normal)
//        return cell
//    }
//
//
//
//}
