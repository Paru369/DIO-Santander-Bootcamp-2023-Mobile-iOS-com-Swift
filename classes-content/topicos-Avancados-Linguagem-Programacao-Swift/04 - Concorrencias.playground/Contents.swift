import UIKit

//let startTime = CFAbsoluteTimeGetCurrent()
//DispatchQueue.global().sync {
//    for i in 0...10 {
//        print("Fui... \(i)")
//    }
//}
//DispatchQueue.global().sync {
//    for i in 0...10 {
//        print("Voltei... \(i)")
//    }
//}
//
//DispatchQueue.main.sync {
//    // Executando na main thread
//}

func fetchUserId(from server: String) async -> Int {
    if server == "primary" {
        return 97
    }
    return 501
}

func fetchUsername(from server: String) async -> String {
    let userId = await fetchUserId(from: server)
    if userId == 501 {
        return "João Souza"
    }
    return "Convidado"
}

func connectUser(to server: String) async {
    async let userId = fetchUserId(from: server)
    async let username = fetchUsername(from: server)
    let greeting = await "Olá \(username), user ID \(userId)"
    print(greeting)
}

Task {
    await connectUser(to: "primary")
}

let gallery = [
    "Summer Vaction": ["praia.png", "campo.png", "zoo.png", "shopping.png"],
    "Road Trip": ["paris.png", "roma.png", "bahia.png", "madri.png"]
]
func listPhotos(inGallery name: String) async -> [String] {
    // Sumulação de rede assíncrono
    do {
        try await Task.sleep(until: .now + .seconds(2), clock: .continuous)
    } catch {}
    return gallery[name] ?? []
}

Task {
    let photNames = await listPhotos(inGallery: "Summer Vaction")
    let sortedNames = photNames.sorted()
    let name = sortedNames[0]
}

func add(_ photo: String, toGallery: String) {
    print("Adicionando a foto \(photo) na galeria \(toGallery)")
}
func remove(_ photo: String, fromGallery: String) {
    print("Remove a foto \(photo) na galeria \(fromGallery)")
}
Task {
    let firstPhoto = await listPhotos(inGallery: "Summer Vaction")[0]
    add(firstPhoto, toGallery: "Road Trip")
    // Neste ponto, firstPhoto está temporariamente em ambas as galerias
    remove(firstPhoto, fromGallery: "Summer Vaction")
}

func move(_ photoName: String, from source: String, to destination: String) {
    add(photoName, toGallery: destination)
    remove(photoName, fromGallery: source)
}

Task {
    let handle = FileHandle.standardInput
    for try await line in handle.bytes.lines {
        print(line)
    }
}

func downloadPhoto(named: String) async -> Data {
    // Simular chamada ao backend
    do {
        try await Task.sleep(until: .now + .seconds(2), clock: .continuous)
    } catch {}
    return Data()
}
Task {
    let photoNames = await listPhotos(inGallery: "Summer Vaction")
    
    async let firstPhoto = downloadPhoto(named: photoNames[0])
    async let secondPhoto = downloadPhoto(named: photoNames[1])
    async let thirdPhorto = downloadPhoto(named: photoNames[2])
    
    let photos = await [firstPhoto, secondPhoto, thirdPhorto]
}

Task {
    await withTaskGroup(of: Data.self) { taskGroup in
        let photoNames = await listPhotos(inGallery: "Summer Vaction")
        for name in photoNames {
            taskGroup.addTask { await downloadPhoto(named: name) }
        }
    }
}

Task {
    let photo = await listPhotos(inGallery: "Summer Vaction")[0]
    let handle = Task {
        return await downloadPhoto(named: photo)
    }
    let result = await handle.value
}

actor TemperatureLogger {
    let label: String
    var measurements: [Int]
    private(set) var max: Int
    
    init(label: String, measurement: Int) {
        self.label = label
        self.measurements = [measurement]
        self.max = measurement
    }
}

Task {
    let logger = TemperatureLogger(label: "Ao ar livre", measurement: 25)
    print(await logger.max)
}

extension TemperatureLogger {
    func update(with measurement: Int) {
        measurements.append(measurement)
        if measurement > max {
            max = measurement
        }
    }
}

struct TemperatureReading: Sendable {
    var measurement: Int
}
extension TemperatureLogger {
    func addReading(from reading: TemperatureReading) {
        measurements.append(reading.measurement)
    }
}
Task {
    let logger = TemperatureLogger(label: "Chaleira", measurement: 85)
    let reading = TemperatureReading(measurement: 45)
    await logger.addReading(from: reading)
}
