//
//  LoginView.swift
//  Aster
//
//  Created by Alexandre Graverol on 25/08/2022.
//

import SwiftUI
import AsterCore

let lighGreyColor = Color("LightGrey")

struct LoginView: View {
    let viewModel = LoginViewModel()

    @State var username: String = ""
    @State var birthday: String = ""
    @State var birthMonth: String = ""

    var body: some View {
        NavigationView {
            TabView {
                LabelLoginView()
                BirthdayLoginView()
            }.tabViewStyle(.page)
                .indexViewStyle(.page(backgroundDisplayMode: .always))
                .navigationBarHidden(true)
        }.navigationBarHidden(true)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

func nextPage() {
    print("should go next page")
}

struct LabelLoginView: View {

    let viewModel = LoginViewModel()
    @State var username: String = ""

    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .ignoresSafeArea()

            VStack {
                Text("Please enter a pseudo")
                    .font(.body)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding(.bottom, 18)

                TextField(viewModel.pseudo, text: $username)
                    .padding()
                    .background(lighGreyColor)
                    .cornerRadius(15)
                    .padding(15)

                Button(action: nextPage) {
                    Text("Next")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 220, height: 60, alignment: .center)
                        .background(Color.black)
                        .cornerRadius(35)
                }
            }
        }
    }
}

struct BirthdayLoginView: View {

    let viewModel = LoginViewModel()

    @State var birthday: String = ""
    @State var birthMonth: String = ""

    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .ignoresSafeArea()

            VStack {
                Text("Please enter your birthday")
                    .font(.body)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding(.bottom, 20)

                HStack {
                    TextField(viewModel.dayOfBirth, text: $birthday)
                        .keyboardType(.numberPad)
                        .padding()
                        .background(lighGreyColor)
                        .cornerRadius(15)
                    TextField(viewModel.monthOfBirth, text: $birthMonth)
                        .keyboardType(.numberPad)
                        .padding()
                        .background(lighGreyColor)
                        .cornerRadius(15)
                }.padding(15)

                NavigationLink(destination: HomeView(), label: {
                    Text("Lets start")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 220, height: 60, alignment: .center)
                        .background(Color.black)
                        .cornerRadius(35)
                })
            }
        }
    }
}

//    VStack {
//        Spacer()
//        Text(viewModel.catchPhrase)
//            .font(.largeTitle)
//            .fontWeight(.medium)
//            .padding(.bottom, 20)
//
//        Image("Logo")
//            .resizable()
//            .frame(width: 150, height: 150, alignment: .top)
//            .clipShape(Circle())
//            .shadow(radius: 15)
//            .overlay(Circle().stroke(Color.black, lineWidth: 1))
//
//        Spacer()
//        TextField(viewModel.pseudo, text: $username)
//            .padding()
//            .background(lighGreyColor)
//            .cornerRadius(15)
//            .padding(15)
//
//        HStack {
//            TextField(viewModel.dayOfBirth, text: $birthday)
//                .keyboardType(.numberPad)
//                .padding()
//                .background(lighGreyColor)
//                .cornerRadius(15)
//
//            TextField(viewModel.monthOfBirth, text: $birthMonth)
//                .keyboardType(.numberPad)
//                .padding()
//                .background(lighGreyColor)
//                .cornerRadius(15)
//        }.padding(15)
//
//        Spacer()
//        VStack {
//            NavigationLink(destination: HomeView(), label: {
//                Text("Login")
//                    .font(.headline)
//                    .foregroundColor(.white)
//                    .padding()
//                    .frame(width: 220, height: 60, alignment: .center)
//                    .background(Color.black)
//                    .cornerRadius(35)
//            })
//        }.simultaneousGesture(TapGesture().onEnded({
//            print("button taped")
//                    viewModel.save(user: $username)
//        }))
//        Spacer()
//    }.navigationBarHidden(true)
// }.navigationBarHidden(true)
