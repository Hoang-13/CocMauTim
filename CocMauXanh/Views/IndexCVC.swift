//
//  IndexCVC.swift
//  CocMauXanh
//
//  Created by Nguyen Hoang Viet on 19/12/2021.
//

import UIKit

class IndexCVC: UICollectionViewCell {
  let identifier =  "IndexCVC"
  var clBackgroudCell = UIColor()
  var imgAvata = UIImage()
  var imgAvataProfile = UIImage()
  var lbNameChannel = UILabel()
  override init(frame: CGRect) {
    super.init(frame: frame)
    contentView.backgroundColor = .red


  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

}
