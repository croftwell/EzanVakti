//
//  TabBar.swift
//  EzanVakti
//
//  Created by Ali on 1.05.2024.
//

import SwiftUI

struct TabBar: View {
    @State private var selectedTab = 0

       var body: some View {
           TabView(selection: $selectedTab) {
               // Tab 1
               EzanVaktiHome()
                   .tabItem {
                       Image(systemName: "clock.badge.fill")
                       Text("Ezan Vakti")
                   }
                   .tag(0)

               // Tab 2
               Text("Tab 2")
                   .tabItem {
                       Image(systemName: "magnifyingglass")
                       Text("Dinle")
                   }
                   .tag(1)

               // Tab 3
               Text("Tab 3")
                   .tabItem {
                       Image(systemName: "person")
                       Text("Profil")
                   }
                   .tag(2)
               // Tab 2
               Text("Tab 2")
                   .tabItem {
                       Image(systemName: "magnifyingglass")
                       Text("noömt")
                   }
                   .tag(4)
           }
           
           .accentColor(Color("color"))
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
