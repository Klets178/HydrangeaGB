//
//  HydrangeaList.swift
//  HydrangeaGB
//
//  Created by KKK on 05.05.2022.
//

import Foundation

public struct HydrangeaList: Codable {
    public var info: Info
    public var lists: [Character]

    public init(info: Info, lists: [Character]) {
        self.info = info
        self.lists = lists
    }
}

public struct Info: Codable {
    public var count: Int

    public init(count: Int) {
        self.count = count
    }
}



public struct Character: Codable {
    public var id: Int64
    public var photo: [Photo]
    public var avatar: String
    public var name: String
    public var subname: String
    public var text: String

    public init(id: Int64, photo: [Photo], avatar: String, name: String, subname: String, text: String) {
        self.id = id
        self.photo = photo
        self.avatar = avatar
        self.name = name
        self.subname = subname
        self.text = text

    }
}


public struct Photo: Codable {
    public var id: Int
    public var name: String

    public init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
}
