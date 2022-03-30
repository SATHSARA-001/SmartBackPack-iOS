//
//  AddTimeTableView.swift
//  SmartBackPack
//
//  Created by Sathsara Maduranga on 29/3/2022.
//

import SwiftUI

struct AddTimeTableView: View {
    @State  var slotNo:String?
    @StateObject var vm = AddTimeTableVM()

    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>


    var body: some View {
        ZStack {
            //colorBackground
            VStack {
                CustomHeader()
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
        .onAppear(perform: {
            print(slotNo)
            vm.getAvailablebooks(day: slotNo ?? "")
            vm.getAllBooks()
        })
        .edgesIgnoringSafeArea(.all)
        .navigationBarHidden(true)
    }
}

struct AddTimeTableView_Previews: PreviewProvider {
    static var previews: some View {
        AddTimeTableView()
    }
}
