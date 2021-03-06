//
//  User.swift
//  GHFollowers
//
//  Created by Tim Irrgang on 16.12.21.
//

import Foundation

struct User: Codable {
    var login:String
    var avatarUrl:String
    var name:String?
    var blog:String?
    var htmlUrl:String?
    var location:String?
    var bio:String?
    var publicRepos:Int
    var publicGists:Int
    var followers:Int
    var following:Int
}
