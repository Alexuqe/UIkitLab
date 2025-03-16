    //
    //  UIListModel.swift
    //  UIkitLab
    //
    //  Created by Sasha on 16.03.25.
    //

import Foundation
import UIKit

typealias ListCellViewModel = UIList.ShowComponents.ViewModel.UIListModel

protocol UIListCellModelProtocol {
    var indetifier: String { get }
    var height: Double { get }
    var sectionName: String { get }
    var componentName: [String] { get }
    var image: [String] { get }
    var backgroundColor: [UIColor] { get }
    init(list: UILists)
}

enum UIList {

    enum ShowComponents {

        struct Responce {
            let components: [UILists]
        }

        struct ViewModel {

            struct UIListModel: UIListCellModelProtocol {
                var indetifier: String {
                    "ListCell"
                }

                var height: Double {
                    50
                }

                var sectionName: String {
                    list.chapterName
                }

                var componentName: [String] {
                    list.components.map { $0.name }
                }

                var image: [String] {
                    list.components.map { $0.image }
                }

                var backgroundColor: [UIColor] {
                    list.components.map { $0.backgroundColor }
                }

                private let list: UILists

                init(list: UILists) {
                    self.list = list
                }
            }

            let rows: [UIListCellModelProtocol]
        }
    }






}

