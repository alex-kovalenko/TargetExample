//
//  AdobeManager.swift
//  AdobeManager
//
//  Created by Alexandr Kovalenko on 10/6/21.
//  Copyright © 2021  Alexandr Kovalenko Inc. All rights reserved.
//

import AEPCore
import AEPTarget
import AEPAnalytics
import AEPIdentity
import AEPLifecycle
import AEPSignal
import AEPServices
import AEPMobileServices_Nike
import Foundation

class AdobeManager {
    let appID: String

    init(appID: String) {
        self.appID = appID
    }

    func setup() {
        MobileCore.setLogLevel(.debug)
        MobileCore.registerExtensions([
            Lifecycle.self,
            Identity.self,
            Target.self,
            Analytics.self,
            Signal.self,
            AEPMobileServices.self
        ])

        MobileCore.configureWith(appId: appID)
        MobileCore.lifecycleStart(additionalContextData: nil)
    }

    func trackDeepLink(_ url: URL) {
        AEPMobileServices.trackAdobeDeepLink(url)
    }
}
