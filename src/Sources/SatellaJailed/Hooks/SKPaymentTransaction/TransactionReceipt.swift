import Jinx
import StoreKit

struct TransactionReceipt: Hook {
    typealias T = @convention(c) (
        SKPaymentTransaction,
        Selector
    ) -> Data

    let `class`: AnyClass? = SKPaymentTransaction.self
    let selector: Selector = sel_registerName("transactionReceipt")
    let replacement: T = { target, _ in
        let receipt: OldReceipt = ReceiptGenerator.old(
            for: target.payment.productIdentifier
        )
        
        ReceiptStorage.shared.currentProductID = target.payment.productIdentifier
        
        // Try to make a receipt, otherwise just return a static one and hope the app is dumb :p
        
        do {
            let receiptData: Data = try JSONEncoder().encode(receipt)
            return receiptData
        } catch {
            return Data([0x7b, 0x0a, 0x09, 0x22, 0x73, 0x69, 0x67, 0x6e, 0x61, 0x74, 0x75, 0x72, 0x65, 0x22, 0x20, 0x3d, 0x20, 0x22, 0x41, 0x30, 0x4c, 0x37, 0x46, 0x78, 0x50, 0x4f, 0x65, 0x50, 0x30, 0x49, 0x50, 0x61, 0x67, 0x77, 0x45, 0x2b, 0x43, 0x75, 0x78, 0x6d, 0x31, 0x4d, 0x70, 0x56, 0x66, 0x38, 0x4d, 0x6a, 0x54, 0x74, 0x6f, 0x2b, 0x37, 0x46, 0x44, 0x62, 0x54, 0x4e, 0x41, 0x39, 0x48, 0x78, 0x4f, 0x53, 0x56, 0x55, 0x2b, 0x58, 0x7a, 0x51, 0x51, 0x6b, 0x70, 0x75, 0x71, 0x77, 0x54, 0x49, 0x43, 0x39, 0x73, 0x64, 0x4a, 0x4c, 0x43, 0x61, 0x76, 0x4b, 0x77, 0x7a, 0x50, 0x6a, 0x66, 0x59, 0x49, 0x2f, 0x38, 0x66, 0x57, 0x45, 0x62, 0x52, 0x66, 0x57, 0x62, 0x54, 0x50, 0x47, 0x50, 0x7a, 0x48, 0x64, 0x56, 0x4d, 0x74, 0x75, 0x35, 0x72, 0x58, 0x5a, 0x38, 0x4f, 0x49, 0x4a, 0x73, 0x51, 0x2b, 0x2f, 0x72, 0x48, 0x6b, 0x4c, 0x47, 0x59, 0x4f, 0x4f, 0x77, 0x33, 0x76, 0x6a, 0x63, 0x76, 0x6a, 0x37, 0x56, 0x4d, 0x6e, 0x46, 0x56, 0x4e, 0x43, 0x65, 0x61, 0x46, 0x6a, 0x63, 0x2b, 0x2f, 0x55, 0x79, 0x64, 0x50, 0x57, 0x32, 0x71, 0x6d, 0x49, 0x71, 0x38, 0x72, 0x67, 0x52, 0x6f, 0x2b, 0x35, 0x2f, 0x48, 0x64, 0x66, 0x59, 0x4c, 0x58, 0x53, 0x5a, 0x2f, 0x32, 0x77, 0x53, 0x65, 0x71, 0x78, 0x65, 0x46, 0x54, 0x78, 0x59, 0x52, 0x6a, 0x44, 0x38, 0x74, 0x72, 0x47, 0x6b, 0x32, 0x39, 0x6a, 0x6a, 0x39, 0x44, 0x70, 0x6a, 0x69, 0x37, 0x30, 0x63, 0x36, 0x51, 0x71, 0x42, 0x51, 0x47, 0x68, 0x4f, 0x67, 0x45, 0x70, 0x77, 0x47, 0x39, 0x61, 0x4a, 0x62, 0x49, 0x75, 0x61, 0x47, 0x76, 0x70, 0x39, 0x39, 0x71, 0x35, 0x44, 0x39, 0x56, 0x42, 0x39, 0x54, 0x49, 0x5a, 0x55, 0x33, 0x61, 0x48, 0x53, 0x70, 0x4d, 0x6b, 0x69, 0x30, 0x35, 0x47, 0x6a, 0x36, 0x46, 0x41, 0x7a, 0x59, 0x4e, 0x30, 0x6f, 0x31, 0x42, 0x64, 0x64, 0x57, 0x75, 0x50, 0x47, 0x79, 0x77, 0x77, 0x57, 0x2b, 0x74, 0x72, 0x41, 0x6a, 0x68, 0x72, 0x5a, 0x58, 0x65, 0x41, 0x52, 0x4a, 0x73, 0x53, 0x70, 0x37, 0x4c, 0x53, 0x4f, 0x31, 0x4b, 0x45, 0x65, 0x63, 0x6f, 0x33, 0x41, 0x62, 0x4e, 0x4e, 0x77, 0x4d, 0x76, 0x74, 0x4e, 0x4a, 0x2f, 0x6a, 0x4b, 0x77, 0x70, 0x2f, 0x32, 0x53, 0x75, 0x52, 0x59, 0x48, 0x2f, 0x6d, 0x6d, 0x74, 0x4f, 0x79, 0x64, 0x31, 0x75, 0x6f, 0x34, 0x71, 0x51, 0x42, 0x50, 0x55, 0x58, 0x68, 0x49, 0x77, 0x55, 0x52, 0x70, 0x6d, 0x67, 0x47, 0x43, 0x51, 0x41, 0x41, 0x41, 0x57, 0x41, 0x4d, 0x49, 0x49, 0x46, 0x66, 0x44, 0x43, 0x43, 0x42, 0x47, 0x53, 0x67, 0x41, 0x77, 0x49, 0x42, 0x41, 0x67, 0x49, 0x49, 0x44, 0x75, 0x74, 0x58, 0x68, 0x2b, 0x65, 0x65, 0x43, 0x59, 0x30, 0x77, 0x44, 0x51, 0x59, 0x4a, 0x4b, 0x6f, 0x5a, 0x49, 0x68, 0x76, 0x63, 0x4e, 0x41, 0x51, 0x45, 0x46, 0x42, 0x51, 0x41, 0x77, 0x67, 0x5a, 0x59, 0x78, 0x43, 0x7a, 0x41, 0x4a, 0x42, 0x67, 0x4e, 0x56, 0x42, 0x41, 0x59, 0x54, 0x41, 0x6c, 0x56, 0x54, 0x4d, 0x52, 0x4d, 0x77, 0x45, 0x51, 0x59, 0x44, 0x56, 0x51, 0x51, 0x4b, 0x44, 0x41, 0x70, 0x42, 0x63, 0x48, 0x42, 0x73, 0x5a, 0x53, 0x42, 0x4a, 0x62, 0x6d, 0x4d, 0x75, 0x4d, 0x53, 0x77, 0x77, 0x4b, 0x67, 0x59, 0x44, 0x56, 0x51, 0x51, 0x4c, 0x44, 0x43, 0x4e, 0x42, 0x63, 0x48, 0x42, 0x73, 0x5a, 0x53, 0x42, 0x58, 0x62, 0x33, 0x4a, 0x73, 0x5a, 0x48, 0x64, 0x70, 0x5a, 0x47, 0x55, 0x67, 0x52, 0x47, 0x56, 0x32, 0x5a, 0x57, 0x78, 0x76, 0x63, 0x47, 0x56, 0x79, 0x49, 0x46, 0x4a, 0x6c, 0x62, 0x47, 0x46, 0x30, 0x61, 0x57, 0x39, 0x75, 0x63, 0x7a, 0x46, 0x45, 0x4d, 0x45, 0x49, 0x47, 0x41, 0x31, 0x55, 0x45, 0x41, 0x77, 0x77, 0x37, 0x51, 0x58, 0x42, 0x77, 0x62, 0x47, 0x55, 0x67, 0x56, 0x32, 0x39, 0x79, 0x62, 0x47, 0x52, 0x33, 0x61, 0x57, 0x52, 0x6c, 0x49, 0x45, 0x52, 0x6c, 0x64, 0x6d, 0x56, 0x73, 0x62, 0x33, 0x42, 0x6c, 0x63, 0x69, 0x42, 0x53, 0x5a, 0x57, 0x78, 0x68, 0x64, 0x47, 0x6c, 0x76, 0x62, 0x6e, 0x4d, 0x67, 0x51, 0x32, 0x56, 0x79, 0x64, 0x47, 0x6c, 0x6d, 0x61, 0x57, 0x4e, 0x68, 0x64, 0x47, 0x6c, 0x76, 0x62, 0x69, 0x42, 0x42, 0x64, 0x58, 0x52, 0x6f, 0x62, 0x33, 0x4a, 0x70, 0x64, 0x48, 0x6b, 0x77, 0x48, 0x68, 0x63, 0x4e, 0x4d, 0x54, 0x55, 0x78, 0x4d, 0x54, 0x45, 0x7a, 0x4d, 0x44, 0x49, 0x78, 0x4e, 0x54, 0x41, 0x35, 0x57, 0x68, 0x63, 0x4e, 0x4d, 0x6a, 0x4d, 0x77, 0x4d, 0x6a, 0x41, 0x33, 0x4d, 0x6a, 0x45, 0x30, 0x4f, 0x44, 0x51, 0x33, 0x57, 0x6a, 0x43, 0x42, 0x69, 0x54, 0x45, 0x33, 0x4d, 0x44, 0x55, 0x47, 0x41, 0x31, 0x55, 0x45, 0x41, 0x77, 0x77, 0x75, 0x54, 0x57, 0x46, 0x6a, 0x49, 0x45, 0x46, 0x77, 0x63, 0x43, 0x42, 0x54, 0x64, 0x47, 0x39, 0x79, 0x5a, 0x53, 0x42, 0x68, 0x62, 0x6d, 0x51, 0x67, 0x61, 0x56, 0x52, 0x31, 0x62, 0x6d, 0x56, 0x7a, 0x49, 0x46, 0x4e, 0x30, 0x62, 0x33, 0x4a, 0x6c, 0x49, 0x46, 0x4a, 0x6c, 0x59, 0x32, 0x56, 0x70, 0x63, 0x48, 0x51, 0x67, 0x55, 0x32, 0x6c, 0x6e, 0x62, 0x6d, 0x6c, 0x75, 0x5a, 0x7a, 0x45, 0x73, 0x4d, 0x43, 0x6f, 0x47, 0x41, 0x31, 0x55, 0x45, 0x43, 0x77, 0x77, 0x6a, 0x51, 0x58, 0x42, 0x77, 0x62, 0x47, 0x55, 0x67, 0x56, 0x32, 0x39, 0x79, 0x62, 0x47, 0x52, 0x33, 0x61, 0x57, 0x52, 0x6c, 0x49, 0x45, 0x52, 0x6c, 0x64, 0x6d, 0x56, 0x73, 0x62, 0x33, 0x42, 0x6c, 0x63, 0x69, 0x42, 0x53, 0x5a, 0x57, 0x78, 0x68, 0x64, 0x47, 0x6c, 0x76, 0x62, 0x6e, 0x4d, 0x78, 0x45, 0x7a, 0x41, 0x52, 0x42, 0x67, 0x4e, 0x56, 0x42, 0x41, 0x6f, 0x4d, 0x43, 0x6b, 0x46, 0x77, 0x63, 0x47, 0x78, 0x6c, 0x49, 0x45, 0x6c, 0x75, 0x59, 0x79, 0x34, 0x78, 0x43, 0x7a, 0x41, 0x4a, 0x42, 0x67, 0x4e, 0x56, 0x42, 0x41, 0x59, 0x54, 0x41, 0x6c, 0x56, 0x54, 0x4d, 0x49, 0x49, 0x42, 0x49, 0x6a, 0x41, 0x4e, 0x42, 0x67, 0x6b, 0x71, 0x68, 0x6b, 0x69, 0x47, 0x39, 0x77, 0x30, 0x42, 0x41, 0x51, 0x45, 0x46, 0x41, 0x41, 0x4f, 0x43, 0x41, 0x51, 0x38, 0x41, 0x4d, 0x49, 0x49, 0x42, 0x43, 0x67, 0x4b, 0x43, 0x41, 0x51, 0x45, 0x41, 0x70, 0x63, 0x2b, 0x42, 0x2f, 0x53, 0x57, 0x69, 0x67, 0x56, 0x76, 0x57, 0x68, 0x2b, 0x30, 0x6a, 0x32, 0x6a, 0x4d, 0x63, 0x6a, 0x75, 0x49, 0x6a, 0x77, 0x4b, 0x58, 0x45, 0x4a, 0x73, 0x73, 0x39, 0x78, 0x70, 0x2f, 0x73, 0x53, 0x67, 0x31, 0x56, 0x68, 0x76, 0x2b, 0x6b, 0x41, 0x74, 0x65, 0x58, 0x79, 0x6a, 0x6c, 0x55, 0x62, 0x58, 0x31, 0x2f, 0x73, 0x6c, 0x51, 0x59, 0x6e, 0x63, 0x51, 0x73, 0x55, 0x6e, 0x47, 0x4f, 0x5a, 0x48, 0x75, 0x43, 0x7a, 0x6f, 0x6d, 0x36, 0x53, 0x64, 0x59, 0x49, 0x35, 0x62, 0x53, 0x49, 0x63, 0x63, 0x38, 0x2f, 0x57, 0x30, 0x59, 0x75, 0x78, 0x73, 0x51, 0x64, 0x75, 0x41, 0x4f, 0x70, 0x57, 0x4b, 0x49, 0x45, 0x50, 0x69, 0x46, 0x34, 0x31, 0x64, 0x75, 0x33, 0x30, 0x49, 0x34, 0x53, 0x6a, 0x59, 0x4e, 0x4d, 0x57, 0x79, 0x70, 0x6f, 0x4e, 0x35, 0x50, 0x43, 0x38, 0x72, 0x30, 0x65, 0x78, 0x4e, 0x4b, 0x68, 0x44, 0x45, 0x70, 0x59, 0x55, 0x71, 0x73, 0x53, 0x34, 0x2b, 0x33, 0x64, 0x48, 0x35, 0x67, 0x56, 0x6b, 0x44, 0x55, 0x74, 0x77, 0x73, 0x77, 0x53, 0x79, 0x6f, 0x31, 0x49, 0x67, 0x66, 0x64, 0x59, 0x65, 0x46, 0x52, 0x72, 0x36, 0x49, 0x77, 0x78, 0x4e, 0x68, 0x39, 0x4b, 0x42, 0x67, 0x78, 0x48, 0x56, 0x50, 0x4d, 0x33, 0x6b, 0x4c, 0x69, 0x79, 0x6b, 0x6f, 0x6c, 0x39, 0x58, 0x36, 0x53, 0x46, 0x53, 0x75, 0x48, 0x41, 0x6e, 0x4f, 0x43, 0x36, 0x70, 0x4c, 0x75, 0x43, 0x6c, 0x32, 0x50, 0x30, 0x4b, 0x35, 0x50, 0x42, 0x2f, 0x54, 0x35, 0x76, 0x79, 0x73, 0x48, 0x31, 0x50, 0x4b, 0x6d, 0x50, 0x55, 0x68, 0x72, 0x41, 0x4a, 0x51, 0x70, 0x32, 0x44, 0x74, 0x37, 0x2b, 0x6d, 0x66, 0x37, 0x2f, 0x77, 0x6d, 0x76, 0x31, 0x57, 0x31, 0x36, 0x73, 0x63, 0x31, 0x46, 0x4a, 0x43, 0x46, 0x61, 0x4a, 0x7a, 0x45, 0x4f, 0x51, 0x7a, 0x49, 0x36, 0x42, 0x41, 0x74, 0x43, 0x67, 0x6c, 0x37, 0x5a, 0x63, 0x73, 0x61, 0x46, 0x70, 0x61, 0x59, 0x65, 0x51, 0x45, 0x47, 0x67, 0x6d, 0x4a, 0x6a, 0x6d, 0x34, 0x48, 0x52, 0x42, 0x7a, 0x73, 0x41, 0x70, 0x64, 0x78, 0x58, 0x50, 0x51, 0x33, 0x33, 0x59, 0x37, 0x32, 0x43, 0x33, 0x5a, 0x69, 0x42, 0x37, 0x6a, 0x37, 0x41, 0x66, 0x50, 0x34, 0x6f, 0x37, 0x51, 0x30, 0x2f, 0x6f, 0x6d, 0x56, 0x59, 0x48, 0x76, 0x34, 0x67, 0x4e, 0x4a, 0x49, 0x77, 0x49, 0x44, 0x41, 0x51, 0x41, 0x42, 0x6f, 0x34, 0x49, 0x42, 0x31, 0x7a, 0x43, 0x43, 0x41, 0x64, 0x4d, 0x77, 0x50, 0x77, 0x59, 0x49, 0x4b, 0x77, 0x59, 0x42, 0x42, 0x51, 0x55, 0x48, 0x41, 0x51, 0x45, 0x45, 0x4d, 0x7a, 0x41, 0x78, 0x4d, 0x43, 0x38, 0x47, 0x43, 0x43, 0x73, 0x47, 0x41, 0x51, 0x55, 0x46, 0x42, 0x7a, 0x41, 0x42, 0x68, 0x69, 0x4e, 0x6f, 0x64, 0x48, 0x52, 0x77, 0x4f, 0x69, 0x38, 0x76, 0x62, 0x32, 0x4e, 0x7a, 0x63, 0x43, 0x35, 0x68, 0x63, 0x48, 0x42, 0x73, 0x5a, 0x53, 0x35, 0x6a, 0x62, 0x32, 0x30, 0x76, 0x62, 0x32, 0x4e, 0x7a, 0x63, 0x44, 0x41, 0x7a, 0x4c, 0x58, 0x64, 0x33, 0x5a, 0x48, 0x49, 0x77, 0x4e, 0x44, 0x41, 0x64, 0x42, 0x67, 0x4e, 0x56, 0x48, 0x51, 0x34, 0x45, 0x46, 0x67, 0x51, 0x55, 0x6b, 0x61, 0x53, 0x63, 0x2f, 0x4d, 0x52, 0x32, 0x74, 0x35, 0x2b, 0x67, 0x69, 0x76, 0x52, 0x4e, 0x39, 0x59, 0x38, 0x32, 0x58, 0x65, 0x30, 0x72, 0x42, 0x49, 0x55, 0x77, 0x44, 0x41, 0x59, 0x44, 0x56, 0x52, 0x30, 0x54, 0x41, 0x51, 0x48, 0x2f, 0x42, 0x41, 0x49, 0x77, 0x41, 0x44, 0x41, 0x66, 0x42, 0x67, 0x4e, 0x56, 0x48, 0x53, 0x4d, 0x45, 0x47, 0x44, 0x41, 0x57, 0x67, 0x42, 0x53, 0x49, 0x4a, 0x78, 0x63, 0x4a, 0x71, 0x62, 0x59, 0x59, 0x59, 0x49, 0x76, 0x73, 0x36, 0x37, 0x72, 0x32, 0x52, 0x31, 0x6e, 0x46, 0x55, 0x6c, 0x53, 0x6a, 0x74, 0x7a, 0x43, 0x43, 0x41, 0x52, 0x34, 0x47, 0x41, 0x31, 0x55, 0x64, 0x49, 0x41, 0x53, 0x43, 0x41, 0x52, 0x55, 0x77, 0x67, 0x67, 0x45, 0x52, 0x4d, 0x49, 0x49, 0x42, 0x44, 0x51, 0x59, 0x4b, 0x4b, 0x6f, 0x5a, 0x49, 0x68, 0x76, 0x64, 0x6a, 0x5a, 0x41, 0x55, 0x47, 0x41, 0x54, 0x43, 0x42, 0x2f, 0x6a, 0x43, 0x42, 0x77, 0x77, 0x59, 0x49, 0x4b, 0x77, 0x59, 0x42, 0x42, 0x51, 0x55, 0x48, 0x41, 0x67, 0x49, 0x77, 0x67, 0x62, 0x59, 0x4d, 0x67, 0x62, 0x4e, 0x53, 0x5a, 0x57, 0x78, 0x70, 0x59, 0x57, 0x35, 0x6a, 0x5a, 0x53, 0x42, 0x76, 0x62, 0x69, 0x42, 0x30, 0x61, 0x47, 0x6c, 0x7a, 0x49, 0x47, 0x4e, 0x6c, 0x63, 0x6e, 0x52, 0x70, 0x5a, 0x6d, 0x6c, 0x6a, 0x59, 0x58, 0x52, 0x6c, 0x49, 0x47, 0x4a, 0x35, 0x49, 0x47, 0x46, 0x75, 0x65, 0x53, 0x42, 0x77, 0x59, 0x58, 0x4a, 0x30, 0x65, 0x53, 0x42, 0x68, 0x63, 0x33, 0x4e, 0x31, 0x62, 0x57, 0x56, 0x7a, 0x49, 0x47, 0x46, 0x6a, 0x59, 0x32, 0x56, 0x77, 0x64, 0x47, 0x46, 0x75, 0x59, 0x32, 0x55, 0x67, 0x62, 0x32, 0x59, 0x67, 0x64, 0x47, 0x68, 0x6c, 0x49, 0x48, 0x52, 0x6f, 0x5a, 0x57, 0x34, 0x67, 0x59, 0x58, 0x42, 0x77, 0x62, 0x47, 0x6c, 0x6a, 0x59, 0x57, 0x4a, 0x73, 0x5a, 0x53, 0x42, 0x7a, 0x64, 0x47, 0x46, 0x75, 0x5a, 0x47, 0x46, 0x79, 0x5a, 0x43, 0x42, 0x30, 0x5a, 0x58, 0x4a, 0x74, 0x63, 0x79, 0x42, 0x68, 0x62, 0x6d, 0x51, 0x67, 0x59, 0x32, 0x39, 0x75, 0x5a, 0x47, 0x6c, 0x30, 0x61, 0x57, 0x39, 0x75, 0x63])
        }
    }
}
