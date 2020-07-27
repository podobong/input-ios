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

class Univs: ObservableObject {
    @Published var univs: [Univ]
    
    init() {
        self.univs = []
    }
    
    init(univs: [Univ]) {
        self.univs = univs
    }
}
