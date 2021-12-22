//
//  CVCcache.swift
//  CocMauXanh
//
//  Created by Nguyen Hoang Viet on 20/12/2021.
//

import UIKit

class CVCcache: UICollectionViewCell {
  static let identifier = "CVCcache"

  private let imageView: UIImageView = {
    let imageView = UIImageView()
    imageView.clipsToBounds = true
    imageView.contentMode = .scaleToFill
    return imageView
  }()
  private var lbID: UILabel = {
    let lbID = UILabel()

    return lbID

  }()


  override init(frame: CGRect) {
    super.init(frame: frame)
    contentView.addSubview(imageView)
    contentView.addSubview(lbID)
  }
  override func layoutSubviews() {
    super.layoutSubviews()
    imageView.frame = contentView.bounds
    lbID.frame = contentView.bounds

  }

 

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  func setupView() {
    addSubview(imageView)
    addSubview(lbID)
    
  }
  override func prepareForReuse() {
    super.prepareForReuse()
    imageView.image = nil
    lbID.text = nil

  }

  func configure(with urlString: String, Id: Int) {
    guard let url = URL(string: urlString) else {
      return
    }

    URLSession.shared.dataTask(with: url) { data, _, error in
      guard let data = data, error == nil else {
        return
      }
      DispatchQueue.main.async {
        let image = UIImage(data: data)
        self.imageView.image = image

        
        
      
      }
    }.resume()
  }



}
