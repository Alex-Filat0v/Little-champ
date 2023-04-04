//
//  APIManager.swift
//  ZaDonat
//
//  Created by MacUniverse on 26.03.2023.
//

import Foundation
import UIKit
import Firebase
import FirebaseStorage
import FirebaseDatabase

class APIManager {
    
    static let shared = APIManager()
    
    private func configureFB() -> Firestore {
        var db: Firestore!
        let settings = FirestoreSettings()
        Firestore.firestore().settings = settings
        db = Firestore.firestore()
        return db
    }
    
    func getUser(id: String, imageID: String, completion: @escaping (User?) -> Void) {
        let db = configureFB()
        db.collection("users").document(id).getDocument() { (document, error) in
            guard error == nil else {completion(nil); return}
            self.getImage(id: imageID, completion: {image in
                let user = User(user_name: document?.get("user_name") as! String, image: image)
            completion(user)
            })
        }
        
    }
    
    func getImage(id: String, completion: @escaping (UIImage) -> Void) {
        let storage = Storage.storage()
        let reference = storage.reference()
        let pathRef = reference.child("user_pic")
        
        var image: UIImage = UIImage(named: "Chat")!
        
        let fileRef = pathRef.child(id + ".png")
        fileRef.getData(maxSize: 4098*4098, completion: {data, error in
            guard error == nil else{completion(image); return }
            image = UIImage(data: data!)!
            completion(image)
        })
        
        
    }
    
}

struct User {
    let user_name: String
    let image: UIImage
}

struct LoginField {
    var email: String
    var password: String
}

struct ResponceCode {
    var code: Int
}

struct Task {
    let task_name: String
    //mission, quest, job
}

enum AuthResponce {
    case succes, noVerify, error
}
