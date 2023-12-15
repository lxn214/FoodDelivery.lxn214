//
//  NavBar.swift
//  FoodDelivery
//
//  Created by Leeroy Njiva on 29/07/2023.

import SwiftUI

struct NavBar: View {
    @State private var selection = 1
    
    init() {
        UITabBar.appearance().backgroundColor = .white
    }
    
    var body: some View {
        TabView(selection: $selection) {
            HomeView().tabItem {
                VStack {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            }.tag(1)
            
            FavoriteView().tabItem {
                VStack {
                    Image(systemName: "heart.fill")
                    Text("Favorite")
                }
            }.tag(2)
            
            ProfileView().tabItem {
                VStack {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
            }.tag(3)
        }
        .accentColor(.red)
    }
}

struct FavoriteView: View {
    var body: some View {
        VStack {
            Text("Favorite")
                .font(.title)
                .padding()
            
            // Add your food items list here
            
            Spacer()
        }
    }
}

struct ProfileView: View {
    @State private var fullName: String = ""
    @State private var username: String = ""
    @State private var password: String = ""

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Personal Information")) {
                    TextField("Full Name", text: $fullName)
                }

                Section(header: Text("Credentials")) {
                    TextField("Username", text: $username)
                    SecureField("Password", text: $password)
                }

                Section {
                    Button("Register", action: {
                        // Handle registration
                    })

                    Button("Sign In", action: {
                        // Handle sign in
                    })
                }
            }
            .navigationBarTitle("Profile", displayMode: .inline)
        }
    }
}

struct NavBar_Previews: PreviewProvider {
    static var previews: some View {
        NavBar()
    }
}
