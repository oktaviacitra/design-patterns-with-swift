//
//  Singleton.swift
//  design-pattern-with-swift
//
//  Created by Oktavia Citra on 01/09/22.
//

import Foundation

// MARK: - Design Pattern
class Office {
    
    private static var instance: Office!
    
    var employees: [Employee]?
    
    private init(_ employees: [Employee]?) {
        self.employees = employees
        Office.instance = self
    }
    
    static func shared(with employees: [Employee]?) -> Office {
        switch instance {
        case let i?:
            i.employees = employees
            return i
        default:
            instance = Office(employees)
            return instance
        }
    }
    
    func work() {
        if let numberOfEmployees: Int = employees?.count {
            print("There are \(String(numberOfEmployees)) that works in this morning")
        }
    }
    
}

// MARK: - Helper
struct Employee {
    let name: String
    let position: Position
    
    enum Position {
        case engineer
        case designer
    }
}

// MARK: - How to call the function of class
Office.shared(with: [.init(name: "Citra", position: .engineer)]).work()
