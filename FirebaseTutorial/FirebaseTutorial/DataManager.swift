//
//  DataManager.swift
//  FirebaseTutorial
//
//  Created by Fernanda García on 23/03/26.
//

import SwiftUI
import Firebase
import Combine

class DataManager: ObservableObject {
    @Published var dogs: [Dog] = []
    private var listener: ListenerRegistration?  

    init() {
        fetchDogsRealtime()   
    }
    

    func fetchDogsRealtime() {
        let db = Firestore.firestore()

        listener = db.collection("Dogs").addSnapshotListener { snapshot, error in
            guard let documents = snapshot?.documents else {
                print("Error al escuchar cambios: \(error?.localizedDescription ?? "error desconocido")")
                return
            }
            
          
            self.dogs = documents.compactMap { document in
                let data = document.data()
                let breed = data["breed"] as? String ?? ""
            
                return Dog(id: document.documentID, breed: breed)
            }
        }
    }
    
    func deleteDog(dog: Dog) {
        let db = Firestore.firestore()
        db.collection("Dogs").document(dog.id).delete { error in
            if let error = error {
                print("Error al eliminar: \(error.localizedDescription)")
            }
        }
    }
    
    func addDog(dogBreed: String) {
        let db = Firestore.firestore()
       
        let ref = db.collection("Dogs").document()
        ref.setData([
            "breed": dogBreed
         
        ]) { error in
            if let error = error {
                print("Error al guardar: \(error.localizedDescription)")
            }
        }
    }
    
    deinit {
        listener?.remove()
    }
}
