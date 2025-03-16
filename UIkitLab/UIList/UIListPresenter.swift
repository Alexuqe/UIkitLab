//
//  UIListPresenter.swift
//  UIkitLab
//
//  Created by Sasha on 16.03.25.
//

protocol UIListPresenterLogicProtocol {
    func presentComponents(responce: UIList.ShowComponents.Responce)
}

final class UIListPresenter: UIListPresenterLogicProtocol {

    weak var viewController: UIListDisplayProtocol?

    func presentComponents(responce: UIList.ShowComponents.Responce) {
        let rows: [UIListCellModelProtocol] = responce.components.map {
            ListCellViewModel(list: $0)
        }

        let viewModel = UIList.ShowComponents.ViewModel(rows: rows)
        viewController?.displayComponents(viewModel: viewModel)
    }
    

}
