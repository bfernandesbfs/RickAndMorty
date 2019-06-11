//
//  ServiceSubscription.swift
//  RIck and Morty
//
//  Created by Bruno Fernandes on 6/11/19.
//  Copyright © 2019 bfs. All rights reserved.
//

import Foundation
import Combine

public final class ServiceSubscription: Subscription {

    private let cancellable: Cancellable

    public init(_ cancel: @escaping () -> Void) {
        cancellable = AnyCancellable(cancel)
    }

    public func request(_ demand: Subscribers.Demand) {}

    public func cancel() {
        cancellable.cancel()
    }
}
