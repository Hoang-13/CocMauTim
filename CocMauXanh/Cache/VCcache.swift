//
//  VCcache.swift
//  CocMauXanh
//
//  Created by Nguyen Hoang Viet on 20/12/2021.
//

import UIKit
class VCcache: UIViewController, UICollectionViewDataSource {
  
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
      layout.minimumLineSpacing = 20
      layout.minimumInteritemSpacing = 0
      layout.itemSize = CGSize(width: view.frame.size.width, height: view.frame.size.height/3.0 - 40)
      let collectionView = UICollectionView(frame: .zero , collectionViewLayout: layout)
      collectionView.dataSource = self
      collectionView.register(ImageColletionViewCell.self, forCellWithReuseIdentifier: CVCcache.identifier)
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
      guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CVCcache.identifier,
                                                          for: indexPath)  as? ImageColletionViewCell
      else {
        return UICollectionViewCell()
      }
      cell.configure(with: imageURLString)
      return cell
    }
  }


//class VCcache: UIViewController {
//  private var collectionView: UICollectionView!
//  let urlString = "https://pixabay.com/api/?key=20539509-9119785eef187858be7619580"
//  var hits: [Hits] = []
//    override func viewDidLoad() {
//        super.viewDidLoad()
//      view.backgroundColor = .white
//      let layout = UICollectionViewFlowLayout()
//      layout.minimumLineSpacing = 12
//      layout.minimumInteritemSpacing = 12
//      layout.scrollDirection = .vertical
//      collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
//      collectionView.translatesAutoresizingMaskIntoConstraints = false
//      collectionView.backgroundColor = .white
//      collectionView.delegate = self
//      collectionView.dataSource = self
//      collectionView.register(CVCcache.self, forCellWithReuseIdentifier: CVCcache.identifier)
//      view.addSubview(collectionView)
//      setupContraints()
//
//
//    }
//
//  func setupContraints() {
//    NSLayoutConstraint.activate([
//      collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 12),
//      collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
//      collectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
//      collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10)
//    ])
//  }
//
//
//  func fetchPhotos() {
//    guard let url = URL(string: urlString) else {
//      return
//    }
//    let task = URLSession.shared.dataTask(with: url) { [weak self ] data, _, error in
//      guard let data = data, error == nil else {
//        return
//      }
//      do {
//        let jsonResult = try JSONDecoder().decode(Post.self, from: data)
//        DispatchQueue.main.async {
//          self?.hits = jsonResult.hits
//          self?.collectionView?.reloadData()
//        }
//      } catch {
//        print(error)
//      }
//    }
//    task.resume()
//  }
//
//}
//extension VCcache: UICollectionViewDelegate {
//
//}
//extension VCcache: UICollectionViewDataSource {
//  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//  return 30
//  }
//
//  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//    let imageURLString = hits[indexPath.row].webformatURL
//    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CVCcache.identifier ,
//                                                        for: indexPath)  as? ImageColletionViewCell
//    else {
//      return UICollectionViewCell()
//    }
//    cell.configure(with: imageURLString)
//    return cell
//  }
//
//
//}
