//
//  ModelTable.swift
//  UIKitManual
//
//  Created by Адель Ахметшин on 08.09.2022.
//

import Foundation
import UIKit

struct Contact {
    let name: String
    let image: UIImage
    let description: String
    let gender: Gender
}

enum Gender {
    case male
    case female
}

struct ImageName {
    static let person = "person"
    static let fillPerson = "person.fill"
}

struct Description {
    static let descriptionOne = "Приятная девушка"
    static let descriptionTwo = "Приятный молодой человек"
}

struct ModelTable {
    static func makeContacts() -> [Contact] {
        [
            Contact(name: "Alice", image: UIImage(systemName: ImageName.person)!, description: Description.descriptionOne, gender: .female),
            Contact(name: "Arina", image: UIImage(systemName: ImageName.person)!, description: Description.descriptionOne, gender: .female),
            Contact(name: "Astrid", image: UIImage(systemName: ImageName.person)!, description: Description.descriptionOne, gender: .female),
            Contact(name: "Kseniya", image: UIImage(systemName: ImageName.person)!, description: Description.descriptionOne, gender: .female),
            Contact(name: "Marry", image: UIImage(systemName: ImageName.person)!, description: Description.descriptionOne, gender: .female),
            Contact(name: "Marta", image: UIImage(systemName: ImageName.person)!, description: Description.descriptionOne, gender: .female),
            Contact(name: "Rovshana", image: UIImage(systemName: ImageName.person)!, description: Description.descriptionOne, gender: .female),
            Contact(name: "Selena", image: UIImage(systemName: ImageName.person)!, description: Description.descriptionOne, gender: .female),
            Contact(name: "Marilyn", image: UIImage(systemName: ImageName.person)!, description: Description.descriptionOne, gender: .female),
            Contact(name: "Maily", image: UIImage(systemName: ImageName.person)!, description: Description.descriptionOne, gender: .female),
            
            Contact(name: "Robert", image: UIImage(systemName: ImageName.fillPerson)!, description: Description.descriptionTwo, gender: .male),
            Contact(name: "Albert", image: UIImage(systemName: ImageName.fillPerson)!, description: Description.descriptionTwo, gender: .male),
            Contact(name: "Vadim", image: UIImage(systemName: ImageName.fillPerson)!, description: Description.descriptionTwo, gender: .male),
            Contact(name: "Gleb", image: UIImage(systemName: ImageName.fillPerson)!, description: Description.descriptionTwo, gender: .male),
            Contact(name: "David", image: UIImage(systemName: ImageName.fillPerson)!, description: Description.descriptionTwo, gender: .male),
            Contact(name: "Ismail", image: UIImage(systemName: ImageName.fillPerson)!, description: Description.descriptionTwo, gender: .male),
            Contact(name: "Igor", image: UIImage(systemName: ImageName.fillPerson)!, description: Description.descriptionTwo, gender: .male),
            Contact(name: "Leon", image: UIImage(systemName: ImageName.fillPerson)!, description: Description.descriptionTwo, gender: .male),
            Contact(name: "John", image: UIImage(systemName: ImageName.fillPerson)!, description: Description.descriptionTwo, gender: .male),
            Contact(name: "Jim", image: UIImage(systemName: ImageName.fillPerson)!, description: Description.descriptionTwo, gender: .male)
        ]
    }
    
    static func makeContactsWithGroup() -> [[Contact]] {
        let male = makeContacts().filter { $0.gender == .male }
        let female = makeContacts().filter { $0.gender == .female }
        return [male, female]
    }
}
