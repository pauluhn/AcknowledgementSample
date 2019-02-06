//
//  ViewController.swift
//  AcknowledgementSample
//
//  Created by Paul Uhn on 2/1/19.
//  Copyright © 2019 Rightpoint. All rights reserved.
//

import UIKit
import Swiftilities

class ViewController: UIViewController {
    private var viewModel: AcknowledgementsListViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            viewModel = try AcknowledgementsListViewModel()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    @IBAction func showDefault(_ sender: UIButton) {
        guard let viewModel = viewModel else { return }
        let viewController = AcknowledgementsListViewController(viewModel: viewModel)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func showCustom(_ sender: UIButton) {
        guard let viewModel = viewModel else { return }
        let viewController = CustomAcknowledgementsListViewController(
            title: NSLocalizedString("Custom Acknowledgements", comment: "Custom Acknowledgements"),
            viewModel: viewModel) { string in
                let font = UIFont.italicSystemFont(ofSize: 10)
                let paragraphStyle = NSMutableParagraphStyle()
                paragraphStyle.hyphenationFactor = 1
                paragraphStyle.paragraphSpacing = font.pointSize * 0.5
                let attributes: [NSAttributedString.Key: Any] = [
                    .font: font,
                    .foregroundColor: UIColor.white,
                    .paragraphStyle: paragraphStyle,
                    ]
                return NSAttributedString(string: string, attributes: attributes)
        }
        viewController.childViewControllerClass = CustomAcknowledgementViewController.self
        viewController.cellBackgroundColor = .darkGray
        viewController.view.backgroundColor = .lightGray
        viewController.tableView.separatorStyle = .none
        navigationController?.pushViewController(viewController, animated: true)
    }
}

private class CustomAcknowledgementsListViewController: AcknowledgementsListViewController {
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = super.tableView(tableView, cellForRowAt: indexPath)
        cell.textLabel?.textColor = .white
        let string = cell.textLabel?.text ?? ""
        cell.textLabel?.attributedText = NSAttributedString(string: string, attributes: [.font: UIFont.italicSystemFont(ofSize: 14)])
        cell.accessoryType = .detailDisclosureButton
        return cell
    }
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) else { return }
        switch cell.accessoryType {
        case .detailDisclosureButton:
            cell.accessoryType = .detailButton
            cell.backgroundColor = .black
        case .detailButton:
            cell.accessoryType = .detailDisclosureButton
            cell.backgroundColor = cellBackgroundColor
        case .checkmark,
             .disclosureIndicator,
             .none:
            break
        }
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) else { return }
        licenseViewBackgroundColor = cell.backgroundColor
        super.tableView(tableView, didSelectRowAt: indexPath)
    }
}

private class CustomAcknowledgementViewController: AcknowledgementViewController {}
