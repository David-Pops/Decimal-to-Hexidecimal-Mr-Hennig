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
    
    var binaryToHexadecimal: String {
        if let decimal = Int(self, radix: 2) {
            return String(format: "%X", decimal)
        } else {
            return ""
        }
    }
    
    var hexadecimalToBinary: String {
        if let decimal = Int(self, radix: 16) {
            return String(decimal, radix: 2)
        } else {
            return ""
        }
    }
}

struct ContentView: View {
    @State private var decimalNumber: Double = 0.0
    @State private var binaryNumber: String = ""
    @State private var hexadecimalNumber: String = ""

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
            
            TextField("Enter Binary Number", text: $binaryNumber)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TextField("Enter Hexadecimal Number", text: $hexadecimalNumber)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Text("Decimal to Hexadecimal: \(hexadecimalString)")
                .padding()
            
            Text("Binary to Hexadecimal: \(binaryNumber.binaryToHexadecimal)")
                .padding()
            
            Text("Hexadecimal to Binary: \(hexadecimalNumber.hexadecimalToBinary)")
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
