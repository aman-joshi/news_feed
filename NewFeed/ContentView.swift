//
//  ContentView.swift
//  NewFeed
//
//  Created by Mohd Maruf on 05/05/21.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
      if let userData = Storage.fetch(from: Constants.Key.USER_DATA) {
        let country = userData["country"] as! [String:String]
        HomeView(userData: User(id: userData["id"] as! String, name: userData["name"] as! String, country: country.keys.first!)).environmentObject(MenuViewModel())
      }
      else{
        RegisterView()
      }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
