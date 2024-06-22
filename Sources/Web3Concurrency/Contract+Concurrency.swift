#if canImport(Web3ContractABI)

    import Web3ContractABI
    import Collections

    extension SolidityInvocation {

        /**
     Asynchronously calls a smart contract function.

     This function invokes a smart contract function call and returns the result.
     It is useful for reading data from smart contracts without creating a transaction.

     - Parameters:
     - block: The `EthereumQuantityTag` representing the block at which to execute the call. Defaults to `.latest`.
     - Returns: A dictionary with the result of the function call.
     - Throws: An error if the call could not be completed.
     */
        public func call(block: EthereumQuantityTag = .latest) async throws
            -> [String: Any]
        {
            try await withCheckedThrowingContinuation { continuation in
                self.call(block: block) { value, error in
                    if let value {
                        continuation.resume(returning: value)
                    } else if let error {
                        continuation.resume(throwing: error)
                    }
                }
            }
        }

        /**
     Asynchronously sends a transaction to a smart contract function.

     This function sends a transaction to invoke a smart contract function.
     It is useful for executing state-changing operations on smart contracts.

     - Parameters:
     - nonce: Optional `EthereumQuantity` for the transaction nonce. Defaults to `nil`.
     - gasPrice: Optional `EthereumQuantity` for the gas price. Defaults to `nil`.
     - maxFeePerGas: Optional `EthereumQuantity` for the maximum fee per gas. Defaults to `nil`.
     - maxPriorityFeePerGas: Optional `EthereumQuantity` for the maximum priority fee per gas. Defaults to `nil`.
     - gasLimit: Optional `EthereumQuantity` for the gas limit. Defaults to `nil`.
     - from: The `EthereumAddress` from which the transaction is sent.
     - value: Optional `EthereumQuantity` for the value to send with the transaction. Defaults to `nil`.
     - accessList: Optional `OrderedDictionary` of access list entries. Defaults to an empty dictionary.
     - transactionType: The `EthereumTransaction.TransactionType` for the transaction. Defaults to `.legacy`.
     - Returns: An `EthereumData` representing the transaction hash.
     - Throws: An error if the transaction could not be sent.
     */
        public func send(
            nonce: EthereumQuantity? = nil,
            gasPrice: EthereumQuantity? = nil,
            maxFeePerGas: EthereumQuantity? = nil,
            maxPriorityFeePerGas: EthereumQuantity? = nil,
            gasLimit: EthereumQuantity? = nil,
            from: EthereumAddress,
            value: EthereumQuantity? = nil,
            accessList: OrderedDictionary<EthereumAddress, [EthereumData]> =
                [:],
            transactionType: EthereumTransaction.TransactionType = .legacy
        ) async throws -> EthereumData {
            try await withCheckedThrowingContinuation { continuation in
                self.send(
                    nonce: nonce,
                    gasPrice: gasPrice,
                    maxFeePerGas: maxFeePerGas,
                    maxPriorityFeePerGas: maxPriorityFeePerGas,
                    gasLimit: gasLimit,
                    from: from,
                    value: value,
                    accessList: accessList,
                    transactionType: transactionType
                ) { value, error in
                    if let value {
                        continuation.resume(returning: value)
                    } else if let error {
                        continuation.resume(throwing: error)
                    }
                }
            }
        }

        /**
     Asynchronously estimates the gas required for a smart contract function call.

     This function estimates the amount of gas that will be required to execute a call to a smart contract function.
     It is useful for determining the gas cost of a transaction before sending it.

     - Parameters:
     - from: Optional `EthereumAddress` representing the sender of the transaction. Defaults to `nil`.
     - gas: Optional `EthereumQuantity` representing the gas limit. Defaults to `nil`.
     - value: Optional `EthereumQuantity` representing the value to send with the transaction. Defaults to `nil`.
     - Returns: An `EthereumQuantity` representing the estimated gas amount.
     - Throws: An error if the gas estimate could not be retrieved.
     */
        public func estimateGas(
            from: EthereumAddress? = nil, gas: EthereumQuantity? = nil,
            value: EthereumQuantity? = nil
        ) async throws -> EthereumQuantity {
            try await withCheckedThrowingContinuation { continuation in
                self.estimateGas(from: from, gas: gas, value: value) {
                    value, error in
                    if let value {
                        continuation.resume(returning: value)
                    } else if let error {
                        continuation.resume(throwing: error)
                    }
                }
            }
        }
    }

    extension SolidityConstructorInvocation {

        /**
     Sends a transaction to deploy a smart contract.

     This function sends a transaction to deploy a new smart contract to the Ethereum network.
     It uses a promise-based approach to handle the asynchronous operation.

     - Parameters:
     - nonce: Optional `EthereumQuantity` for the transaction nonce. Defaults to `nil`.
     - gasPrice: Optional `EthereumQuantity` for the gas price. Defaults to `nil`.
     - maxFeePerGas: Optional `EthereumQuantity` for the maximum fee per gas. Defaults to `nil`.
     - maxPriorityFeePerGas: Optional `EthereumQuantity` for the maximum priority fee per gas. Defaults to `nil`.
     - gasLimit: Optional `EthereumQuantity` for the gas limit. Defaults to `nil`.
     - from: The `EthereumAddress` from which the transaction is sent.
     - value: Optional `EthereumQuantity` for the value to send with the transaction. Defaults to `nil`.
     - accessList: Optional `OrderedDictionary` of access list entries. Defaults to an empty dictionary.
     - transactionType: The `EthereumTransaction.TransactionType` for the transaction. Defaults to `.legacy`.
     - Returns: A `Promise<EthereumData>` representing the transaction hash.
     - Note: This function internally calls the `send` method of the `SolidityConstructorInvocation` instance.
     */
        public func send(
            nonce: EthereumQuantity? = nil,
            gasPrice: EthereumQuantity? = nil,
            maxFeePerGas: EthereumQuantity? = nil,
            maxPriorityFeePerGas: EthereumQuantity? = nil,
            gasLimit: EthereumQuantity? = nil,
            from: EthereumAddress,
            value: EthereumQuantity? = nil,
            accessList: OrderedDictionary<EthereumAddress, [EthereumData]> =
                [:],
            transactionType: EthereumTransaction.TransactionType = .legacy
        ) async throws -> EthereumData {
            try await withCheckedThrowingContinuation { continuation in
                self.send(
                    nonce: nonce,
                    gasPrice: gasPrice,
                    maxFeePerGas: maxFeePerGas,
                    maxPriorityFeePerGas: maxPriorityFeePerGas,
                    gasLimit: gasLimit,
                    from: from,
                    value: value,
                    accessList: accessList,
                    transactionType: transactionType
                ) { value, error in
                    if let value {
                        continuation.resume(returning: value)
                    } else if let error {
                        continuation.resume(throwing: error)
                    }
                }
            }
        }
    }

#endif
