//
//  EzanVaktiHome.swift
//  EzanVakti
//
//  Created by Ali on 1.05.2024.
//


import SwiftUI

struct EzanVaktiHome: View {
    var body: some View {
        EzanVaktiView(prayerClass: PrayerTimesClass())
     
    }
}

struct EzanVaktiHome_Previews: PreviewProvider {
    static var previews: some View {
        EzanVaktiHome()
    }
}
