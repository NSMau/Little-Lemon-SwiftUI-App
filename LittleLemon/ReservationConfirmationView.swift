//
//  ReservationConfirmationView.swift
//  LittleLemon
//
//  Created by Mauricio Paternina on 9/10/23.
//

import SwiftUI

struct ReservationConfirmationView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.currentTab) var tab
    
    let reservation: Reservation
    
    var body: some View {
        ZStack {
            Color("Porcelain")
                .edgesIgnoringSafeArea(.all)
            VStack(alignment: .center) {
                Text("Your table awaits!")
                    .font(.custom("Phudu-SemiBold", size: 32))
                    .padding(.bottom, 20)
                Text("You're in. We have reserved a table at Little Lemon \(reservation.location) for \(reservation.date.formatted())")
                    .font(.custom("MierB-Regular", size: 20))
                    .lineSpacing(8)
                    .padding(.bottom, 10)
                Text("We've emailed all the details of the reservation to \(reservation.reservee.email). Take a look at those and follow the instructions outlined there.")
                    .font(.custom("MierB-Regular", size: 20))
                    .lineSpacing(8)
                    .padding(.bottom, 40)
                Button("OK") {
                    tab.wrappedValue = .home
                    dismiss()
                }
                .frame(width: 192, height: 48)
                .background(Color("DeepSeaGreen"))
                .foregroundColor(Color("Porcelain"))
                .padding()
            }
            .multilineTextAlignment(.center)
            .padding(.leading, 32)
            .padding(.trailing, 32)
        }
    }
}

struct ReservationConfirmationView_Previews: PreviewProvider {
    static var previews: some View {
        ReservationConfirmationView(
            reservation: Reservation(
                id: UUID(),
                reservee: Reservee(
                    name: "Mauricio Paternina",
                    email: "nsmau@apple.com",
                    phoneNumber: "3004001010"
                ),
                numberOfCustomers: 2,
                date: Date(),
                time: Date(),
                location: "Location",
                needsChildSeat: false,
                notes: "",
                status: .Reserved
            )
        )
    }
}
