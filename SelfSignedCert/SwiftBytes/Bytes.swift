import Foundation

public class Bytes {
    static func bits(_ eightBits : UInt8) -> [Bool] {
        var result : [Bool] = []
        var mask = UInt8(0b10000000)
        for _ in 0..<8 {
            result.append((eightBits & mask) != 0)
            mask >>= 1
        }
        return result
    }

    static func nibbles(_ twoNibbles : UInt8) -> [UInt8] {
        let left = twoNibbles >> 4
        let right = twoNibbles & 0x0F
        return [left, right]
    }

    static func bytes(_ twoBytes : UInt16) -> [UInt8] {
        let left = UInt8(twoBytes >> 8)
        let right = UInt8(twoBytes & 0xFF)
        return [left, right]
    }

    static func bytes(_ fourBytes : UInt32) -> [UInt8] {
        let b0 = UInt8(fourBytes >> 24)
        let b1 = UInt8((fourBytes >> 16) & 0xFF)
        let b2 = UInt8((fourBytes >> 8) & 0xFF)
        let b3 = UInt8((fourBytes) & 0xFF)
        return [b0, b1, b2, b3]
    }

    static func bytes(_ eightBytes : UInt64) -> [UInt8] {
        let b0 = UInt8(eightBytes >> 56)
        let b1 = UInt8((eightBytes >> 48) & 0xFF)
        let b2 = UInt8((eightBytes >> 40) & 0xFF)
        let b3 = UInt8((eightBytes >> 32) & 0xFF)
        let b4 = UInt8((eightBytes >> 24) & 0xFF)
        let b5 = UInt8((eightBytes >> 16) & 0xFF)
        let b6 = UInt8((eightBytes >> 8) & 0xFF)
        let b7 = UInt8((eightBytes) & 0xFF)
        return [b0, b1, b2, b3, b4, b5, b6, b7]
    }

    static func concatenateBits(_ eightBits : Bool...)  -> UInt8 {
        return concatenateBits(eightBits)
    }

    static func concatenateBits(_ eightBits : [Bool]) -> UInt8 {
        var result : UInt8 = 0
        for bit in eightBits {
            result <<= 1
            if (bit) {
                result = result | 1
            }
        }
        return result;
    }

    static func concatenateNibbles(_ left : UInt8, _ right : UInt8) -> UInt8 {
        return left << 4 | right
    }

    static func concatenateBytes(_ left : UInt8, _ right : UInt8) -> UInt16 {
        return UInt16(left) << 8 | UInt16(right)
    }

    static func concatenateBytes(_ b0 : UInt8, _ b1 : UInt8, _ b2 : UInt8, _ b3 : UInt8) -> UInt32 {
        var result : UInt32 = 0
        result = result | UInt32(b0) << 24
        result = result | UInt32(b1) << 16
        result = result | UInt32(b2) << 8
        result = result | UInt32(b3)
        return result
    }

    static func concatenateBytes(
            _ b0 : UInt8, _ b1 : UInt8, _ b2 : UInt8, _ b3 : UInt8,
            _ b4 : UInt8, _ b5 : UInt8, _ b6 : UInt8, _ b7 : UInt8) -> UInt64 {
        var result : UInt64 = 0
        result = result | UInt64(b0) << 56
        result = result | UInt64(b1) << 48
        result = result | UInt64(b2) << 40
        result = result | UInt64(b3) << 32
        result = result | UInt64(b4) << 24
        result = result | UInt64(b5) << 16
        result = result | UInt64(b6) << 8
        result = result | UInt64(b7)
        return result
    }

    static func unsigned(_ byte: Int8) -> UInt8 {
        return UInt8(bitPattern: byte)
    }

    static func unsigned(_ int16: Int16) -> UInt16 {
        return UInt16(bitPattern: int16)
    }

    static func unsigned(_ int32: Int32) -> UInt32 {
        return UInt32(bitPattern: int32)
    }

    static func unsigned(_ int64: Int64) -> UInt64 {
        return UInt64(bitPattern: int64)
    }

    static func unsigned(_ bytes : [Int8]) -> [UInt8] {
        return bytes.map{ unsigned($0) }
    }

    static func signed(_ byte : UInt8) -> Int8 {
        return Int8(bitPattern: byte)
    }

    static func signed(_ uint16: UInt16) -> Int16 {
        return Int16(bitPattern: uint16)
    }

    static func signed(_ uint32: UInt32) -> Int32 {
        return Int32(bitPattern: uint32)
    }

    static func signed(_ uint64: UInt64) -> Int64 {
        return Int64(bitPattern: uint64)
    }

    static func signed(_ bytes: [UInt8]) -> [Int8] {
        return bytes.map{ signed($0) }
    }
}

extension Data {
    public var bytes: [UInt8] {
        var result: [UInt8] = [UInt8](repeating: 0, count: self.count)
        (self as NSData).getBytes(&result, length:self.count)
        return result
    }
}
