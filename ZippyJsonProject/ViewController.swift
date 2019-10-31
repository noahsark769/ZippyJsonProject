//
//  ViewController.swift
//  ZippyJsonProject
//
//  Created by Noah Gilmore on 10/31/19.
//  Copyright © 2019 Noah Gilmore. All rights reserved.
//

import UIKit
import ZippyJSON

let string = "{\"key\": 123}"

struct Example: Codable {
    let key: String

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.key = (try? container.decode(String.self, forKey: .key)) ?? ""
    }
}

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let decoder = ZippyJSONDecoder()
        do {
            let data = string.data(using: .utf8)!
            let element = try decoder.decode(Example.self, from: data)
            print(element)
        } catch {
            print("Oh no!")
            print(error)
        }
    }


}

