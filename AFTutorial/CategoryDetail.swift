//
//  CategoryDetail.swift
//  AFTutorial
//
//  Created by Çağatay Yıldız on 18.06.2022.
//

import SwiftUI
import Alamofire

struct CategoryDetail: View {
    
    var id : Int
    
    @State var category : CategoryModel = CategoryModel()
    
    
    
    
    var body: some View {
        VStack{
            
            Text("Id: \(category.id)")
                .padding()
            
            Text("Name: \(category.name)")
                .padding()
            
            Text("Description: \(category.description)")
                .padding()
            
        }
        .onAppear(){
            
            let request = AF.request("https://northwind.vercel.app/api/categories/\(id)")
            
            request.responseDecodable(of: CategoryModel.self){response in
                
                category = response.value ?? CategoryModel()
                
            }
            
        }
    }
}
