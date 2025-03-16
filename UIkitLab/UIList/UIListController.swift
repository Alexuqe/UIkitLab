    //
    //  UIListControllerTableViewController.swift
    //  UIkitLab
    //
    //  Created by Sasha on 16.03.25.
    //

import UIKit

protocol UIListDisplayProtocol: AnyObject {
    func displayComponents(viewModel: UIList.ShowComponents.ViewModel)
}

final class UIListController: UITableViewController {

    var interactor: UIListBussinesLogicProtocol?
    var configure = UIListConfigurator.shared
    private var rows: [UIListCellModelProtocol] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        setupNavigationController()
        setupTableView()
        fetchList()
    }

    override init(style: UITableView.Style) {
        super.init(style: style)
    }

    private func setupTableView() {
        configure.configure(with: self)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ListCell")
    }

    private func fetchList() {
        interactor?.fetchUIComponents()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


}

    //MARK: - TableView DataStore
extension UIListController {

        //MARK: Sections Setup
    override func numberOfSections(in tableView: UITableView) -> Int {
        rows.count
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        rows[section].sectionName
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        rows[section].componentName.count
    }

        //MARK: Rows setup
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath)
        cell.backgroundColor = .systemGray5
        let sectionComponent = rows[indexPath.section]
        var content = cell.defaultContentConfiguration()
        content.text = sectionComponent.componentName[indexPath.row]
        content.image = UIImage(systemName: sectionComponent.image[indexPath.row])
        content.imageProperties.tintColor = .black

        cell.contentConfiguration = content
        return cell
    }
}

extension UIListController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

    //MARK: - Display Protocol
extension UIListController: UIListDisplayProtocol {
    func displayComponents(viewModel: UIList.ShowComponents.ViewModel) {
        rows = viewModel.rows
        tableView.reloadData()
    }
}

    //MARK: - Setup NavigationController
private extension UIListController {

    func setupNavigationController() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white

        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance

        navigationController?.navigationBar.tintColor = .navigationBar

        title = "UI Kit Components"
    }
}

