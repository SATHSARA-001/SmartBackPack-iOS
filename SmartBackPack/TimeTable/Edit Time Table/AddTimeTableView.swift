//
//  AddTimeTableView.swift
//  SmartBackPack
//
//  Created by Sathsara Maduranga on 29/3/2022.
//

import SwiftUI

struct AddTimeTableView: View {
    var body: some View {
        ZStack {
            //colorBackground
            VStack {
                
                GeometryReader { geometry in
                    
                    ScrollView(.vertical , showsIndicators: false) {
                        
                        VStack(alignment: .center, spacing: 20) {
                             
                            Spacer()
                            
                            Text("Books in the list")
                                .foregroundColor(Color.gray)
                                .font(.largeTitle)
                            
                            
                            Text("Books not in the list")
                                .foregroundColor(Color.gray)
                                .font(.largeTitle)
                            
                            Spacer()
                            
                            
                        }
                        .frame(minHeight: geometry.size.height)
                    }
                    .frame(width: geometry.size.width)
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
        .navigationBarHidden(true)
    }
}

struct AddTimeTableView_Previews: PreviewProvider {
    static var previews: some View {
        AddTimeTableView()
    }
}
