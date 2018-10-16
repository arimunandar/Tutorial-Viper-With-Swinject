//
//  AppRouter.swift
//  Tutorial Viper With Swinject
//
//  Created by Ari Munandar on 16/10/18.
//  Copyright (c) 2018 ARTDEV INDONESIA. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import Foundation
import Swinject
import UIKit

public enum PresentType {
    case root, push, present, presentWithNavigationBar, modal, modalWithNavigationBar
}

public protocol IAppRouter {
    var resolver: Resolver { get }
    func present(view: UIViewController, animatedDisplay: Bool, animatedDismiss: Bool, presentType: PresentType)
    func popToRootViewController(animated: Bool)
    func popViewController(animated: Bool)
    func dismiss()
}

public class AppRouter: BaseAppRouter {
    public static let shared = AppRouter.createAppRouter()
    public static var assembler = Assembler()
    public static var products: [String: (_ appRouter: IAppRouter) -> IProductRouter] = [:]

    private static func createAppRouter() -> AppRouter {
        let router = AppRouter(assembler: assembler, products: products)
        return router
    }
}
