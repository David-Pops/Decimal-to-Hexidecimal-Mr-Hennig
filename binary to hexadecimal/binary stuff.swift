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
    
    var body: some View {
        VStack{
            //TextField("binary number", text: $binaryNumber)
            
            TextField(text: $binaryNumber, prompt: Text("Required")) {
                
            }
            Text(\( Int(binaryNumber) ?? 0))
        }
    }
}


struct binary_stuff_Previews: PreviewProvider {
    static var previews: some View {
        binary_stuff().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}




