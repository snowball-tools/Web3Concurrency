@_exported import Web3

/// Extension to add async functionality to the `Web3` client.
extension Web3 {

    /**
     Asynchronously retrieves the client version.

     This function fetches the version of the Ethereum client that the `Web3` instance is connected to.
     It can be useful for debugging purposes or to ensure compatibility with specific features of different client versions.

     - Returns: A `String` representing the client version.
     - Throws: An error if the client version could not be retrieved.
     */
    public func clientVersion() async throws -> String {
        try await withCheckedThrowingContinuation { continuation in
            self.clientVersion { response in
                continuation.resume(with: response)
            }
        }
    }
}

/// Extension to add async functionality to the `Web3.Net` namespace.
extension Web3.Net {

    /**
     Asynchronously retrieves the network version.

     This function fetches the version of the Ethereum network protocol being used.
     This can be important for applications that need to adapt their behavior based on the network version.

     - Returns: A `String` representing the network version.
     - Throws: An error if the network version could not be retrieved.
     */
    public func version() async throws -> String {
        try await withCheckedThrowingContinuation { continuation in
            self.version { response in
                continuation.resume(with: response)
            }
        }
    }

    /**
     Asynchronously retrieves the number of peers currently connected to the client.

     This function fetches the count of connected peers, which can be useful for monitoring the network connectivity of the Ethereum client.

     - Returns: An `EthereumQuantity` representing the peer count.
     - Throws: An error if the peer count could not be retrieved.
     */
    public func peerCount() async throws -> EthereumQuantity {
        try await withCheckedThrowingContinuation { continuation in
            self.peerCount { response in
                continuation.resume(with: response)
            }
        }
    }
}

/// Extension to add async functionality to the `Web3.Eth` namespace.
extension Web3.Eth {

    /**
     Asynchronously retrieves the protocol version.

     This function fetches the version of the Ethereum protocol that the client is using.
     It is useful for applications that need to ensure compatibility with specific protocol versions.

     - Returns: A `String` representing the protocol version.
     - Throws: An error if the protocol version could not be retrieved.
     */
    public func protocolVersion() async throws -> String {
        try await withCheckedThrowingContinuation { continuation in
            self.protocolVersion { response in
                continuation.resume(with: response)
            }
        }
    }

    /**
     Asynchronously retrieves the sync status of the client.

     This function fetches the current synchronization status of the Ethereum client,
     which indicates whether the client is syncing with the network and provides details about the sync progress.

     - Returns: An `EthereumSyncStatusObject` representing the sync status.
     - Throws: An error if the sync status could not be retrieved.
     */
    public func syncing() async throws -> EthereumSyncStatusObject {
        try await withCheckedThrowingContinuation { continuation in
            self.syncing { response in
                continuation.resume(with: response)
            }
        }
    }

    /**
     Asynchronously checks if the client is currently mining.

     This function fetches the mining status of the Ethereum client, indicating whether the client is actively mining new blocks.

     - Returns: A `Bool` indicating if the client is mining.
     - Throws: An error if the mining status could not be retrieved.
     */
    public func mining() async throws -> Bool {
        try await withCheckedThrowingContinuation { continuation in
            self.mining { response in
                continuation.resume(with: response)
            }
        }
    }

    /**
     Asynchronously retrieves the current hash rate of the client.

     This function fetches the current hash rate of the Ethereum client, which is a measure of the computational power being used for mining.

     - Returns: An `EthereumQuantity` representing the hash rate.
     - Throws: An error if the hash rate could not be retrieved.
     */
    public func hashrate() async throws -> EthereumQuantity {
        try await withCheckedThrowingContinuation { continuation in
            self.hashrate { response in
                continuation.resume(with: response)
            }
        }
    }

    /**
     Asynchronously retrieves the current gas price.

     This function fetches the current gas price in wei, which is the fee per unit of gas used in transactions.
     This is important for users to estimate the cost of their transactions.

     - Returns: An `EthereumQuantity` representing the gas price.
     - Throws: An error if the gas price could not be retrieved.
     */
    public func gasPrice() async throws -> EthereumQuantity {
        try await withCheckedThrowingContinuation { continuation in
            self.gasPrice { response in
                continuation.resume(with: response)
            }
        }
    }

    /**
     Asynchronously retrieves the list of accounts managed by the client.

     This function fetches the list of Ethereum addresses that are managed by the client.
     This is useful for applications that need to interact with the user's accounts.

     - Returns: An array of `EthereumAddress` representing the accounts.
     - Throws: An error if the accounts could not be retrieved.
     */
    public func accounts() async throws -> [EthereumAddress] {
        try await withCheckedThrowingContinuation { continuation in
            self.accounts { response in
                continuation.resume(with: response)
            }
        }
    }

    /**
     Asynchronously retrieves the block number of the most recent block.

     This function fetches the block number of the latest block in the blockchain.
     This is useful for applications that need to reference the most recent block.

     - Returns: An `EthereumQuantity` representing the block number.
     - Throws: An error if the block number could not be retrieved.
     */
    public func blockNumber() async throws -> EthereumQuantity {
        try await withCheckedThrowingContinuation { continuation in
            self.blockNumber { response in
                continuation.resume(with: response)
            }
        }
    }

    /**
     Asynchronously retrieves the balance of a specified address.

     This function fetches the balance of the given Ethereum address at the specified block.
     This is important for applications that need to check the user's balance.

     - Parameters:
     - address: The `EthereumAddress` to fetch the balance for.
     - block: The `EthereumQuantityTag` representing the block to query.
     - Returns: An `EthereumQuantity` representing the balance.
     - Throws: An error if the balance could not be retrieved.
     */
    public func balance(
        for address: EthereumAddress, block: EthereumQuantityTag
    ) async throws -> EthereumQuantity {
        try await withCheckedThrowingContinuation { continuation in
            self.getBalance(address: address, block: block) { response in
                continuation.resume(with: response)
            }
        }
    }

    /**
     Asynchronously retrieves the storage data at a specified position for a given address.

     This function fetches the storage data for the given Ethereum address at the specified position and block.
     This is useful for applications that need to read contract storage.

     - Parameters:
     - address: The `EthereumAddress` to fetch the storage for.
     - position: The `EthereumQuantity` representing the storage position.
     - block: The `EthereumQuantityTag` representing the block to query.
     - Returns: An `EthereumData` representing the storage data.
     - Throws: An error if the storage data could not be retrieved.
     */
    public func storage(
        for address: EthereumAddress,
        position: EthereumQuantity,
        block: EthereumQuantityTag
    ) async throws -> EthereumData {
        try await withCheckedThrowingContinuation { continuation in
            self.getStorageAt(
                address: address, position: position, block: block
            ) { response in
                continuation.resume(with: response)
            }
        }
    }

    /**
     Asynchronously retrieves the transaction count for a specified address.

     This function fetches the number of transactions sent from the given Ethereum address at the specified block.
     This is useful for applications that need to determine the nonce for new transactions.

     - Parameters:
     - address: The `EthereumAddress` to fetch the transaction count for.
     - block: The `EthereumQuantityTag` representing the block to query.
     - Returns: An `EthereumQuantity` representing the transaction count.
     - Throws: An error if the transaction count could not be retrieved.
     */
    public func transactionCount(
        for address: EthereumAddress, on block: EthereumQuantityTag
    ) async throws -> EthereumQuantity {
        try await withCheckedThrowingContinuation { continuation in
            self.getTransactionCount(address: address, block: block) {
                response in
                continuation.resume(with: response)
            }
        }
    }

    /**
     Asynchronously retrieves the transaction count for a specified block hash.

     This function fetches the number of transactions included in the block identified by the given hash.

     - Parameters:
     - blockHash: The `EthereumData` representing the block hash.
     - Returns: An `EthereumQuantity` representing the transaction count.
     - Throws: An error if the transaction count could not be retrieved.
     */
    public func transactionCount(blockHash: EthereumData) async throws
        -> EthereumQuantity
    {
        try await withCheckedThrowingContinuation { continuation in
            self.getBlockTransactionCountByHash(blockHash: blockHash) {
                response in
                continuation.resume(with: response)
            }
        }
    }

    /**
     Asynchronously retrieves the transaction count for a specified block number.

     This function fetches the number of transactions included in the block identified by the given block number.

     - Parameters:
     - blockNumber: The `EthereumQuantityTag` representing the block number.
     - Returns: An `EthereumQuantity` representing the transaction count.
     - Throws: An error if the transaction count could not be retrieved.
     */
    public func transactionCount(blockNumber: EthereumQuantityTag)
        async throws
        -> EthereumQuantity
    {
        try await withCheckedThrowingContinuation { continuation in
            self.getBlockTransactionCountByNumber(block: blockNumber) {
                response in
                continuation.resume(with: response)
            }
        }
    }

    /**
     Asynchronously retrieves the uncle count for a specified block hash.

     This function fetches the number of uncle blocks included in the block identified by the given hash.

     - Parameters:
     - blockHash: The `EthereumData` representing the block hash.
     - Returns: An `EthereumQuantity` representing the uncle count.
     - Throws: An error if the uncle count could not be retrieved.
     */
    public func uncleCount(blockHash: EthereumData) async throws
        -> EthereumQuantity
    {
        try await withCheckedThrowingContinuation { continuation in
            self.getUncleCountByBlockHash(blockHash: blockHash) {
                response in
                continuation.resume(with: response)
            }
        }
    }

    /**
     Asynchronously retrieves the uncle count for a specified block number.

     This function fetches the number of uncle blocks included in the block identified by the given block number.

     - Parameters:
     - blockNumber: The `EthereumQuantityTag` representing the block number.
     - Returns: An `EthereumQuantity` representing the uncle count.
     - Throws: An error if the uncle count could not be retrieved.
     */
    public func uncleCount(blockNumber: EthereumQuantityTag) async throws
        -> EthereumQuantity
    {
        try await withCheckedThrowingContinuation { continuation in
            self.getUncleCountByBlockNumber(block: blockNumber) {
                response in
                continuation.resume(with: response)
            }
        }
    }

    /**
     Asynchronously retrieves the code at a specified address.

     This function fetches the contract code stored at the given Ethereum address at the specified block.
     This is useful for applications that need to inspect or interact with smart contracts.

     - Parameters:
     - address: The `EthereumAddress` to fetch the code for.
     - block: The `EthereumQuantityTag` representing the block to query.
     - Returns: An `EthereumData` representing the code.
     - Throws: An error if the code could not be retrieved.
     */
    public func code(
        for address: EthereumAddress, on block: EthereumQuantityTag
    ) async throws -> EthereumData {
        try await withCheckedThrowingContinuation { continuation in
            self.getCode(address: address, block: block) { response in
                continuation.resume(with: response)
            }
        }
    }

    /**
     Asynchronously sends a raw transaction.

     This function sends a signed raw transaction to the Ethereum network.
     This is useful for applications that need to broadcast a transaction that has been signed offline or in another context.

     - Parameters:
     - transaction: The `EthereumSignedTransaction` to send.
     - Returns: An `EthereumData` representing the transaction hash.
     - Throws: An error if the transaction could not be sent.
     */
    public func sendRawTransaction(transaction: EthereumSignedTransaction)
        async throws -> EthereumData
    {
        try await withCheckedThrowingContinuation { continuation in
            do {
                try self.sendRawTransaction(transaction: transaction) {
                    response in
                    continuation.resume(with: response)
                }
            } catch let err {
                continuation.resume(throwing: err)
            }
        }
    }

    /**
     Asynchronously sends a transaction.

     This function sends a transaction to the Ethereum network.
     This is useful for applications that need to send a transaction, such as transferring Ether or interacting with a smart contract.

     - Parameters:
     - transaction: The `EthereumTransaction` to send.
     - Returns: An `EthereumData` representing the transaction hash.
     - Throws: An error if the transaction could not be sent.
     */
    public func sendTransaction(transaction: EthereumTransaction)
        async throws
        -> EthereumData
    {
        try await withCheckedThrowingContinuation { continuation in
            self.sendTransaction(transaction: transaction) { response in
                continuation.resume(with: response)
            }
        }
    }

    /**
     Asynchronously executes a call on the Ethereum network.

     This function executes a call to a smart contract on the Ethereum network without creating a transaction.
     It is useful for reading data from smart contracts.

     - Parameters:
     - call: The `EthereumCall` object representing the call to execute.
     - block: The `EthereumQuantityTag` representing the block to query.
     - Returns: An `EthereumData` representing the return value of the call.
     - Throws: An error if the call could not be executed.
     */
    public func call(_ call: EthereumCall, on block: EthereumQuantityTag)
        async throws -> EthereumData
    {
        try await withCheckedThrowingContinuation { continuation in
            self.call(call: call, block: block) { response in
                continuation.resume(with: response)
            }
        }
    }

    /**
     Asynchronously estimates the gas required for a call.

     This function estimates the amount of gas that will be needed to execute a call to a smart contract.
     It is useful for determining the gas cost of a transaction before sending it.

     - Parameters:
     - call: The `EthereumCall` object representing the call to estimate gas for.
     - Returns: An `EthereumQuantity` representing the estimated gas amount.
     - Throws: An error if the gas estimate could not be retrieved.
     */
    public func estimateGas(for call: EthereumCall) async throws
        -> EthereumQuantity
    {
        try await withCheckedThrowingContinuation { continuation in
            self.estimateGas(call: call) { response in
                continuation.resume(with: response)
            }
        }
    }

    /**
     Asynchronously retrieves a block by its hash.

     This function fetches a block from the blockchain identified by its hash.
     It can optionally include the full transaction objects in the block.

     - Parameters:
     - hash: The `EthereumData` representing the block hash.
     - fullTransactionObjects: A `Bool` indicating whether to include the full transaction objects.
     - Returns: An optional `EthereumBlockObject` representing the block, or `nil` if the block is not found.
     - Throws: An error if the block could not be retrieved.
     */
    public func block(hash: EthereumData, fullTransactionObjects: Bool)
        async throws -> EthereumBlockObject?
    {
        try await withCheckedThrowingContinuation { continuation in
            self.getBlockByHash(
                blockHash: hash,
                fullTransactionObjects: fullTransactionObjects
            ) { response in
                continuation.resume(with: response)
            }
        }
    }

    /**
     Asynchronously retrieves a block by its number.

     This function fetches a block from the blockchain identified by its number.
     It can optionally include the full transaction objects in the block.

     - Parameters:
     - number: The `EthereumQuantityTag` representing the block number.
     - fullTransactionObjects: A `Bool` indicating whether to include the full transaction objects.
     - Returns: An optional `EthereumBlockObject` representing the block, or `nil` if the block is not found.
     - Throws: An error if the block could not be retrieved.
     */
    public func block(
        number: EthereumQuantityTag,
        fullTransactionObjects: Bool
    ) async throws -> EthereumBlockObject? {
        try await withCheckedThrowingContinuation { continuation in
            self.getBlockByNumber(
                block: number,
                fullTransactionObjects: fullTransactionObjects
            ) { response in
                continuation.resume(with: response)
            }
        }
    }

    /**
     Asynchronously retrieves a transaction by its hash.

     This function fetches a transaction from the blockchain identified by its hash.

     - Parameters:
     - blockHash: The `EthereumData` representing the transaction hash.
     - Returns: An optional `EthereumTransactionObject` representing the transaction, or `nil` if the transaction is not found.
     - Throws: An error if the transaction could not be retrieved.
     */
    public func transaction(blockHash: EthereumData) async throws
        -> EthereumTransactionObject?
    {
        try await withCheckedThrowingContinuation { continuation in
            self.getTransactionByHash(blockHash: blockHash) { response in
                continuation.resume(with: response)
            }
        }
    }

    /**
     Asynchronously retrieves a transaction by its hash and index within a block.

     This function fetches a transaction from the blockchain identified by its block hash and transaction index.

     - Parameters:
     - blockHash: The `EthereumData` representing the block hash.
     - transactionIndex: The `EthereumQuantity` representing the transaction index within the block.
     - Returns: An optional `EthereumTransactionObject` representing the transaction, or `nil` if the transaction is not found.
     - Throws: An error if the transaction could not be retrieved.
     */
    public func transaction(
        blockHash: EthereumData,
        transactionIndex: EthereumQuantity
    ) async throws -> EthereumTransactionObject? {
        try await withCheckedThrowingContinuation { continuation in
            self.getTransactionByBlockHashAndIndex(
                blockHash: blockHash, transactionIndex: transactionIndex
            ) { response in
                continuation.resume(with: response)
            }
        }
    }

    /**
     Asynchronously retrieves a transaction by its index within a block.

     This function fetches a transaction from the blockchain identified by its block number and transaction index.

     - Parameters:
     - block: The `EthereumQuantityTag` representing the block number.
     - transactionIndex: The `EthereumQuantity` representing the transaction index within the block.
     - Returns: An optional `EthereumTransactionObject` representing the transaction, or `nil` if the transaction is not found.
     - Throws: An error if the transaction could not be retrieved.
     */
    public func transaction(
        block: EthereumQuantityTag,
        transactionIndex: EthereumQuantity
    ) async throws -> EthereumTransactionObject? {
        try await withCheckedThrowingContinuation { continuation in
            self.getTransactionByBlockNumberAndIndex(
                block: block, transactionIndex: transactionIndex
            ) { response in
                continuation.resume(with: response)
            }
        }
    }

    /**
     Asynchronously retrieves the receipt of a transaction by its hash.

     This function fetches the receipt of a transaction from the blockchain identified by its hash.
     The receipt contains information about the transaction execution, such as the status, gas used, and logs generated.

     - Parameters:
     - hash: The `EthereumData` representing the transaction hash.
     - Returns: An optional `EthereumTransactionReceiptObject` representing the transaction receipt, or `nil` if the receipt is not found.
     - Throws: An error if the transaction receipt could not be retrieved.
     */
    public func transactionReceipt(hash: EthereumData) async throws
        -> EthereumTransactionReceiptObject?
    {
        try await withCheckedThrowingContinuation { continuation in
            self.getTransactionReceipt(transactionHash: hash) { response in
                continuation.resume(with: response)
            }
        }
    }

    /**
     Asynchronously retrieves an uncle block by its index within a block.

     This function fetches an uncle block from the blockchain identified by its block hash and uncle index.
     Uncle blocks are valid blocks that were not included in the main blockchain.

     - Parameters:
     - blockHash: The `EthereumData` representing the block hash.
     - uncleIndex: The `EthereumQuantity` representing the uncle index within the block.
     - Returns: An optional `EthereumBlockObject` representing the uncle block, or `nil` if the uncle block is not found.
     - Throws: An error if the uncle block could not be retrieved.
     */
    public func uncle(
        blockHash: EthereumData,
        uncleIndex: EthereumQuantity
    ) async throws -> EthereumBlockObject? {
        try await withCheckedThrowingContinuation { continuation in
            self.getUncleByBlockHashAndIndex(
                blockHash: blockHash, uncleIndex: uncleIndex
            ) { response in
                continuation.resume(with: response)
            }
        }
    }

    /**
     Asynchronously retrieves an uncle block by its index within a block.

     This function fetches an uncle block from the blockchain identified by its block number and uncle index.
     Uncle blocks are valid blocks that were not included in the main blockchain.

     - Parameters:
     - block: The `EthereumQuantityTag` representing the block number.
     - uncleIndex: The `EthereumQuantity` representing the uncle index within the block.
     - Returns: An optional `EthereumBlockObject` representing the uncle block, or `nil` if the uncle block is not found.
     - Throws: An error if the uncle block could not be retrieved.
     */
    public func uncle(
        block: EthereumQuantityTag,
        uncleIndex: EthereumQuantity
    ) async throws -> EthereumBlockObject? {
        try await withCheckedThrowingContinuation { continuation in
            self.getUncleByBlockNumberAndIndex(
                block: block, uncleIndex: uncleIndex
            ) { response in
                continuation.resume(with: response)
            }
        }
    }

    /**
     Asynchronously retrieves logs from the blockchain based on filter criteria.

     This function fetches logs from the blockchain that match the specified filter criteria,
     such as addresses, topics, and block range. Logs are generated by contract events.

     - Parameters:
     - addresses: An optional array of `EthereumAddress` to filter the logs by.
     - topics: An optional array of arrays of `EthereumData` to filter the logs by topics.
     - fromBlock: The `EthereumQuantityTag` representing the starting block for the log query.
     - toBlock: The `EthereumQuantityTag` representing the ending block for the log query.
     - Returns: An array of `EthereumLogObject` representing the matching logs.
     - Throws: An error if the logs could not be retrieved.
     */
    public func logs(
        addresses: [EthereumAddress]?,
        topics: [[EthereumData]]?,
        fromBlock: EthereumQuantityTag,
        toBlock: EthereumQuantityTag
    ) async throws -> [EthereumLogObject] {
        try await withCheckedThrowingContinuation { continuation in
            self.getLogs(
                addresses: addresses, topics: topics, fromBlock: fromBlock,
                toBlock: toBlock
            ) { response in
                continuation.resume(with: response)
            }
        }
    }
}
