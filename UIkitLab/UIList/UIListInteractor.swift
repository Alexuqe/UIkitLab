    //
    //  UIListInteractor.swift
    //  UIkitLab
    //
    //  Created by Sasha on 16.03.25.
    //

    //MARK: - Protocols
protocol UIListBussinesLogicProtocol {
    func fetchUIComponents()
}

protocol UIListDataStoreProtocol {
    var list: [UILists] { get }
}


    //MARK: - Interactor
final class UIListInteractor: UIListBussinesLogicProtocol, UIListDataStoreProtocol {

        //MARK: Properties
    var list: [UILists] = []
    var presenter: UIListPresenterLogicProtocol?

        //MARK: - FetchComponents
    func fetchUIComponents() {
        let worker = UIListWorker()
        self.list = worker.getComponent()

        let responce = UIList.ShowComponents.Responce(components: list)
        self.presenter?.presentComponents(responce: responce)
    }
}
