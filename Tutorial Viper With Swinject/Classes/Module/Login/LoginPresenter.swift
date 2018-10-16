//
//  LoginPresenter.swift
//  Tutorial Viper With Swinject
//
//  Created by Ari Munandar on 16/10/18.
//  Copyright (c) 2018 ARTDEV INDONESIA. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

public protocol ILoginPresenter: class {
	var parameters: [String: Any]? { get set }
}

public class LoginPresenter: ILoginPresenter {
	
	var interactor: ILoginInteractor?
	var wireframe: ILoginWireframe?
	weak var view: ILoginViewController?
	public var parameters: [String: Any]?
	
	public init(interactor: ILoginInteractor, wireframe: ILoginWireframe, view: ILoginViewController) {
		self.interactor = interactor
		self.wireframe = wireframe
		self.view = view
	}
}

extension LoginPresenter: ILoginInteractorDelegate {
	
}
