//
//  NewDogView.swift
//  FirebaseTutorial
//
//  Created by Fernanda García on 23/03/26.
//

import SwiftUI

struct NewDogView: View {
    @EnvironmentObject var dataManager: DataManager
    @Environment(\.dismiss) var dismiss
    @State private var newDog = ""
    
    var body: some View {
        NavigationView {
            VStack(spacing: 25) {
            
                Image(systemName: "dog.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                    .foregroundColor(.orange)
                    .padding(.top, 20)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("¿Cuál es la raza?")
                        .font(.headline)
                        .foregroundColor(.secondary)
                    
                    TextField("Ej. Golden Retriever", text: $newDog)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(12)
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.blue.opacity(0.5), lineWidth: 1)
                        )
                }
                
                Spacer()
                
                Button {
                    dataManager.addDog(dogBreed: newDog)
                    dismiss()
                } label: {
                    Text("Guardar")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(newDog.isEmpty ? Color.gray : Color.blue)
                        .cornerRadius(15)
                        .shadow(radius: 5)
                }
                .disabled(newDog.isEmpty)
            }
            .padding(24)
            .navigationTitle("Nuevo Perro")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancelar") {
                        dismiss()
                    }
                }
            }
        }
    }
}
