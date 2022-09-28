//
//  OnboardCardViewYesterday.swift
//  Aster
//
//  Created by Alexandre Graverol on 26/09/2022.
//

import SwiftUI
import AsterCore

struct OnboardCardViewYesterday: View {
    var sign: String
    @StateObject var viewModel = OnboardCardViewModelYesterday()

    var body: some View {
        VStack(alignment: .leading, spacing: 60) {
            Text(viewModel.horoscopeLabelYesterday)
                .bold()
                .font(.largeTitle)
                .foregroundColor(.black)
            Text(viewModel.horoscopeOfYesterday)
                .minimumScaleFactor(0.2)
                .font(.subheadline)
                .foregroundColor(.black)
        }
        .frame(width: 250, height: 350, alignment: .center)
        .padding(30)
        .background(Color.white)
        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .padding(20)
        .onAppear {
            viewModel.getHoroscope { (result: Result<String, ServiceError>) in
                switch result {
                case .success(let success):
                    DispatchQueue.main.async {
                        viewModel.horoscopeOfYesterday = success
                    }
                case .failure(let failure):
                    DispatchQueue.main.async {
                        viewModel.horoscopeOfYesterday = failure.localizedDescription
                    }
                }
            }
        }
    }
}
