//
//  ReservationView.swift
//  LittleLemon
//
//  Created by Mauricio Paternina on 25/09/23.
//

import SwiftUI

struct ReservationView: View {
    @State private var reservation = Reservation(
        id: UUID(),
        reservee: Reservee(name: "", email: "", phoneNumber: ""),
        numberOfCustomers: 2,
        date: Date(),
        time: Date(),
        location: "Downtown",
        needsChildSeat: false,
        notes: "",
        status: .Pending
    )
    
    // Controls whether the Additional Notes section should be collapsed or expanded.
    @State var isAdditionalNotesCollapsed = true
    
    let locations = Data.littleLemonData.getLocationNames().sorted()
    
    /// Returns a fixed, closed date range from today to one year from today, which represents the date window within customers can place reservations.
    let reservationDateWindow: ClosedRange<Date> = {
        let calendar = Calendar.current
        let today = Date()
        let oneYearFromToday = calendar.date(byAdding: .year, value: 1, to: today)!
        
        return today...oneYearFromToday
    }()
    
    /// Returns a fixed, closed date range from 11:00AM to 11:00PM, which represents the time window within customers can place reservations.
    let reservationTimeWindow: ClosedRange<Date> = {
        let calendar = Calendar.current
        let today = Date()
        
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "HH:mm"
        
        let openingHours = timeFormatter.date(from: "11:00")!
        let closingHours = timeFormatter.date(from: "23:00")!
        
        // Combine the current date with opening/closing hours
        let startDate = calendar.date(
            bySettingHour: calendar.component(.hour, from: openingHours),
            minute: calendar.component(.minute, from: openingHours),
            second: 0,
            of: today
        )!
        
        let endDate = calendar.date(
            bySettingHour: calendar.component(.hour, from: closingHours),
            minute: calendar.component(.minute, from: closingHours),
            second: 0,
            of: today
        )!
        
        return startDate...endDate
    }()
    
    var body: some View {
        VStack(spacing: 0) {
            ScreenHeadingView(heading: "book a table", subheading: "Reserve a table at your favorite Little Lemon location.")
            ZStack {
                Color("Porcelain")
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Form {
                        Section {
                            TextField("Name", text: $reservation.reservee.name)
                            TextField("Email", text: $reservation.reservee.email)
                                .keyboardType(.emailAddress)
                                .textInputAutocapitalization(.never)
                            TextField("Phone Number", text: $reservation.reservee.phoneNumber)
                                .keyboardType(.phonePad)
                                // Limit the input to ten characters
                                .onChange(
                                    of: reservation.reservee.phoneNumber,
                                    perform: { newValue in
                                        reservation.reservee.phoneNumber = String(newValue.prefix(10))
                                    }
                                )
                        } header: {
                            Text("Customer Information")
                                .font(.custom("MierB-Regular", size: 16))
                        }
                        
                        Section {
                            Picker("Location", selection: $reservation.location) {
                                ForEach(locations, id: \.self) {
                                    Text($0)
                                }
                            }
                            
                            DatePicker(
                                "Date",
                                selection: $reservation.date,
                                in: reservationDateWindow,
                                displayedComponents: .date
                            )
                            
                            DatePicker(
                                "Time",
                                selection: $reservation.date,
                                in: reservationTimeWindow,
                                displayedComponents: .hourAndMinute
                            )
                            
                            Stepper(
                                "Number of Customers: \(reservation.numberOfCustomers)",
                                value: $reservation.numberOfCustomers,
                                in: 1...12
                            )
                            
                            Toggle("I Need a Child Seat", isOn: $reservation.needsChildSeat)
                        } header: {
                            Text("Reservation Details")
                                .font(.custom("MierB-Regular", size: 16))
                        }
                        
                        Section(
                            header: CollapsableSectionHeader(
                                title: "Additional Notes",
                                isOn: $isAdditionalNotesCollapsed,
                                iconWhenShown: "chevron.down",
                                iconWhenHidden: "chevron.up"
                            )
                        ) {
                            if !isAdditionalNotesCollapsed {
                                TextEditor(text: $reservation.notes)
                                    .frame(height: 100)
                            }
                        }
                        
                        // TODO: Investigate how to avoid this work-around so the button fills the entire row container without any visible background color
                        Section {
                            Text("")
                        }
                        .listRowBackground(
                            Button(action: processReservation) {
                                Text("CONTINUE")
                                    .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 28)
                                    .font(.custom("Phudu-SemiBold", size: 20))
                            }
                            .buttonStyle(.borderedProminent)
                            .disabled(isFormFilledOut())
                        )
                        .listRowInsets(EdgeInsets()) // Remove Section's horizontal spacing
                    }
                    .font(.custom("MierB-Regular", size: 18))
                }
                .padding(.top, 10)
            }
        }
    }
    
    // For the sake of simplicity, I'm considering the form to be filled out when the user
    // provides a name, email, and phone number, thus enabling the CONTINUE button.
    // TODO: Validate whether the user selected a time different than the current one.
    private func isFormFilledOut() -> Bool {
        reservation.reservee.name.isEmpty ||
        reservation.reservee.email.isEmpty ||
        reservation.reservee.phoneNumber.count != 10
    }
    
    // TODO: Extend form validation for all fields and constraints.
    private func validateForm() -> Bool {
        // For the sake of simplicity, I'm limiting the form validation to
        // the name, email, and phone number fields.
        
        // TODO: User must provide a first and last name
        if !reservation.reservee.name.contains(" ") {
            // TODO: Show alert!
        }
        
        if !reservation.reservee.email.contains("@") {
            // TODO: Show alert!
        }
        
        if (
            reservation.reservee.name.isEmpty ||
            reservation.reservee.email.isEmpty ||
            reservation.reservee.phoneNumber.count != 10
        ) { return false }
        
        return true
    }
    
    private func processReservation() {
        print("Processed")
    }

}

private struct Reservation {
    let id: UUID
    var reservee: Reservee
    var numberOfCustomers: Int
    var date: Date
    var time: Date
    var location: String
    var needsChildSeat: Bool
    var notes: String
    let status: ReservationStatus
}

private struct Reservee {
    var name: String
    var email: String
    var phoneNumber: String
}

private enum ReservationStatus {
    case Cancelled, Fulfilled, Pending, Reserved
}

/// Creates a collapsable header for a section.
private struct CollapsableSectionHeader: View {
    @State var title: String
    @Binding var isOn: Bool
    @State var iconWhenShown: String
    @State var iconWhenHidden: String
    
    var body: some View {
        Button(action: {
            withAnimation {
                isOn.toggle()
            }
        }, label: {
            isOn ? Text(Image(systemName: iconWhenShown)) : Text(Image(systemName: iconWhenHidden))
        })
        .font(Font.caption)
        .foregroundColor(.accentColor)
        .frame(maxWidth: .infinity, alignment: .trailing)
        .overlay(
            Text(title)
                .font(.custom("MierB-Regular", size: 16)),
            alignment: .leading
        )
    }
}

struct ReservationView_Previews: PreviewProvider {
    static var previews: some View {
        ReservationView()
    }
}
