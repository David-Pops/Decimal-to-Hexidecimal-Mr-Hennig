//
//  ContentView.swift
//  binary to hexadecimal
//
//  Created by David Popowski on 9/18/23.
//

import SwiftUI
import CoreData
extension String {
    var hexadecimalRepresentation: String {
        let decimal = Int(self)
        return String(format: "%X", decimal ?? 0)
    }
}

struct ContentView: View {
    @State private var numero: String = "1"
    @State private var decimalNumber: Double = 0.0
    
    var hexadecimalString: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 0
        formatter.locale = Locale.current
        formatter.maximumIntegerDigits = 20 

        if let decimalNumber = Decimal(string: "\(self.decimalNumber)") {
            return formatter.string(from: decimalNumber as NSDecimalNumber)?.hexadecimalRepresentation ?? ""
        } else {
            return ""
        }
    }


    var body: some View {
        VStack() {
            TextField("Enter Decimal Number", value: $decimalNumber, formatter: NumberFormatter())
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()

                        Text("Hexadecimal: \(hexadecimalString)")
                            .padding()
               
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
