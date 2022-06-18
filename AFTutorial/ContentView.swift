//
//  ContentView.swift
//  AFTutorial
//
//  Created by Çağatay Yıldız on 18.06.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
           CategoryList()
        }
      
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
