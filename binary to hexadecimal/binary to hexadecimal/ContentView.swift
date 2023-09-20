//
//  ContentView.swift
//  binary to hexadecimal
//
//  Created by David Popowski on 9/18/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @State private var numero: String = "0000"

    var body: some View {
        VStack() {
            TextField("enter number", text: $numero)
           
            if numero == "000" {
               
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
