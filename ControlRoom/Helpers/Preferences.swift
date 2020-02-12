//
//  Preferences.swift
//  ControlRoom
//
//  Created by Guilherme Rambo on 12/02/20.
//  Copyright © 2020 Paul Hudson. All rights reserved.
//

import Foundation
import Combine

final class Preferences: ObservableObject {

    let defaults: UserDefaults

    private var defaultsObservation: NSObjectProtocol?

    var isStatusBarModeEnabled: Bool {
        get { defaults.bool(forKey: #function) }
        set { defaults.set(newValue, forKey: #function) }
    }

    init(defaults: UserDefaults = .standard) {
        self.defaults = defaults

        self.defaultsObservation = NotificationCenter.default.addObserver(forName: UserDefaults.didChangeNotification, object: defaults, queue: .main) { [weak self] _ in
            self?.objectWillChange.send()
        }
    }

}
