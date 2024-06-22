import Foundation

extension CheckedContinuation where T: Codable, E == Error {
    func resume(with response: Web3Response<T>) {
        if let result = response.result {
            self.resume(returning: result)
        } else if let error = response.error {
            self.resume(throwing: error)
        }
    }
}
