//
//  ViewController.swift
//  testTb
//
//  Created by Jz D on 2020/4/24.
//  Copyright © 2020 Jz D. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    
    lazy var cellBg: UIView = { () -> UIView in
        let edge: CGFloat = 15
        let v = UIView(frame: CGRect(x: edge, y: PersonalData.info.headH, width: view.frame.width - edge * 2, height: PersonalData.info.cellH*4))
        v.layer.shadowRadius = 11
        v.layer.shadowOffset = .zero
        v.layer.shadowOpacity = 1
        v.layer.backgroundColor = UIColor.white.cgColor
        v.layer.cornerRadius = 11
        v.layer.shadowColor = UIColor.purple.cgColor
            
            //  UIColor(red: 0.87, green: 0.87, blue: 0.87, alpha: 0.5).cgColor
        
        return v
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = UIColor.white
        tableView.register(UINib(nibName: "MineCell", bundle: nil), forCellReuseIdentifier: "MineCell")
        tableView.rowHeight = PersonalData.info.cellH
        
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none

        tableView.backgroundColor = UIColor.white
        tableView.insertSubview(cellBg, at: 0)
        
    }


    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        let edge: CGFloat = 5
        let f = cellBg.bounds.inset(by: UIEdgeInsets(top: edge, left: 0, bottom: 0, right: edge))
        cellBg.layer.shadowPath = UIBezierPath(rect: f).cgPath
     //   tableView.sendSubviewToBack(cellBg)
        tableView.bringSubviewToFront(cellBg)
    }
    
}




extension ViewController{
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PersonalData.info.items.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MineCell", for: indexPath) as! MineCell
        let data = PersonalData.info.items[indexPath.row]
        cell.config(data)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
    
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let v = UIView()
        v.backgroundColor = UIColor.yellow
        return v
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return PersonalData.info.headH
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.zero
    }
}
