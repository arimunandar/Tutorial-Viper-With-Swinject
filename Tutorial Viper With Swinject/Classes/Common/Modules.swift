//
//  Module.swift
//  Tutorial Viper With Swinject
//
//  Created by Ari Munandar on 16/10/18.
//  Copyright (c) 2018 ARTDEV INDONESIA. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import Foundation
import UIKit

public protocol IModule {
    func presentView(parameters: [String: Any], presentType: PresentType)
}

public protocol Module: Product {
    var routePath: String { get }
}

public protocol Product {
    var productName: String { get }
}

public enum Products {
    case ARTDEVProduct

    public var productName: String {
        switch self {
        case .ARTDEVProduct:
            return "ARTDEV"
        }
    }

    public enum ARTDEV: Module {
        case LoginModule // Sample module

        public var productName: String {
            return "ARTDEV"
        }

        public var routePath: String {
            switch self {
            case .LoginModule:
                return "/artdev/login"            
            }
        }
    }
}
