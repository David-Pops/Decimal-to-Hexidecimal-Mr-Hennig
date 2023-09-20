//
//  binary stuff.swift
//  binary to hexadecimal
//
//  Created by David Popowski on 9/18/23.
//

import SwiftUI
import CoreData

struct binary_stuff: View {
    
    @State private var binaryNumber:String = "1"
    
    
    var body: some View {
        VStack{
            //TextField("binary number", text: $binaryNumber)
            
            TextField(text: $binaryNumber, prompt: Text("Required")) {
            }
            
            ForEach(getDigits_in_number(number: Int(binaryNumber) ?? 0, base: 16), id: \.self){ i in
                Text("\(i)")
                
                
                
            }
            //Text("\($0)")
        }
    }
}



func unArrayify(number: [Int]){
    var betterArray = number.reversed()
    for i in betterArray{
        
        
    }
}

func binary_to_decimal(numberInDigits: [Int]) -> [Int]{
    var newNumber: [Int] = [43]
    for i in numberInDigits{
        print(i)
        
    }
    return newNumber
}

func getDigits_in_number(number: Int, base: Int) -> [Int]{
    var editableNumber = number
    var arrayInt = [Int]()
    arrayInt.append(editableNumber%base)
    
    while editableNumber >= base {
        editableNumber = editableNumber/base
        arrayInt.insert(editableNumber%base, at: 0)
    }
    
    return arrayInt
}

struct binary_stuff_Previews: PreviewProvider {
    static var previews: some View {
        binary_stuff().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}







