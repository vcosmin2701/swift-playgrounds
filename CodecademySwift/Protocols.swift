protocol Viewer {
    func login()
    func logout()
    func showContent()
}

protocol Creator: Viewer {
    func uploadNewContent(name: String)
}

struct VideoContentCreator: Creator {
    func login() {
        print("Successfully logged in")
    }

    func logout() {
        print("Successfully logged out")
    }

    func showContent() {
        print("Here are the new videos")
    }

    func uploadNewContent(name: String) {
        print("Thanks for uploading your new video: \(name)!")
    }
}

// protocol extension to provide default implementation

protocol PenSelling {
    var penPrice: Int { get }
    func price(withPenCount count: Int) -> Int
}

extension PenSelling {
    var penPrice: Int {
        return 2
    }

    func price(withPenCount count: Int) -> Int {
        return penPrice * count
    }
}

struct Bookstore: PenSelling {
    let name: String
}

let miasStore = Bookstore(name: "Mia's Books")
print(miasStore.price(withPenCount: 10))

struct ArtStore: PenSelling {
    let name: String
    var penPrice: Int = 5
}

let noahStore = ArtStore(name: "Noah's Art Supplies")
print(noahStore.price(withPenCount: 10))