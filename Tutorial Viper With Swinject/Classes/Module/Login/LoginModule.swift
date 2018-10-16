//
//  LoginModule.swift
//  Tutorial Viper With Swinject
//
//  Created by Ari Munandar on 16/10/18.
//  Copyright (c) 2018 ARTDEV INDONESIA. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import Foundation
import UIKit

public class LoginModule: IModule {
    public let router: IAppRouter

    public init(router: IAppRouter) {
        self.router = router
    }

    public func presentView(parameters: [String: Any], presentType: PresentType) {
        let wireframe = router.resolver.resolve(ILoginWireframe.self, argument: router)!
        wireframe.presentView(parameters: parameters, presentType: presentType)
    }
}
