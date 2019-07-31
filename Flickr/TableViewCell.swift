//
//  TableViewCell.swift
//  Flickr
//
//  Created by Александр on 21/06/2019.
//  Copyright © 2019 Александр. All rights reserved.
//

import Foundation
import UIKit

private let widthLabel:CGFloat = 400
private let heightLabel:CGFloat = 50
private let verticalMargin: CGFloat = 15

class TableViewCell: UITableViewCell {
    
    let label = UILabel()
    let imagine = UIImageView()
    
    func configureCell(model: Model) {
        self.label.text = model.nameImg
        self.imagine.imageDownload(urlString: model.urlImg)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.label.frame = CGRect(x: (self.contentView.frame.width / 2) - widthLabel / 2 , y: verticalMargin, width: widthLabel, height: heightLabel)
        self.imagine.frame = CGRect(x: 5, y: self.label.frame.maxY + verticalMargin, width: self.contentView.frame.width - 10, height: contentView.frame.height - heightLabel - verticalMargin * 3)
        self.label.textAlignment = .center
        self.label.textColor = .brown
        self.label.lineBreakMode = .byTruncatingMiddle
        self.label.numberOfLines = 2
        self.label.font = UIFont(name: "Cochin", size: 20)
        self.addSubview(self.label)
        self.addSubview(self.imagine)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
