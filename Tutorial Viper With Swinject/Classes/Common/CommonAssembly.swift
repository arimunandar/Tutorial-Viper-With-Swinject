//
//  CommonAssembly
//  Tutorial Viper With Swinject
//
//  Created by Ari Munandar on 16/10/18.
//  Copyright (c) 2018 ARTDEV INDONESIA. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import Foundation
import Swinject

public class CommonAssembly: Assembly {
    public func assemble(container: Container) {
        container.register(IAppRouter.self) { _ in
            AppRouter.shared
        }

        /*
         | Register your manager here, ex :
         |
         | container.register(ISampleManager.self) {(r) in
         |        return SampleManager()
         | }
         */

        container.register(ILoginManager.self) { _ in
            LoginManager()
        }
    }
}
