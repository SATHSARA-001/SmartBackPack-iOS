//
//  ViewBooksVC.swift
//  SmartBackPack
//
//  Created by Sathsara Maduranga on 30/3/2022.
//

import SwiftUI

struct ViewBooksVC: View {
    @StateObject var vm = ViewBooksVM()
    
    var body: some View {
        
        NavigationView{
            List{
                ForEach(vm.bookList,id:\.name){subjectItem in
                    Text(subjectItem.name ?? "")
                }
                .onDelete(perform:self.deleteItem(at:) )
                
                
            }
        }
        .onAppear(perform: vm.fetchOrders)
        
          
        
    }
    
    private func deleteItem(at indexSet: IndexSet){
                vm.bookList.remove(atOffsets: indexSet)
        
            }
    
    
}

struct ViewBooksVC_Previews: PreviewProvider {
    static var previews: some View {
        ViewBooksVC()
    }
}



