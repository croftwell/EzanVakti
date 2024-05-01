//
//  EzanVaktiView.swift
//  EzanVakti
//
//  Created by Ali on 1.05.2024.
//

import SwiftUI

struct EzanVaktiView: View {
    
    @ObservedObject var prayerClass: PrayerTimesClass
    @State private var isPresented = false
    @State private var isShowSettings = false
    
    var body: some View {
        NavigationView{
            ZStack{
                Color("bg")
                    .ignoresSafeArea()
                ScrollView{
                    if let error = prayerClass.error {
                        VStack{}
                        .onAppear{
                            isPresented = true
                        }
                    } else {
                        if let prayers = prayerClass.prayers {
                            if let nextPrayer = prayers.nextPrayer(){
                                PrayerTimeHeader(prayerName: "\(nextPrayer)", prayerTime: prayers.time(for: nextPrayer), location: prayerClass.city ?? "__")
                                    .frame(maxWidth: .infinity, alignment: .center)
                            } else {
                                        PrayerTimeHeader(prayerName: "Imsak", prayerTime: Date(), location: prayerClass.city ?? "__")
                                            .frame(maxWidth: .infinity, alignment: .center)
                                    }
                                    AthanTimeTable(prayerClass: prayerClass)
                                        .listRowSeparator(.hidden)
                                        .onAppear {
                                            isPresented = false
                                        }
                                }
                            }
                        }
                .navigationTitle("Ezan Vakti")
                
                .fullScreenCover(isPresented: $isPresented, content: { LocationNotFoundView() })
                
                .onAppear{
                    prayerClass.startUpdatingLocation()
                }
                .onDisappear{
                    prayerClass.stopUpdatingLocation()
                      }
                   }
        
               }
      
            }
          
        }

struct EzanVaktiView_Previews: PreviewProvider {
    static var previews: some View {
        EzanVaktiView(prayerClass: PrayerTimesClass())
            .preferredColorScheme(.dark)
            
    }
}
