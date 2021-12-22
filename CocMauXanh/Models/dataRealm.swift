////
////  data.swift
////  Database
////
////  Created by Nguyen Hoang Viet on 20/12/2021.
////
//
//import Foundation
//import  RealmSwift
//
//// khai bao lop doi tuong cong viec se duoc thuc hinh
//class Student: Object {
//  @objc dynamic var id: Int = 0
//  @objc dynamic var name: String = ""
//  @objc dynamic var age: Int = 0
//
//  // dnah dau thuoc tinh ID la khoa chinh cua doi tuong
//  override static func primaryKey() -> String {
//    // Truong ID la khoa chinh cua doi tuong
//    return "ID"
//  }
//}
//
//// Khái báo lớp quản lí cơ sở dữ liệu.
//class DBManager {
//  // Biến chứa tham chiếu đến cơ sỏ dữ liệu REalmSwift
//  private var database: Realm
//
//
//  // Biến chứa thực thể duy nhất của class DBManager.
//  // trên 1 ứng dụng chỉ có 1 thực thể duy nhất
//
//  static let shareInstance = DBManager()
//
//  // Biến đinh danh ID
//  static var autoID:Int = 0
//
//  // Biến tham chiếu tới UserDefaults data lưu laị auto ID
//  let userData: UserDefaults!
//
//  // Hàm khởi tạo
//  private init() {
//    // Khởi tạo database realm
//    database = try! Realm()
//    // Khởi tạo user data và đọc thông tin userID nếu có
//    userData = UserDefaults.standard
//    DBManager.autoID = userData.integer(forKey: "autoID")
//
//
//
//  }
//  // hàm lấy dữ liệu phần tử cơ sở dữ liệu real ra
//  func getDataFromDB() -> Results<Student> {
//    let results: Results<Student> = database.objects(Student.self)
//    return results
//  }
//
//  // hàm thêm dữ liệu về cơ sở dữ iệu
//  func addData(txtNode: String, txtAge: Int) {
//    let object = Student()
//    // Thiết lập trường ID
//    object.id = DBManager.autoID
//    object.age = txtAge
//    object.name = txtNode
//    // Tăng giá trị hiện tại cho khoá Id
//    DBManager.autoID += 1
//    // Hàm lưu lại autoid vào userID(nếu có)
//    userData.set(DBManager.autoID, forKey: "autoID")
//    print("Đã thêm dữ liệu vào data")
//
//
//
//    // Ghi dữ liệu vào cơ sở dữ liệu
//    try! database.write {
//      database.add(object)
//    }
//
//  }
//
//  // Ham xoa 1 phần tử
//  func deleteItemFromDB(object: Student) -> Bool {
//    do {
//      try database.write {
//        database.delete(object)
//      }
//      return true
//    }
//    catch {
//      return false
//    }
//  }
//
//
//
//  // Hàm xoá toàn dữ liệu
//  func deleAllFromDB() -> Bool {
//    do {
//      try database.write {
//        database.deleteAll()
//      }
//      return true
//    }
//    catch {
//      return false
//    }
//
//  }
//
//  // Hàm cập nhập thông tin một phần tử
////  func updateToDB(object: Student) -> Bool {
////    do {
////      try database.write {
////        database.add(object, update: true)
////      }
////      return true
////    }
////    catch {
////      return false
////    }
////  }
//
//
//}
//
