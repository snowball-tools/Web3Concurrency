import Testing

@testable import Web3Concurrency

let client = Web3(
    rpcURL:
        "https://eth-mainnet.g.alchemy.com/v2/a1KQ2FaEO9_ZJNt00qt_cMiWqJSCtpWV")
let address = try! EthereumAddress(
    hex: "0xd8dA6BF26964aF9D7eEd9e03E53415D37aA96045", eip55: true)

@Suite("Web3") struct Web3_Tests {
    @Test("Client Version") func clientVersion() async throws {
        let clientVersion = try await client.clientVersion()
        #expect(
            clientVersion == "Geth/v1.14.3-stable-ab48ba42/linux-amd64/go1.22.3"
        )
    }
}

@Suite("Web3 Net") struct Web3_Net_Tests {
    @Test("Version") func version() async throws {
        let clientVersion = try await client.net.version()
        #expect(clientVersion == "1")
    }

    @Test("Peer count test, not supported by alchemy.") func peerCount()
        async throws
    {
        await #expect(throws: Web3Response<EthereumQuantity>.Error.self) {
            let _ = try await client.net.peerCount()
        }
    }
}

@Suite("Web3 Eth") struct Web3_Eth_Tests {
    @Test("Protocol Version") func protocolVersion() async throws {
        try await #expect(client.eth.protocolVersion() == "0x41")
    }

    @Test("Syncing") func syncing() async throws {
        try await #expect(client.eth.syncing() == .init())
    }

    @Test("Mining test, not supported by alchemy") func mining() async throws {
        await #expect(throws: Web3Response<Bool>.Error.self) {
            try await client.eth.mining()
        }
    }

    @Test("Hash rate test, not supported by alchemy") func hashrate()
        async throws
    {
        await #expect(throws: Web3Response<EthereumQuantity>.Error.self) {
            try await client.eth.hashrate()
        }
    }

    @Test("Gas Price") func gasPrice() async throws {
        try await #expect(client.eth.gasPrice().quantity > 100_000_000)
    }

    @Test("Accounts") func accounts() async throws {
        try await #expect(client.eth.accounts().isEmpty)
    }

    @Test("Current block number") func blockNumber() async throws {
        try await #expect(client.eth.blockNumber().quantity > 6_000_000)
    }

    @Test("Get balance for address") func getBalance() async throws {
        try await #expect(
            client.eth.balance(for: address, block: .latest).quantity
                > 100)
    }

    @Test("Storage") func getStorageAt() async throws {
        try await #expect(
            client.eth.storage(
                for: address,
                position: .init(quantity: 1),
                block: .latest
            ).hex()
                == "0x0000000000000000000000000000000000000000000000000000000000000000"
        )
    }

    @Test("Transaction count for an address") func transactionCount()
        async throws
    {
        try await #expect(
            client.eth.transactionCount(for: address, on: .latest)
                .quantity > 100)
    }

    @Test("Transaction count by block number")
    func transactionCountByBlockNumber() async throws {
        try await #expect(
            client.eth.transactionCount(blockNumber: .latest).quantity > 1)
    }

    @Test("Transaction count by block hash") func transactionCountByBlockHash()
        async throws
    {
        try await #expect(
            client.eth.transactionCount(
                blockHash: .string(
                    "0xc9ecbac7738b8f84e136d2a772de1d561e19d0fe3c09be18fb7b35cb88db77ad"
                )
            ).quantity > 1)
    }

    @Test("Uncle count by block hash") func uncleCountByBlockHash() async throws
    {
        try await #expect(
            client.eth.uncleCount(
                blockHash: .string(
                    "0xc9ecbac7738b8f84e136d2a772de1d561e19d0fe3c09be18fb7b35cb88db77ad"
                )
            ).quantity == 0)
    }

    @Test("Uncle count by block number") func uncleCountByBlockNumber()
        async throws
    {
        try await #expect(
            client.eth.uncleCount(
                blockNumber: .latest
            ).quantity == 0)
    }

    @Test("Code") func code() async throws {
        try await #expect(
            client.eth.code(for: address, on: .latest).hex() == "0x")
    }

    @Test("Send raw transaction", .enabled(on: .appleInternalOnly))
    func sendRawTransaction() async throws {

    }

    @Test("Send transactions", .enabled(on: .appleInternalOnly))
    func sendTransaction() async throws {

    }

    @Test("Call Function") func call() async throws {
        let call = try EthereumCall(
            from: nil,
            to: EthereumAddress(
                hex: "0x2e704bf506b96adac7ad1df0db461344146a4657", eip55: false),
            gas: nil,
            gasPrice: nil,
            value: nil,
            data: EthereumData(
                ethereumValue:
                    "0xaa1e84de000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000046461766500000000000000000000000000000000000000000000000000000000"
            )
        )
        let result = try EthereumData.string(
            "0x5e2393c41c2785095aa424cf3e033319468b6dcebda65e61606ee2ae2a198a87"
        )
        try await #expect(client.eth.call(call, on: .latest) == result)
    }

    @Test("Estimate Gas") func estimateGas() async throws {
        let call = try EthereumCall(
            from: nil,
            to: EthereumAddress(
                hex: "0x2e704bf506b96adac7ad1df0db461344146a4657", eip55: false),
            gas: nil,
            gasPrice: nil,
            value: nil,
            data: EthereumData(
                ethereumValue:
                    "0xaa1e84de000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000046461766500000000000000000000000000000000000000000000000000000000"
            )
        )
        try await #expect(client.eth.estimateGas(for: call) == 22563)
    }

    @Test("Get logs") func getLogs() async throws {
        try await #expect(
            client.eth.logs(
                addresses: [
                    EthereumAddress(
                        hex: "0xdAC17F958D2ee523a2206206994597C13D831ec7",
                        eip55: true)
                ],
                topics: [
                    [
                        EthereumData(
                            ethereumValue:
                                "0xddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef"
                        )
                    ]
                ],
                fromBlock: .block(BigUInt(15_884_445)),
                toBlock: .block(BigUInt(15_884_445))
            )[0].topics[0].hex()
                == "0xddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef"
        )
    }
}
