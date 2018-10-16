//
//  LoginAssembly.swift
//  Tutorial Viper With Swinject
//
//  Created by Ari Munandar on 16/10/18.
//  Copyright (c) 2018 ARTDEV INDONESIA. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import Foundation
import Swinject

public class LoginAssembly: Assembly {
    public init() {}
    
    public func assemble(container: Container) {
        container.register(LoginModule.self) { (_, appRouter: IAppRouter) in
            LoginModule(router: appRouter)
        }
        
        container.register(ILoginWireframe.self) { (_, appRouter: IAppRouter) -> ILoginWireframe in
            LoginWireframe(router: appRouter)
        }
        
        container.register(ILoginInteractor.self) { _ in
            
            /*
             | Register your manager here, ex:
             |
             | let sampleManager = r.resolve(ISampleManager.self)!
             |
             | And let's initial the manager with interactor, ex:
             |
             | let interactor = LoginInteractor(sampleManager: sampleManager)
             */
            
            let interactor = LoginInteractor()
            return interactor
        }
        
        container.register(ILoginPresenter.self) { (r, appRouter: IAppRouter, view: ILoginViewController) in
            let wireframe = r.resolve(ILoginWireframe.self, argument: appRouter)!
            let interactor = r.resolve(ILoginInteractor.self)!
            let presenter = LoginPresenter(interactor: interactor, wireframe: wireframe, view: view)
            interactor.delegate = presenter
            return presenter
        }
        
        /*
         | If you need passing some paramenter,
         | you can add new params with name parameters or other, ex:
         |
         | container.register(LoginViewController.self) { (r, appRouter: IAppRouter, parameters: [String: Any]) in
         |     let bundle = Bundle(for: LoginViewController.self)
         |     let view = LoginViewController(nibName: "LoginViewController", bundle: bundle)
         |     let presenter = r.resolve(IPresenter.self, arguments: appRouter, view as ILoginViewController)!
         |     presenter.parameters = parameters
         |     view.presenter = presenter
         |     return view
         | }
         */
        
        container.register(LoginViewController.self) { (r, appRouter: IAppRouter, parameters: [String: Any]) in
            let bundle = Bundle(for: LoginViewController.self)
            let view = LoginViewController(nibName: "LoginViewController", bundle: bundle)
            let presenter = r.resolve(ILoginPresenter.self, arguments: appRouter, view as ILoginViewController)!
            presenter.parameters = parameters
            view.presenter = presenter
            return view
        }
    }
}
