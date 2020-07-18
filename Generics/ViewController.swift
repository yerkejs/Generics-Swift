//
//  ViewController.swift
//  Generics
//
//  Created by erkebulan elzhan on 7/18/20.
//  Copyright © 2020 erkebulan elzhan. All rights reserved.
//

import UIKit

class BaseTableView<T: BaseCell<F>, F>: UITableViewController {
    let cellId = "cell"
    
    var items = [F]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(T.self, forCellReuseIdentifier: cellId)
        tableView.backgroundColor = .orange
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId) as! BaseCell<F>
        cell.item = items[indexPath.row]
        return cell
    }
}
class BaseCell<F>: UITableViewCell {
    var item: F!
    override func layoutSubviews() {
        super.layoutSubviews()
    }
}


struct Footballer {
    let name, club: String
}

class FootbellerCell: BaseCell<Footballer> {
    override var item: Footballer! {
        didSet {
            print("set", item.name, item.club)
            textLabel?.text = item.name
            detailTextLabel?.text = item.club
        }
    }
}


class ViewController: BaseTableView<FootbellerCell, Footballer> {
    override func viewDidLoad() {
        super.viewDidLoad()
        items = [
            Footballer(name: "Messi", club: "Barcelona"),
            Footballer(name: "Ronaldo", club: "Real Madrid"),
            Footballer(name: "Lewandowski", club: "Bayern Munich")
        ]
    }
}

