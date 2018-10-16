//
//  LoginInteractor.swift
//  Tutorial Viper With Swinject
//
//  Created by Ari Munandar on 16/10/18.
//  Copyright (c) 2018 ARTDEV INDONESIA. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

public protocol ILoginInteractorDelegate: class {
	
}

public protocol ILoginInteractor: class {
	var delegate: ILoginInteractorDelegate? { get set }
}

public class LoginInteractor: ILoginInteractor {
	
	// MARK: - Declare delegate

	public var delegate: ILoginInteractorDelegate?

	/*
	 | Declare your managers here, ex:
	 |
	 | var sampleManager: ISampleManager?
	 |
	 | And let's initial managers, ex:
	 |
	 | init(sampleManager: ISampleManager) {
	 |    self.sampleManager = sampleManager
	 | }
	 */

	init() {
		// Do someting here...
	}
}