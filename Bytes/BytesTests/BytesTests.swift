import XCTest
import Bytes

class BytesTest: XCTestCase {

    func testDecompositionOfByteIntoBits() {
        let eightBits = bits(0b10101010)
        XCTAssertEqual(eightBits, [true, false, true, false, true, false, true, false])
    }

    func testDecompositionOfByteIntoNibbles() {
        XCTAssertEqual(nibbles(0b1010_0101), [0b1010, 0b0101]);
    }

    func testDecompositionOfShortIntoBytes() {
        XCTAssertEqual(bytes(UInt16(0b10101010_01010101)), [0b10101010, 0b01010101])
    }

    func testDecompositionOfUInt32IntoBytes() {
        let uint32: UInt32 = 0xF00FA00A
        XCTAssertEqual(bytes(uint32), [0xF0, 0x0F, 0xA0, 0x0A])
    }

    func testDecompositionOfUInt64IntoBytes() {
        let uint64: UInt64 = 0xF00FA00AB00BC00C
        XCTAssertEqual(
            bytes(uint64),
            [0xF0, 0x0F, 0xA0, 0x0A, 0xB0, 0x0B, 0xC0, 0x0C]
        )
    }

    func testConcatenationOfBitsIntoByte() {
        let eightBits = [true, false, true, false, true, false, true, false]
        XCTAssertEqual(concatenateBits(eightBits), UInt8(0b10101010))
    }

    func testConcatenationOfNibblesIntoByte() {
        let left = UInt8(0b1010)
        let right = UInt8(0b0101)
        XCTAssertEqual(concatenateNibbles(left, right), UInt8(0b1010_0101))
    }

    func testConcatenationOfBytesIntoShort() {
        let left = UInt8(0b10101010)
        let right = UInt8(0b01010101)
        XCTAssertEqual(concatenateBytes(left, right), UInt16(0b10101010_01010101))
    }

    func testConcatenationOfBytesIntoUInt32() {
        let b0 = UInt8(0xF0)
        let b1 = UInt8(0x0F)
        let b2 = UInt8(0xA0)
        let b3 = UInt8(0x0A)
        let expected: UInt32 = 0xF00FA00A
        XCTAssertEqual(concatenateBytes(b0, b1, b2, b3), expected)
    }

    func testConcatenationOfBytesIntoUInt64() {
        let b0 = UInt8(0xF0)
        let b1 = UInt8(0x0F)
        let b2 = UInt8(0xA0)
        let b3 = UInt8(0x0A)
        let b4 = UInt8(0xB0)
        let b5 = UInt8(0x0B)
        let b6 = UInt8(0xC0)
        let b7 = UInt8(0x0C)
        let expected: UInt64 = 0xF00FA00AB00BC00C
        XCTAssertEqual(concatenateBytes(b0, b1, b2, b3, b4, b5, b6, b7), expected)
    }

    func testUnsignedByte() {
        let signed = Int8(bitPattern: 0xFF)
        XCTAssertEqual(unsigned(signed), UInt8(0xFF))
    }

    func testUnsignedInt32() {
        let signed = Int32(bitPattern: 0xF00FA00A)
        let expected: UInt32 = 0xF00FA00A
        XCTAssertEqual(unsigned(signed), expected)
    }

    func testUnsignedInt64() {
        let signed = Int64(bitPattern: 0xF00FA00AB00BC00C)
        let expected: UInt64 = 0xF00FA00AB00BC00C
        XCTAssertEqual(unsigned(signed), expected)
    }

    func testUnsignedArray() {
        let signed = [Int8(bitPattern: 0xF0), Int8(bitPattern: 0x0F)]
        XCTAssertEqual(unsigned(signed), [0xF0, 0x0F])
    }

    func testSignedByte() {
        let unsigned = UInt8(0xFF)
        XCTAssertEqual(signed(unsigned), Int8(bitPattern: 0xFF))
    }

    func testSignedInt32() {
        let unsigned: UInt32 = 0xF00FA00A
        XCTAssertEqual(signed(unsigned), Int32(bitPattern: 0xF00FA00A))
    }

    func testSignedInt64() {
        let unsigned: UInt64 = 0xF00FA00AB00BC00C
        XCTAssertEqual(signed(unsigned), Int64(bitPattern: 0xF00FA00AB00BC00C))
    }

    func testSignedArray() {
        let unsigned: [UInt8] = [0xF0, 0x0F]
        XCTAssertEqual(signed(unsigned), [signed(0xF0), signed(0x0F)])
    }

    func testConversionToNSData() {
        let bytes: [UInt8] = [1, 2, 3]
        let data = NSData(bytes: bytes)
        XCTAssertEqual(data, NSData(bytes: bytes, length: Int(bytes.count)))
    }

    func testConversionFromNSData() {
        let bytes: [UInt8] = [1, 2, 3]
        let data = NSData(bytes: bytes)
        XCTAssertEqual(data.bytes, bytes)
    }
}
