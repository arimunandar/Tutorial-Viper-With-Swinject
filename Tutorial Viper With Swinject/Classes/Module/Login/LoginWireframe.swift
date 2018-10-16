//
//  LoginWireframe.swift
//  Tutorial Viper With Swinject
//
//  Created by Ari Munandar on 16/10/18.
//  Copyright (c) 2018 ARTDEV INDONESIA. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

public protocol ILoginWireframe: class {
    func presentView(parameters: [String: Any], presentType: PresentType)    
}

public class LoginWireframe: ILoginWireframe {
    let router: IAppRouter

    init(router: IAppRouter) {
        self.router = router
    }

    public func presentView(parameters: [String: Any], presentType: PresentType) {
        let view = router.resolver.resolve(LoginViewController.self, arguments: router, parameters)!
        router.present(view: view, animatedDisplay: true, animatedDismiss: true, presentType: presentType)
    }
}
