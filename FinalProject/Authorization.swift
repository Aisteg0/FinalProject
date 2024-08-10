//
//  Authorization.swift
//  FinalProject
//
//  Created by Михаил Ганин on 10.08.2024.
//

import SwiftUI

struct Authorization: View {
    @State private var isShowingLoading = false

    var body: some View {
        if !isShowingLoading {
            TextView()
        } else {
            Animation()
        }
        EnterNumber()
        ButtonNext() {
            isShowingLoading = true
        }
    }
}

#Preview {
    Authorization()
}
