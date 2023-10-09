//
//  ReservationView.swift
//  LittleLemon
//
//  Created by Mauricio Paternina on 25/09/23.
//

import SwiftUI
import Combine

struct ReservationView: View {
    @State private var reservation = Reservation(
        id: UUID(),
        reservee: Reservee(name: "", email: "", phoneNumber: ""),
        numberOfCustomers: 2,
        date: Date(),
        time: Date(),
        location: "Cole Valley",
        needsChildSeat: false,
        notes: "",
        status: .Pending
    )
    @State private var showReservartionConfirmation = false
    
    // Controls whether the Additional Notes section should be collapsed or expanded.
    @State var isAdditionalNotesCollapsed = true
    
    @State private var isValidName = true
    @State private var isValidEmail = true
    @State private var isValidPhoneNumber = true
    
    private enum InvalidFormErrorMessage: String {
        case FullName = "Please enter your full name."
        case Email = "Please enter a valid email."
        case PhoneNumber = "Please enter a valid phone number."
    }
    
    let locations = Data.littleLemonData.getLocationNames().sorted()
    
    /// Returns a fixed, closed date range from today to one year from today, which represents the date window within customers can place reservations.
    private let reservationDateWindow: ClosedRange<Date> = {
        let calendar = Calendar.current
        let today = Date()
        let oneYearFromToday = calendar.date(byAdding: .year, value: 1, to: today)!
        
        return today...oneYearFromToday
    }()
    
    /// Returns a fixed, closed date range from 11:00AM to 11:00PM, which represents the time window within customers can place reservations.
    private let reservationTimeWindow: ClosedRange<Date> = {
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
                            VStack(alignment: .leading, spacing: 0) {
                                TextField("Name", text: $reservation.reservee.name)
                                    .padding(.top, 12)
                                ErrorMessageTextField(errorMessage: InvalidFormErrorMessage.FullName.rawValue, hideErrorMessage: $isValidName)
                                    .padding(.top, isValidName ? -8 : 0)
                            }
                            VStack(alignment: .leading, spacing: 0) {
                                TextField("Email", text: $reservation.reservee.email)
                                    .keyboardType(.emailAddress)
                                    .textInputAutocapitalization(.never)
                                    .padding(.top, 12)
                                ErrorMessageTextField(errorMessage: InvalidFormErrorMessage.Email.rawValue, hideErrorMessage: $isValidEmail)
                                    .padding(.top, isValidEmail ? -8 : 0)
                            }
                            VStack(alignment: .leading, spacing: 0) {
                                TextField("Phone Number", text: $reservation.reservee.phoneNumber)
                                    .padding(.top, 12)
                                    .keyboardType(.phonePad)
                                    // Limit the input to ten characters
                                    .onChange(
                                        of: reservation.reservee.phoneNumber,
                                        perform: { newValue in
                                            reservation.reservee.phoneNumber = String(newValue.prefix(10))
                                        }
                                    )
                                ErrorMessageTextField(errorMessage: InvalidFormErrorMessage.PhoneNumber.rawValue, hideErrorMessage: $isValidPhoneNumber)
                                    .padding(.top, isValidPhoneNumber ? -8 : 0)
                            }
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
                                selection: $reservation.time,
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
                        
                        Section {
                            Button(action: processReservation) {
                                Text("CONTINUE")
                                    .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 32)
                                    .font(.custom("Phudu-SemiBold", size: 20))
                            }
                            .buttonStyle(.borderedProminent)
                            .disabled(isFormFilledOut())
                            .sheet(isPresented: $showReservartionConfirmation) {
                                ReservationConfirmationView(reservation: reservation)
                            }
                        }
                        .listRowInsets(EdgeInsets())
                        
                    }
                    .font(.custom("MierB-Regular", size: 18))
                }
                .padding(.top, 10)
            }
        }
    }
    
    // For the sake of simplicity, I'm considering the form to be filled out when the user provides
    // a name, email, and phone number, thus enabling the CONTINUE button.
    // TODO: Validate whether the user selected a time different than the current one.
    private func isFormFilledOut() -> Bool {
        reservation.reservee.name.isEmpty ||
        reservation.reservee.email.isEmpty ||
        reservation.reservee.phoneNumber.count != 10
    }
    
    // For simplicity reasons, I'm limiting form validation to the name, email, and phone number
    // input fields.
    private func isValidForm() -> Bool {
        isValidName = LittleLemon.isValidFullName(reservation.reservee.name)
        isValidEmail = LittleLemon.isValidEmail(reservation.reservee.email)
        isValidPhoneNumber = LittleLemon.isValidPhoneNumber(reservation.reservee.phoneNumber)
        
        return isValidName && isValidEmail && isValidPhoneNumber
    }
    
    private func processReservation() {
        let isValidForm = isValidForm()
        
        if isValidForm {
            reservation.status = .Reserved
            
            showReservartionConfirmation = true
        }
    }

}

struct Reservation {
    let id: UUID
    var reservee: Reservee
    var numberOfCustomers: Int
    var date: Date
    var time: Date
    var location: String
    var needsChildSeat: Bool
    var notes: String
    var status: ReservationStatus
}

struct Reservee {
    var name: String
    var email: String
    var phoneNumber: String
}

enum ReservationStatus {
    case Cancelled, Fulfilled, Pending, Reserved
}

private struct ErrorMessageTextField: View {
    @State var errorMessage: String
    @Binding var hideErrorMessage: Bool
    
    var body: some View {
        !hideErrorMessage ?
            Text(errorMessage)
                .font(.custom("MierB-Regular", size: 16))
                .foregroundColor(.red) :
            Text("")
                .font(.custom("MierB-Regular", size: 1))
    }
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
        .font(.caption)
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

