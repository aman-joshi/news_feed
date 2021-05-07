//
//  HomeView.swift
//  NewFeed
//
//  Created by Mohd Maruf on 05/05/21.
//

import SwiftUI

struct HomeView: View {

  var userData:User
  @State private var showMenu = false
  @EnvironmentObject var menuViewModel:MenuViewModel

  var body: some View {

    let drag = DragGesture()
      .onEnded {
        if $0.translation.width < -100 {
          withAnimation {
            self.showMenu = false
          }
        }
      }

    return NavigationView {
      GeometryReader { (geometry) in
        ZStack(alignment: .leading, content: {
          MainView(menuViewModel: _menuViewModel)
            .frame(width: geometry.size.width, height: geometry.size.height)
            .offset(x: self.showMenu ? geometry.size.width/2 : 0)
          .disabled(self.showMenu ? true : false)

          if showMenu {
            MenuView(userData: userData, showMenu:$showMenu, menuViewModel: _menuViewModel)
              .frame(width: geometry.size.width/2).padding(.top,1)
              .transition(.move(edge: .leading))
          }
          if menuViewModel.showLoader {
            VStack {
              ProgressView().frame(width: 80, height: 80).background(RoundedRectangle(cornerRadius: 10.0).foregroundColor(Color(menuViewModel.categorySelected.color())))
                .progressViewStyle(CircularProgressViewStyle())
            }.frame(width: geometry.size.width, height: geometry.size.height)
          }
        }).gesture(drag)

      }
      .navigationBarTitle(menuViewModel.categorySelected.rawValue,displayMode: .inline)
      .background(NavigationConfigurator { nc in
        nc.navigationBar.barTintColor = menuViewModel.categorySelected.color()
        nc.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.white]
      })
      .navigationBarItems(leading: (
        Button(action: {
          withAnimation {
            self.showMenu.toggle()
          }
        }) {
          Image(systemName: "line.horizontal.3")
            .imageScale(.large)
            .foregroundColor(.black)
        }
      ))
    }
  }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
      HomeView(userData: User(id: "ackjbaskcbaksjcnaksc", name: "Aman", country: "USA"))
    }
}

