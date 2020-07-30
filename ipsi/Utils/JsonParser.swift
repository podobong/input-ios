import SwiftyJSON


func parseUnivList(json: JSON) -> [Univ] {
    var univs: [Univ] = []
    
    for univ in json.arrayValue {
        let dict: [String: JSON] = univ.dictionaryValue
        let name: String = dict["name"]!.rawString()!
        let logo: String = dict["logo"]!.rawString()!
        let reviewUrl: String = dict["review_url"]!.rawString()!
        var sjs: [SJ] = []
        for sj in dict["sjs"]!.arrayValue {
            let dict: [String: JSON] = sj.dictionaryValue
            let type: String = dict["sj"]!.rawString()!
            var jhs: [JH] = []
            for jh in dict["jhs"]!.arrayValue {
                let dict: [String: JSON] = jh.dictionaryValue
                let name: String = dict["name"]!.rawString()!
                var majors: [Major] = []
                for major in dict["majors"]!.arrayValue {
                    majors.append(Major(name: major.dictionaryValue["name"]!.rawString()!))
                }
                jhs.append(JH(name: name, majors: majors))
            }
            sjs.append(SJ(type: type, jhs: jhs))
        }
        univs.append(Univ(name: name, logo: logo, reviewUrl: reviewUrl, sjs: sjs))
    }
    return univs
}

func parseSelectedList(json: JSON) -> [Univ] {
    var univs: [Univ] = []
    
    for univ in json.arrayValue {
        let dict: [String: JSON] = univ.dictionaryValue
        let name: String = dict["name"]!.rawString()!
        let logo: String = dict["logo"]!.rawString()!
        let reviewUrl: String = dict["review_url"]!.rawString()!
        var sjs: [SJ] = []
        for sj in dict["sjs"]!.arrayValue {
            let dict: [String: JSON] = sj.dictionaryValue
            let type: String = dict["sj"]!.rawString()!
            var jhs: [JH] = []
            for jh in dict["jhs"]!.arrayValue {
                let dict: [String: JSON] = jh.dictionaryValue
                let name: String = dict["name"]!.rawString()!
                var majors: [Major] = []
                for major in dict["majors"]!.arrayValue {
                    let dict: [String: JSON] = major.dictionaryValue
                    let name: String = dict["name"]!.rawString()!
                    var schedules: [Schedule] = []
                    for schedule in dict["schedules"]!.arrayValue {
                        let startDate: DateFormatter = DateFormatter()
                        startDate.locale = Locale(identifier: "ko_KR")
                        startDate.dateFormat = "yyyy-MM-dd-HH-mm-ss"
                        let endDate: DateFormatter = DateFormatter()
                        endDate.locale = Locale(identifier: "ko_KR")
                        endDate.dateFormat = "yyyy-MM-dd-HH-mm-ss"
                        if schedule["is_valid"].intValue == 1 {
                            let dict: [String: JSON] = schedule.dictionaryValue
                            schedules.append(Schedule(
                                description: dict["description"]!.rawString()!,
                                startDate: startDate.date(from: dict["start_date"]!.rawString()!) ?? Date(),
                                endDate: endDate.date(from: dict["end_date"]!.rawString()!) ?? Date()
                            ))
                        }
                    }
                    majors.append(Major(name: name, schedules: schedules))
                }
                jhs.append(JH(name: name, majors: majors))
            }
            sjs.append(SJ(type: type, jhs: jhs))
        }
        univs.append(Univ(name: name, logo: logo, reviewUrl: reviewUrl, sjs: sjs))
    }
    return univs
}

func seperateMajors(univs: [Univ]) -> [SelectedInfo] {
    var infos: [SelectedInfo] = []
    for univ in univs {
        for sj in univ.sjs {
            for jh in sj.jhs {
                for major in jh.majors {
                    infos.append(SelectedInfo(
                        univ: univ.name,
                        logo: univ.logo,
                        reviewUrl: univ.reviewUrl,
                        sj: sj.type,
                        jh: jh.name,
                        major: major.name,
                        schedules: major.schedules
                    ))
                }
            }
        }
    }
    return infos
}
