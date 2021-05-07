//
//  MenuView.swift
//  NewFeed
//
//  Created by Mohd Maruf on 05/05/21.
//

import SwiftUI

enum Category:String,CaseIterable {
  case bussiness      = "Bussiness"
  case entertainment  = "Entertainment"
  case general        = "General"
  case health         = "Health"
  case sports         = "Sports"
  case technology     = "Technology"

  func endpoints() -> String {
    switch self {
    case .bussiness:
      return EndPoints.bussiness
    case .entertainment:
      return EndPoints.entertainment
    case .general:
      return EndPoints.general
    case .health:
      return EndPoints.health
    case .sports:
      return EndPoints.sports
    case .technology:
      return EndPoints.technology
    }
  }

  func color() -> UIColor {
    switch self {
    case .bussiness:
      return UIColor.red.withAlphaComponent(0.2)
    case .entertainment:
      return UIColor.brown.withAlphaComponent(0.2)
    case .general:
      return UIColor.systemPink.withAlphaComponent(0.2)
    case .health:
      return UIColor.blue.withAlphaComponent(0.2)
    case .sports:
      return UIColor.orange.withAlphaComponent(0.2)
    case .technology:
      return UIColor.purple.withAlphaComponent(0.2)
    }
  }

}

struct MenuView: View {

  var userData:User
  @Binding var showMenu:Bool
  @EnvironmentObject var menuViewModel:MenuViewModel

  var body: some View {
    VStack(alignment: .leading) {
      HStack {
        Text(userData.name)
          .foregroundColor(.yellow)
          .font(.headline)
      }
      .padding(.top, 10)

      Text("Categories").foregroundColor(.white).font(.title3)
        .padding(.top, 20)

      Button(action: {
        withAnimation {
          self.menuViewModel.categorySelected = .general
          self.showMenu = false
          self.menuViewModel.loadData()
        }
      }, label: {
        Text(Category.general.rawValue).foregroundColor(menuViewModel.categorySelected == .general ? .blue : .gray).font(.headline)
      })
      .padding(.top, 20)

      Button(action: { withAnimation {
        self.menuViewModel.categorySelected = .bussiness
        self.showMenu = false
        self.menuViewModel.loadData()
      }
      }, label: {
        Text(Category.bussiness.rawValue).foregroundColor(menuViewModel.categorySelected == .bussiness ? .blue : .gray).font(.headline)
      })
      .padding(.top, 20)

      Button(action: {withAnimation {
        self.menuViewModel.categorySelected = .entertainment
        self.showMenu = false
        self.menuViewModel.loadData()
      }
      }, label: {
        Text(Category.entertainment.rawValue).foregroundColor(menuViewModel.categorySelected == .entertainment ? .blue : .gray).font(.headline)
      })
      .padding(.top, 20)

      Button(action: { withAnimation {
        self.menuViewModel.categorySelected = .health
        self.showMenu = false
        self.menuViewModel.loadData()
      }
      }, label: {
        Text(Category.health.rawValue).foregroundColor(menuViewModel.categorySelected == .health ? .blue : .gray).font(.headline)
      })
      .padding(.top, 20)

      Button(action: { withAnimation {
        self.menuViewModel.categorySelected = .sports
        self.showMenu = false
        self.menuViewModel.loadData()
      }
      }, label: {
        Text(Category.sports.rawValue).foregroundColor(menuViewModel.categorySelected == .sports ? .blue : .gray).font(.headline)
      })
      .padding(.top, 20)

      Button(action: { withAnimation {
        self.menuViewModel.categorySelected = .technology
        self.showMenu = false
        self.menuViewModel.loadData()
      }
      }, label: {
        Text(Category.technology.rawValue).foregroundColor(menuViewModel.categorySelected == .technology ? .blue : .gray).font(.headline)
      })
      .padding(.top, 20)

      Spacer()

    }.padding(.leading,2)
    .frame(maxWidth:.infinity, alignment: .leading)
    .background(Color(red: 32/255, green: 32/255, blue: 32/255))
    .edgesIgnoringSafeArea(.all)
  }
}

//struct MenuView_Previews: PreviewProvider {
//    static var previews: some View {
//      MenuView(userData: User(id: "ackjbaskcbaksjcnaksc", name: "Aman", country: "USA"))
//    }
//}
