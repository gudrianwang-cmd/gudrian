import Foundation

struct Spec: Identifiable {
    let id = UUID()
    let value: String
    let unit: String
    let label: String
}

struct Fact: Identifiable {
    let id = UUID()
    let icon: String
    let title: String
    let summary: String
    let detail: String
}

struct Question: Identifiable {
    let id = UUID()
    let text: String
    let options: [String]
    let answer: Int
    let explain: String
}

enum TrainData {
    static let specs: [Spec] = [
        Spec(value: "250", unit: "km/h", label: "设计时速"),
        Spec(value: "8", unit: "节", label: "编组（4动4拖）"),
        Spec(value: "610", unit: "人", label: "定员"),
        Spec(value: "4800", unit: "kW", label: "牵引功率")
    ]

    static let facts: [Fact] = [
        Fact(icon: "calendar",
             title: "什么时候开始跑？",
             summary: "2007 年投入运营",
             detail: "2007 年 4 月 18 日，全国铁路第六次大提速，CRH2A 等“和谐号”动车组正式载客运营，中国从此进入动车时代。"),
        Fact(icon: "building.2",
             title: "谁造的？",
             summary: "青岛四方制造",
             detail: "CRH2A 引进日本川崎重工 E2-1000 型新干线技术，由中国南车青岛四方机车车辆公司消化吸收、国产化制造。"),
        Fact(icon: "bolt.fill",
             title: "靠什么开动？",
             summary: "电力驱动",
             detail: "列车通过车顶的受电弓从接触网取得 25 kV 交流电，再由牵引变流器驱动分布在 4 节动车上的电机。"),
        Fact(icon: "arrow.left.and.right",
             title: "有多长？",
             summary: "约 201 米",
             detail: "8 节车厢连起来大约 201 米，差不多是两个足球场那么长。两列重联时可以组成 16 节编组。"),
        Fact(icon: "wind",
             title: "车头为什么尖尖的？",
             summary: "减小空气阻力",
             detail: "流线型车头能让空气顺滑地分开，减少阻力和噪音，还能减轻进出隧道时的“隧道微气压波”。"),
        Fact(icon: "leaf.fill",
             title: "刹车也能发电？",
             summary: "再生制动",
             detail: "减速时，电机会变成发电机，把列车的动能转化成电能送回电网，既节能又减少闸片磨损。")
    ]

    static let questions: [Question] = [
        Question(text: "CRH2A 的设计时速是多少？",
                 options: ["120 km/h", "250 km/h", "350 km/h", "600 km/h"],
                 answer: 1,
                 explain: "CRH2A 设计时速 250 km/h，日常运营时速约 200 km/h。"),
        Question(text: "一列 CRH2A 标准编组有几节车厢？",
                 options: ["4 节", "6 节", "8 节", "16 节"],
                 answer: 2,
                 explain: "标准编组 8 节：4 节动车 + 4 节拖车。"),
        Question(text: "CRH2A 从哪里获得电能？",
                 options: ["车上的柴油机", "车顶的受电弓", "大号电池", "太阳能板"],
                 answer: 1,
                 explain: "受电弓贴着接触网滑动，把 25 kV 交流电送进列车。"),
        Question(text: "CRH2A 是哪一年开始载客运营的？",
                 options: ["1997 年", "2003 年", "2007 年", "2017 年"],
                 answer: 2,
                 explain: "2007 年第六次大提速时投入运营。"),
        Question(text: "车头做成流线型，主要是为了？",
                 options: ["好看", "减小空气阻力", "多装乘客", "方便停车"],
                 answer: 1,
                 explain: "流线型能减小空气阻力和噪音。")
    ]
}
