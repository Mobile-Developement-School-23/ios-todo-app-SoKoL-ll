//
//  ChooseImportantView.swift
//  TodoApp
//
//  Created by Alexandr Sokolov on 30.06.2023.
//

import Foundation
import UIKit

class ChooseImportantView: UIView {
    
    let label = UILabel()
    var props: TodoItemProps?
    let segmentControl = UISegmentedControl(items: [UIImage(systemName: "arrow.down") ?? "", "нет", UIImage(named: "excplanationMark") ?? ""])
    
    init() {
        super.init(frame: .zero)
        segmentControl.selectedSegmentIndex = 1
        label.text = "Важность"
        addSubview(label)
        addSubview(segmentControl)
        segmentControl.addTarget(self, action: #selector(segmentControlDidChanged), for: .valueChanged)

        label.snp.makeConstraints { make in
            make.bottom.top.equalToSuperview()
            make.left.equalToSuperview().inset(16)
        }
        
        segmentControl.snp.makeConstraints { make in
            make.bottom.top.equalToSuperview().inset(10)
            make.right.equalToSuperview().inset(12)
            make.width.equalTo(150)
        }
    }
    
    @objc func segmentControlDidChanged(target: UISegmentedControl) {
        let segmentedIndex = target.selectedSegmentIndex
        switch segmentedIndex {
        case 0:
            props?.updateImportance?(Importance.low)
        case 2:
            props?.updateImportance?(Importance.important)
        default:
            props?.updateImportance?(Importance.basic)
        }
    }
    
    func render(props: TodoItemProps?) {
        self.props = props
        switch props?.importance {
        case .important:
            segmentControl.selectedSegmentIndex = 2
        case .low:
            segmentControl.selectedSegmentIndex = 0
        default:
            segmentControl.selectedSegmentIndex = 1
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
