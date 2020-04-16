//
//  Notebook+Extension.swift
//  Mooskine
//
//  Created by Kittikawin Sontinarakul on 16/4/2563 BE.
//  Copyright © 2563 Udacity. All rights reserved.
//

import Foundation

extension Notebook {
    public override func awakeFromInsert() {
        super.awakeFromInsert()
        creationDate = Date()
    }
}
