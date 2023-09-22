//
//  binary stuff.swift
//  binary to hexadecimal
//
//  Created by David Popowski on 9/18/23.
//

import SwiftUI
import CoreData

struct binary_stuff: View {
    
    @State private var binaryNumber:String = ""
    @State private var baseNumber:String = ""
    
    var body: some View {
        VStack{
            TextField(text: $binaryNumber, prompt: Text("input decimal number")) {
            }
            .padding()
            //TextField(text: $baseNumber, prompt: Text("input base"))
            .padding()
            
            Text("Hexadecimal: \(unArrayify(number: getDigits_in_number(number: Int(binaryNumber) ?? 0, base: 16)))")
            Text("Binary: \(unArrayify(number: getDigits_in_number(number: Int(binaryNumber) ?? 0, base: 2)))")
            //Text("Decimal: \(unArrayify(number: getDigits_in_number(number: Int(binaryNumber) ?? 0, base: 10)))")
            //Text("\(binary_to_decimals(number: Int(binaryNumber) ?? 0))")
        }
        VStack{
            
            
            
            
        }
    }
}

public func unArrayify(number: [Int]) -> String{
    var outputInt: String = ""
    for i in number{
        outputInt += base16ification(number: i)
    }
    return "\(outputInt)"
}


public func getDigits_in_number(number: Int, base: Int) -> [Int]{
    var editableNumber = number
    var arrayInt = [Int]()
    arrayInt.append(editableNumber%base)
    
    while editableNumber >= base {
        editableNumber = editableNumber/base
        arrayInt.insert(editableNumber%base, at: 0)
    }

    return arrayInt
}

public func base16ification(number: Int) -> String{
    if number == 10{
        return "a"
    }
    else if number == 11{
        return "b"
    }
    else if number == 12{
        return "c"
    }
    else if number == 13{
        return "d"
    }
    else if number == 14{
        return "e"
    }
    else if number == 15{
        return "f"
    }
    else{
        return "\(number)"
    }
}

func binary_to_decimals(number: Int) -> Double{
    var a = number % Int(pow(2, log2(Double(number)) + 1))
    var b = Double(a) / pow(2, log2(Double(number)))
    
    return b
}

func betterLog(number: Int, base: Int) -> Double {
    return log(Double(number))/log(Double(base))
}


struct binary_stuff_Previews: PreviewProvider {
    static var previews: some View {
        binary_stuff().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}




