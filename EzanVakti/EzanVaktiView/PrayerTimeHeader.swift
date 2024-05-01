//
//  PrayerTimeHeader.swift
//  EzanVakti
//
//  Created by Ali on 1.05.2024.
//

import SwiftUI

struct PrayerTimeHeader: View {
    
    let prayerName: String
    let prayerTime: Date
    let location: String
    let currentDate = Date()
    let gregorianCalendar = Calendar(identifier: .gregorian)
    let hijriCalender = Calendar(identifier: .islamicUmmAlQura)
    
    var body: some View {
        VStack(alignment: .center, spacing: 20){
            VStack(spacing: 20){
                VStack{
                    HStack{
                        Text("Hayırlı")
                            .font(.title2)
                            .fontWeight(.bold)
                        Text("Günler")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(Color("color"))
                    }
                    .padding()
                    
                    Text("\(prayerName) Kalan vakit")
                        .font(.system(size: 15))
                        .fontWeight(.bold)
                        .foregroundColor(Color("ColorIcon"))
                }
                .padding(.horizontal)
                
                VStack {
                    Text("\(prayerTime, style: .timer)")
                        .font(.system(size: 64))
                        .fontWeight(.semibold)
                }
                HStack{
                 Text("\(getFormattedDate(date: currentDate, calendar: gregorianCalendar))")
                        .font(.system(size: 15))
                        .fontWeight(.bold)
                        .foregroundColor(Color("ColorIcon"))
                }
                .padding(.bottom)
                .padding(.horizontal)
            }
            .padding(.top)
            HStack{
                Text("\(location)")
                    .bold()
                
                Image(systemName: "location.circle.fill")
                    .foregroundColor(Color("color"))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                Text("Bugün")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
        .padding()
    }
    
    func getFormattedDate(date: Date, calendar: Calendar) -> String {
        let components = calendar.dateComponents([.year, .month, .day], from: date)
            let dateFormatter = DateFormatter()
        dateFormatter.calendar = calendar
        dateFormatter.dateFormat = "dd MMMM yyyy"
        let formatteDate = dateFormatter.string(from: calendar.date(from: components) ?? date)
        return formatteDate
    }
}
