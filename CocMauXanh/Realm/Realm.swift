////
////  ViewController.swift
////  RealmTest
////
////  Created by Nguyen Hoang Viet on 20/12/2021.
////
//
//import UIKit
//import RealmSwift
//import Realm
//
//class Realm: UIViewController {
//  let realm = try! Realm()
//
//
//  override func viewDidLoad() {
//    super.viewDidLoad()
//    delete()
//    save()
//    render()
//
//  }
//
//  func render() {
//    let people = realm.objects(Person.self)
//    for person in people {
//      let firstName = person.firstName
//      let lastName = person.lastName
//      let fullName = "\(lastName) \(firstName)"
//      print("\(fullName)")
//    }
//  }
//
//   func delete(){
//
//    realm.beginWrite()
//    realm.delete(realm.objects(Person.self))
//    try! realm.commitWrite()
//  }
//
//  func save() {
//    let joe = Person()
//    joe.firstName = "Manh"
//    joe.lastName = "Thi"
//    let ng1 = Person()
//    ng1.firstName = "Manh1"
//    ng1.lastName = "Thi1"
//    let ng2 = Person()
//    ng2.firstName = "Manh2"
//    ng2.lastName = "Thi2"
//    let ng3 = Person()
//    ng3.firstName = "Manh3"
//    ng3.lastName = "Thi3"
//
//    realm.beginWrite()
//    realm.add(joe)
//    realm.add(ng1)
//    realm.add(ng2)
//    realm.add(ng3)
//
//   try! realm.commitWrite()
//
//  }
//
//
//}
//
//class Person: Object {
//  @objc dynamic var firstName: String = ""
//  @objc dynamic var lastName: String = ""
//  @objc dynamic var age: Int = 0
//
//}
//
//
