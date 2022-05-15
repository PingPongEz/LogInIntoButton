//
//  StorageManager.swift
//  LogInIntoButton
//
//  Created by Сергей Веретенников on 15/05/2022.
//

import Foundation
import Combine

class UserManager: ObservableObject {
    @Published var isRegistered = false
    var name = ""
}
