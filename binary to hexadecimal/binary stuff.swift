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
    @State private var decimalNumber: String = ""
    @State private var hexaNumber: String = ""
    
    var body: some View {
        VStack{
            TextField(text: $binaryNumber, prompt: Text("input decimal number")) {
            }
            .padding()
            //TextField(text: $baseNumber, prompt: Text("input base"))
            Text("Hexadecimal: \(unArrayify(number: getDigits_in_number(number: Int(binaryNumber) ?? 0, base: 16)))")
            Text("Binary: \(unArrayify(number: getDigits_in_number(number: Int(binaryNumber) ?? 0, base: 2)))")
            //Text("decimal: \(binary_to_base(number: getDigits_in_number(number: Int(binaryNumber) ?? 0, base: 2), base: 2))")
            
            
        
            TextField(text: $decimalNumber, prompt: Text("binary number please")){
            }
            .padding()
            Text("decimal: \(binary_to_decimal(number: getDigits_in_number(number: Int(decimalNumber) ?? 0, base: 10)))")
            var wer = binary_to_decimal(number: getDigits_in_number(number: Int(decimalNumber) ?? 0, base: 10))
            Text("hexadecimal: \(unArrayify(number: getDigits_in_number(number: Int(wer) ?? 0, base: 16)))")
            
            
            
            //TextField(text: $hexaNumber, prompt: Text("hexadecimal number please")){
            //}
            //.padding()
            //Text("decimal: \(hexa_to_binary(number: digitification(number: hexaNumber)))")
            
            
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

func digitification(number:String) -> [String]{
    var numberArray: [String] = ["0"]
    var repeater = 0
    for i in 0...number.count{
        numberArray[repeater] = String(number.prefix(i))
        
        repeater += 1
    }
    return numberArray
}

func hexa_to_binary(number: [String]) -> Int{
    var total = 0
    for i in number{
        var mut_i = reversebase16ification(number: i)
        total += Int(mut_i) ?? 0
        
    }
    return total
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

public func binary_to_decimal(number: [Int]) -> String{
    var repeater = 0
    var total = 0
    var betterArray = number.reversed()
    for i in betterArray{
        total += i * Int(pow(Double(2), Double(repeater)))
        
        repeater += 1
    }
    return String(total)
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

func reversebase16ification(number: String) -> String{
    if number == "a"{
        return "10"
    }
    else if number == "b"{
        return "11"
    }
    else if number == "c"{
        return "12"
    }
    else if number == "d"{
        return "13"
    }
    else if number == "e"{
        return "14"
    }
    else if number == "f"{
        return "15"
    }
    else{
        return "\(number)"
    }
    
    
    
    
    
    
    
}


func betterLog(number: Int, base: Int) -> Double {
    return log(Double(number))/log(Double(base))
}


struct binary_stuff_Previews: PreviewProvider {
    static var previews: some View {
        binary_stuff().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}




