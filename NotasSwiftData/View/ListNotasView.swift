//
//  ListNotasView.swift
//  NotasSwiftData
//
//  Created by Esteban Perez Castillejo on 31/10/23.
//

import SwiftUI
import SwiftData


struct ListNotasView: View {
    
    @State private var show = false
    @State private var show2 = false
    @State var isSeeker: String = ""
    
    @State private var gradientColors: [Color] = [Color.red, Color.blue] // Inicializa con los colores iniciales del gradiente
    
    @State private var notas: [PersitenciaModel] = []
    
    @Environment (ViewControl.self) var viewControl
    
      @Query(filter: #Predicate<PersitenciaModel>{$0.titulo.contains("")}, sort: \PersitenciaModel.titulo, order: .forward) private var result: [PersitenciaModel]
    
    var filterResult: [PersitenciaModel] {
        if isSeeker.isEmpty{
            return Array(viewControl.notas)
        }else{
            return viewControl.notas.filter{ result in
                let titulo = result.titulo.localizedCaseInsensitiveContains(isSeeker)
                return titulo
            }
        }
    }
    
    var body: some View {
        
        NavigationStack{
            
                ZStack{
                    LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: .top)
                        .edgesIgnoringSafeArea(.all)
                    Image(systemName: "swiftdata").font(.system(size: 300))
                    VStack{
                        VStack(alignment: .leading){
                            Text("Notas con SwiftData")
                                .font(.custom("Cochin", size: 35)).bold()
                                .foregroundColor(Color.white)
                                .shadow(color: .black , radius: 3 ,  x: 2 , y: 5)
                                .padding()
                            
                            ZStack{
                                
                                TextField("Buscar ...", text: $isSeeker)
                                    .modifier(CustomText())
                                Image(systemName: "magnifyingglass")
                                    .offset(x: -150)
                            }
                            
                        }.padding()
                        
                        List{
                            
                            ForEach(filterResult, id:\.self){ item in
                                NavigationLink(value: item){
                                    Text(item.titulo )
                                        .font(.custom("Cochin", size: 20)).bold()
                                        .padding()
                                }
                                .listRowSeparator(.hidden)
                                .swipeActions{
                                    Button(role: .destructive){
                                        withAnimation{
                                            viewControl.context.delete(item)
                                        }
                                    } label: {
                                        Image(systemName: "trash")
                                    }
                                    
                                }
                                
                                
                            }
                            .onMove(perform: { indices, newOffset in
                                viewControl.move(from: indices, to: newOffset)
                                
                            })
                            .listRowBackground(Color.clear)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(10)
                            .background(LinearGradient(gradient: Gradient(colors: [Color.white, Color.gray]), startPoint: .leading, endPoint: .trailing))
                            .cornerRadius(10) // Fondo degradado y esquinas redondeadas
                            
                        }.listStyle(PlainListStyle())
                          //  .navigationTitle("Notas con SwiftData")
                          
                            .navigationDestination(for: PersitenciaModel.self, destination: { nota in
                                NotasView(db: nota)
                            })
                        
                            .toolbar{
                                ToolbarItem{
                                    Button(action: {
                                        show.toggle()
                                    }, label: {
                                        Image(systemName: "plus.circle").bold()
                                            .foregroundColor(Color.white)
                                            .shadow(color: .black , radius: 3 ,  x: 2 , y: 5)
                                    })
                                }
                            }
                            .toolbar{
                                ToolbarItem (placement: .navigation){
                                    Menu(content: {
                                        Button(action: {
                                            //...
                                        }, label: {
                                            Text("item 1")
                                        })
                                        
                                        Button(action: {
                                            //...
                                        }, label: {
                                            Text("item 2")
                                        })
                                        
                                        
                                    }, label: {
                                        Image(systemName: "gear")
                                            .foregroundColor(Color.white)
                                            .shadow(color: .black , radius: 3 ,  x: 2 , y: 5)
                                  })
                                }
                            }
                            .sheet(isPresented: $show, content: {
                                NavigationStack{
                                    AddNotasView(notas: $notas)
                                }.presentationDetents([.medium])
                            })
                            .onAppear{
                                viewControl.getNota()
                            }
                    }
                }
            
            }
    }
}
