//
//  ContentView.swift
//  Onde tem Comida
//
//  Created by Gabriel De Andrade Cordeiro on 19/07/21.
//

import SwiftUI

struct ContentView: View {
    @State var results = [PlacesAPIResult]()
       
       var body: some View {
           List(results) { result in
               
               VStack(alignment: .leading) {
                   
                Text("\(result.name ?? "")")
                       .font(.title)
                       .foregroundColor(.red)
                       .padding(.bottom)
                   
                   
                   VStack(alignment: .leading, spacing: 16, content: {
                       Text("\(result.vicinity ?? "")")
                           .font(.body)
                           .fontWeight(.bold)
                    
                       let number: Double = result.rating ?? 0
                       Text("\(String(number.rounded(toPlaces: 1)))/5")
                           .font(.body)
                           .fontWeight(.semibold)
                   })
                   Spacer()
               }
               
           }
               .onAppear() {
                PlacesViewModel().getAvailablePlaces { (results) in
                       self.results = results
                   }
               }.navigationBarTitle("Nearby Places to eat")
       }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
