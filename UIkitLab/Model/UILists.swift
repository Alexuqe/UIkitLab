    //
    //  UILists.swift
    //  UIkitLab
    //
    //  Created by Sasha on 16.03.25.
    //

import Foundation
import UIKit

struct UILists {
    let chapterName: String
    let isExpanded: Bool
    let components: [UIComponent]
}

struct UIComponent {
    let name: String
    let image: String
    let backgroundColor: UIColor
}
