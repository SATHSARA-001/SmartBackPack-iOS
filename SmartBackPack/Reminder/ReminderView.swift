//
//  ReminderView.swift
//  SmartBackPack
//
//  Created by Sathsara Maduranga on 29/3/2022.
//

import SwiftUI

struct ReminderView: View {
    
    @StateObject var vm = ReminderVM()

    
    var body: some View {
        
        ZStack {
            //colorBackground
            VStack {
                
                GeometryReader { geometry in
                    
                    ScrollView(.vertical , showsIndicators: false) {
                        
                        VStack(alignment: .center, spacing: 30) {
                             
                            Spacer()
                            
                            Text("What Time Should You Recieve a Reminder")
                                .foregroundColor(Color.gray)
                                .font(.largeTitle)
                            
                            CustomTextField(placeHolder: "Select the Time", valueText: $vm.qrCode)
                            
                            Button(action: {
                                
                              
                             
                            }){
                                
                                Text("Add")
                                    .foregroundColor(Color.white)
                                    .padding()
                                    .frame(width: 220, height: 48)
                                    .background(colorBackground)
                                    .cornerRadius(24)
                            }

                            
                            Spacer()
                            
                            
                        }
                        .padding()
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

struct ReminderView_Previews: PreviewProvider {
    static var previews: some View {
        ReminderView()
    }
}
