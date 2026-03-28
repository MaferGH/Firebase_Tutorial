//
//  ListView.swift
//  FirebaseTutorial
//
//  Created by Fernanda García on 23/03/26.

import SwiftUI

struct ListView: View {
    @EnvironmentObject var dataManager: DataManager
    @State private var showPopup = false
    @State private var searchText = ""
    
    // filtro
    var filteredDogs: [Dog] {
        if searchText.isEmpty {
            return dataManager.dogs
        } else {
            return dataManager.dogs.filter { $0.breed.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    var body: some View {
        NavigationView {
            ZStack {
         
                Color(.systemGroupedBackground)
                    .ignoresSafeArea()
                
                VStack(spacing: 0) {
                    // barra de búsqueda integrada
                    SearchBar(text: $searchText)
                        .padding(.horizontal)
                        .padding(.top, 8)
                    
                    if filteredDogs.isEmpty {
                        EmptyStateView()
                    } else {
                        List {
                            ForEach(filteredDogs) { dog in
                                DogRowView(dog: dog)
                                    .listRowBackground(Color(.systemBackground))
                                    .listRowSeparator(.hidden)
                                    .padding(.vertical, 4)
                            }
                            .onDelete(perform: deleteDog)
                        }
                        .listStyle(PlainListStyle())
                        .background(Color(.systemGroupedBackground))
                    }
                }
                .navigationTitle("Mis Perros")
                .navigationBarTitleDisplayMode(.large)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: { showPopup.toggle() }) {
                            Image(systemName: "plus")
                                .font(.title2)
                                .foregroundColor(.blue)
                        }
                    }
                }
                .sheet(isPresented: $showPopup) {
                    NewDogView()
                }
            }
        }
    }
    

    private func deleteDog(at offsets: IndexSet) {
        for index in offsets {
            let dog = filteredDogs[index]
            dataManager.deleteDog(dog: dog)
        }
    }
}

struct DogRowView: View {
    let dog: Dog
    
    var body: some View {
        HStack(spacing: 12) {
            // Ícono de perro con gradiente
            Image(systemName: "dog.fill")
                .font(.title2)
                .foregroundColor(.white)
                .frame(width: 44, height: 44)
                .background(
                    LinearGradient(
                        gradient: Gradient(colors: [Color.orange, Color.red]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .clipShape(Circle())
                .shadow(color: .black.opacity(0.1), radius: 2, x: 0, y: 2)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(dog.breed)
                    .font(.headline)
                    .fontWeight(.medium)
                Text("Raza canina")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .font(.caption)
                .foregroundColor(.gray)
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 12)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .shadow(color: .black.opacity(0.05), radius: 4, x: 0, y: 2)
        )
        .padding(.horizontal, 16)
    }
}

struct SearchBar: View {
    @Binding var text: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            TextField("Buscar raza", text: $text)
                .autocapitalization(.none)
                .disableAutocorrection(true)
            if !text.isEmpty {
                Button(action: { text = "" }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                }
            }
        }
        .padding(10)
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }
}

struct EmptyStateView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "pawprint.fill")
                .font(.system(size: 70))
                .foregroundColor(.orange.opacity(0.6))
            Text("No hay perros registrados")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
            Text("Presiona el botón '+' para agregar una raza")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemGroupedBackground))
    }
}

// MARK: - Preview
struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
            .environmentObject(DataManager())
    }
}
