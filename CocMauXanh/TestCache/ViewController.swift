//
//  ViewController.swift
//  CocMauXanh
//
//  Created by Nguyen Hoang Viet on 20/12/2021.
//

import UIKit


class ViewController: UIViewController, UICollectionViewDataSource {
  let urlString = "https://pixabay.com/api/?key=20539509-9119785eef187858be7619580"
  private var collectionView: UICollectionView?
  var hits: [Hits] = []
  override func viewDidLoad() {
    super.viewDidLoad()
    consTrain()
    fetchPhotos()
  }

  func consTrain() {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .vertical
    layout.minimumLineSpacing = 0
    layout.minimumInteritemSpacing = 0
    layout.itemSize = CGSize(width: view.frame.size.width, height: view.frame.size.height/3.0 - 40)
    let collectionView = UICollectionView(frame: .zero , collectionViewLayout: layout)
    collectionView.dataSource = self
    collectionView.register(ImageColletionViewCell.self, forCellWithReuseIdentifier: ImageColletionViewCell.identifier)
    view.addSubview(collectionView)
    self.collectionView = collectionView
  }

  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    collectionView?.frame = view.bounds
  }

  func fetchPhotos() {
    guard let url = URL(string: urlString) else {
      return
    }
    let task = URLSession.shared.dataTask(with: url) { [weak self ] data, _, error in
      guard let data = data, error == nil else {
        return
      }
      do {
        let jsonResult = try JSONDecoder().decode(Post.self, from: data)
        DispatchQueue.main.async {
          self?.hits = jsonResult.hits
          self?.collectionView?.reloadData()
        }
      } catch {
        print(error)
      }
    }
    task.resume()
  }

  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return hits.count
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let imageURLString = hits[indexPath.row].webformatURL
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageColletionViewCell.identifier,
                                                        for: indexPath)  as? ImageColletionViewCell
    else {
      return UICollectionViewCell()
    }
    cell.configure(with: imageURLString)
    return cell
  }
}
