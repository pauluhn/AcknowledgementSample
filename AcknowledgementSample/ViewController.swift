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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func showAcknowledgements(_ sender: UIButton) {
        do {
            let viewModel = try AcknowledgementsListViewModel()
            let viewController = AcknowledgementsListViewController(viewModel: viewModel)
            navigationController?.pushViewController(viewController, animated: true)
        } catch {
            print(error.localizedDescription)
        }
    }
}

