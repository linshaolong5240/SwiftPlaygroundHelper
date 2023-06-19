import Cocoa

MemoryLayoutTest()
UnsafeMutableRawPointerTest()
ArrayUnsafeMutableRawPointerTest()
ArrayUnsafeMutableRawPointerTest2()

func MemoryLayoutTest() {
    defer {
        print("\(#function) end")
    }
    print("\(#function) start")
    print("Bool")
    print("size: \(MemoryLayout<Bool>.size) bytes")
    print("alignment: \(MemoryLayout<Bool>.alignment) bytes")
    print("stride: \(MemoryLayout<Bool>.stride) bytes")
    print("Int")
    print("size: \(MemoryLayout<Int>.size) bytes")
    print("alignment: \(MemoryLayout<Int>.alignment) bytes")
    print("stride: \(MemoryLayout<Int>.stride) bytes")
    print("Float")
    print("size: \(MemoryLayout<Float>.size) bytes")
    print("alignment: \(MemoryLayout<Float>.alignment) bytes")
    print("stride: \(MemoryLayout<Float>.stride) bytes")
    print("Double")
    print("size: \(MemoryLayout<Double>.size) bytes")
    print("alignment: \(MemoryLayout<Double>.alignment) bytes")
    print("stride: \(MemoryLayout<Double>.stride) bytes")
}

func UnsafeMutableRawPointerTest() {
    defer {
        print("\(#function) end")
    }
    print("\(#function) start")
    let pointer = UnsafeMutableRawPointer.allocate(byteCount: MemoryLayout<Int>.size, alignment: MemoryLayout<Int>.alignment)
    pointer.storeBytes(of: 0xFF, as: Int.self)
    let value = pointer.load(as: Int.self)
    print(value)
}

func ArrayUnsafeMutableRawPointerTest() {
    defer {
        print("\(#function) end")
    }
    print("\(#function) start")
    let intArrayPointer = UnsafeMutableRawPointer.allocate(byteCount: MemoryLayout<Int>.size * 10, alignment: MemoryLayout<Int>.alignment)

    for i in 0..<10 {
        intArrayPointer.storeBytes(of: i, toByteOffset: MemoryLayout<Int>.stride * i, as: Int.self)
    }

    for i in 0..<10 {
        let value = intArrayPointer.load(fromByteOffset: MemoryLayout<Int>.stride * i,as: Int.self)
        print(value)
    }
}

func ArrayUnsafeMutableRawPointerTest2() {
    defer {
        print("\(#function) end")
    }
    print("\(#function) start")
    let intArrayPointer = UnsafeMutableRawPointer.allocate(byteCount: MemoryLayout<Int>.size * 10, alignment: MemoryLayout<Int>.alignment).initializeMemory(as: Int.self, to: 0)
    for i in 0..<10 {
        intArrayPointer[i] = i
    }

    for i in 0..<10 {
        let value = intArrayPointer[i]
        print(value)
    }
}
