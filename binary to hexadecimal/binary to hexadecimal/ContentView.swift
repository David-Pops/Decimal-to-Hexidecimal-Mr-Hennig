//
//  ContentView.swift
//  binary to hexadecimal
//
//  Created by David Popowski on 9/18/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    var body: some View {
        Text("ER")
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
