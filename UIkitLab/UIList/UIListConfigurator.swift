    //
    //  UIListConfigurator.swift
    //  UIkitLab
    //
    //  Created by Sasha on 17.03.25.
    //

import Foundation

final class UIListConfigurator {
    static let shared = UIListConfigurator()

    private init() {}

    func configure(with viewController: UIListController) {
        let interactor = UIListInteractor()
        let presenter = UIListPresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
    }
}
