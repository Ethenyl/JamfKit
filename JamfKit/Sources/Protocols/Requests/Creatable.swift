//
//  Creatable.swift
//  JamfKit
//
//  Copyright © 2017-present JamfKit. All rights reserved.
//  Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

/// Represents an object that can be created with an URLRequest
@objc(JMFKCreatable)
public protocol Creatable {

    // MARK: - Functions

    /// Returns a POST **URLRequest** based on the identifier property of the supplied JSS object.
    func create() -> URLRequest?
}

// MARK: - Implementation

public extension Creatable where Self: Endpoint & Identifiable & Requestable {

    // MARK: - Functions

    func createRequest() -> URLRequest? {
        return SessionManager.instance.createRequest(for: self, key: BaseObject.CodingKeys.identifier.rawValue, value: String(identifier))
    }
}