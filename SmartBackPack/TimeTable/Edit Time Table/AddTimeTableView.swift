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
                        
                        VStack(alignment: .leading, spacing: 20) {
                            
                            
                            
                            Text("Books in the list")
                                .foregroundColor(Color.gray)
                                .font(.largeTitle)
                            
                            VStack(alignment:.leading ){
                                
                                ForEach (vm.availableBookList,id:\.name){ bookItem in
                                    
                                    CustomListCard(imageString: "remove", textString: bookItem.name)
                                        .onTapGesture(perform: {
                                            print(bookItem.name)
                                            vm.removeBookFromTimeTable(subjectName: bookItem.name ?? "", day: slotNo ?? "") { status in
                                                print(status)
                                            }
                                        })
                                }
                            }
                            
                            .padding(.leading,5)
                            
                            
                            Text("Books not in the list")
                                .foregroundColor(Color.gray)
                                .font(.largeTitle)
                            
                            VStack(alignment:.leading ){
                                
                                ForEach (vm.listOfAllBooks,id:\.name){ bookItem in
                                    
                                    CustomListCard(imageString: "add", textString: bookItem.name)
                                        .onTapGesture(perform: {
                                            print(bookItem.name)
                                            vm.addBookToTimeTable(subject: bookItem, day: slotNo ?? "") { status in
                                                print(status)
                                            }
                                        })
                                }
                            }
                            .padding(.leading,5)
                            
                            Spacer()
                            
                            
                        }
                        .padding()
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
