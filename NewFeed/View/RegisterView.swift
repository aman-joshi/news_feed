//
//  RegisterView.swift
//  NewFeed
//
//  Created by Mohd Maruf on 05/05/21.
//

import SwiftUI

struct RegisterView: View {

  @ObservedObject var registerVM = RegisterVM()
  @State private var name:String = ""
  @State private var country:String?
  @State private var showPicker = false
  @State private var selectedCountry = 0
  

  var body: some View {
    if registerVM.isRegistered {
      HomeView(userData: registerVM.user).environmentObject(MenuViewModel())
    }else{
      VStack {
        HStack {
          Marque(text: "Daily News").frame(height:50)
        }.padding(.top,UIScreen.main.bounds.height * 0.1)
        Spacer()
        VStack{
          TextField("Full Name", text: $name).textFieldStyle(RoundedBorderTextFieldStyle())

          CountryPickerView(data: CountryList.allCases, placeholder: "Select Country", selectionIndex: $selectedCountry, text: $country).frame(height:40)
        }.padding()

        Button(action: {
          registerVM.registerUser(by: name, country: CountryList.allCases[selectedCountry] )
        }, label: {
          Text("Register").foregroundColor(.black).font(.title).padding(10)
        }).frame(width:UIScreen.main.bounds.width * 0.6)
        .background(Color(UIColor.lightGray))
        .cornerRadius(10.0)

        Spacer()
      }.frame(width:UIScreen.main.bounds.width)
      .background(Color(UIColor.black.withAlphaComponent(0.7)))
      .edgesIgnoringSafeArea(.vertical)
    }
  }

  func userSet() {

  }

}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
