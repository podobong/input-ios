import SwiftUI


class Schedule: ObservableObject {
    @Published var isValid: Bool
    @Published var description: String
    @Published var startDate: Date
    @Published var endDate: Date
    
    init(isValid: Bool, description: String, startDate: Date, endDate: Date) {
        self.isValid = isValid
        self.description = description
        self.startDate = startDate
        self.endDate = endDate
    }
}

class Major: ObservableObject {
    @Published var name: String
    @Published var schedules: [Schedule]
    
    init(name: String) {
        self.name = name
        self.schedules = []
    }
    
    init(name: String, schedules: [Schedule]) {
        self.name = name
        self.schedules = schedules
    }
}

class JH: ObservableObject {
    @Published var name: String
    @Published var majors: [Major]
    
    init(name: String) {
        self.name = name
        self.majors = []
    }
    
    init(name: String, majors: [Major]) {
        self.name = name
        self.majors = majors
    }
}

class SJ: ObservableObject {
    @Published var type: String
    @Published var jhs: [JH]
    
    init(type: String) {
        self.type = type
        self.jhs = []
    }
    
    init(type: String, jhs: [JH]) {
        self.type = type
        self.jhs = jhs
    }
}

class Univ: ObservableObject {
    @Published var name: String
    @Published var logo: String
    @Published var reviewUrl: String
    @Published var sjs: [SJ]
    
    init(name: String, logo: String, reviewUrl: String) {
        self.name = name
        self.logo = logo
        self.reviewUrl = reviewUrl
        self.sjs = []
    }
    
    init(name: String, logo: String, reviewUrl: String, sjs: [SJ]) {
        self.name = name
        self.logo = logo
        self.reviewUrl = reviewUrl
        self.sjs = sjs
    }
}

class PickerInfo: ObservableObject {
    @Published var id: UUID = UUID()
    @Published var sjNum: Int = 0 {
        willSet {
            self.jhNum = 0
            self.majorNum = 0
            self.id = UUID()
        }
    }
    @Published var jhNum: Int = 0 {
        willSet {
            self.majorNum = 0
            self.id = UUID()
        }
    }
    @Published var majorNum: Int = 0
}

class SelectedInfo: ObservableObject {
    @Published var univ: String
    @Published var sj: String
    @Published var jh: String
    @Published var major: String
    @Published var schedules: [Schedule]
    
    init(univ: String, sj: String, jh: String, major: String) {
        self.univ = univ
        self.sj = sj
        self.jh = jh
        self.major = major
        self.schedules = []
    }
    
    init(univ: String, sj: String, jh: String, major: String, schedules: [Schedule]) {
        self.univ = univ
        self.sj = sj
        self.jh = jh
        self.major = major
        self.schedules = schedules
    }
}

class SelectedInfos: ObservableObject {
    @Published var univs: [SelectedInfo]
    
    init() {
        self.univs = []
    }
    
    init(univs: [SelectedInfo]) {
        self.univs = univs
    }
}
