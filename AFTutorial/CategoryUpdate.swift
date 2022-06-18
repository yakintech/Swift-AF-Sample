//
//  CategoryUpdate.swift
//  AFTutorial
//
//  Created by Çağatay Yıldız on 18.06.2022.
//
//Update edilecek sayfa açıldığında önce web servise gidip data çekilir ve ekradanki textler yazılır

import SwiftUI
import Alamofire

struct CategoryUpdate: View {
    
    var id : Int
    
    @State var category : CategoryModel = CategoryModel()
    
    var body: some View {
        
        VStack{
            TextField("Name",
                      text: $category.name
                      
            )
            
            TextField("Description",
                      text: $category.description
            )
            
            Button("Update"){
                
                let updateCategory: [String: Any] = [
                    
                    "name" : category.name,
                    "description" : category.description
                
                ]
                
                let request = AF.request("https://northwind.vercel.app/api/categories/\(id)", method: .put, parameters: updateCategory, encoding: JSONEncoding.default)
                
                request.response{ res in
                    
                    if res.response?.statusCode == 200{
                        print("Update Success!")
                    }
                    
                }
                
            }
        }
        .onAppear(){
            
            let request = AF.request("https://northwind.vercel.app/api/categories/\(id)")
            
            request.responseDecodable(of: CategoryModel.self){response in
                
                category = response.value ?? CategoryModel()
                
            }
        }
        
    }
}

