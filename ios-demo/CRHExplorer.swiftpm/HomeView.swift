import SwiftUI

struct HomeView: View {
    private let columns = [GridItem(.flexible(), spacing: 12), GridItem(.flexible(), spacing: 12)]

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    hero
                    Text("核心数据")
                        .font(.headline)
                    LazyVGrid(columns: columns, spacing: 12) {
                        ForEach(TrainData.specs) { spec in
                            SpecCard(spec: spec)
                        }
                    }
                    Text("车厢编组")
                        .font(.headline)
                    ConsistView()
                }
                .padding()
            }
            .navigationTitle("高铁探秘")
        }
    }

    private var hero: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("CRH2A 型")
                .font(.system(size: 34, weight: .heavy, design: .rounded))
            Text("和谐号动车组 · 中国第一代高速动车组之一")
                .font(.subheadline)
                .opacity(0.9)
            TrainShape()
                .fill(.white)
                .frame(height: 54)
                .padding(.top, 8)
        }
        .foregroundStyle(.white)
        .padding(20)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            LinearGradient(colors: [.crhBlue, Color(red: 0.12, green: 0.52, blue: 0.85)],
                           startPoint: .topLeading, endPoint: .bottomTrailing),
            in: RoundedRectangle(cornerRadius: 20, style: .continuous)
        )
    }
}

struct SpecCard: View {
    let spec: Spec

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack(alignment: .firstTextBaseline, spacing: 4) {
                Text(spec.value)
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .monospacedDigit()
                Text(spec.unit)
                    .font(.subheadline.weight(.semibold))
                    .foregroundStyle(.secondary)
            }
            Text(spec.label)
                .font(.footnote)
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(14)
        .background(Color(.secondarySystemBackground), in: RoundedRectangle(cornerRadius: 14))
    }
}

/// 8 节车厢示意：M = 动车（有电机），T = 拖车
struct ConsistView: View {
    private let cars = ["T", "M", "M", "T", "T", "M", "M", "T"]

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 4) {
                ForEach(Array(cars.enumerated()), id: \.offset) { index, car in
                    Text(car)
                        .font(.caption.bold())
                        .frame(maxWidth: .infinity, minHeight: 32)
                        .foregroundStyle(car == "M" ? .white : Color.crhBlue)
                        .background(car == "M" ? Color.crhBlue : Color.crhLight,
                                    in: RoundedRectangle(cornerRadius: index == 0 || index == 7 ? 12 : 4))
                }
            }
            Text("M 动车：装有牵引电机　T 拖车：没有电机，被带着跑")
                .font(.caption)
                .foregroundStyle(.secondary)
        }
    }
}

/// 简化的流线型车头侧影
struct TrainShape: Shape {
    func path(in rect: CGRect) -> Path {
        var p = Path()
        let w = rect.width, h = rect.height
        p.move(to: CGPoint(x: 0, y: h))
        p.addLine(to: CGPoint(x: 0, y: h * 0.25))
        p.addQuadCurve(to: CGPoint(x: w * 0.06, y: 0), control: CGPoint(x: 0, y: 0))
        p.addLine(to: CGPoint(x: w * 0.68, y: 0))
        p.addQuadCurve(to: CGPoint(x: w, y: h * 0.85), control: CGPoint(x: w * 0.96, y: h * 0.05))
        p.addLine(to: CGPoint(x: w, y: h))
        p.closeSubpath()
        // 车窗
        for i in 0..<9 {
            let x = w * 0.05 + CGFloat(i) * w * 0.065
            p.addRoundedRect(in: CGRect(x: x, y: h * 0.25, width: w * 0.045, height: h * 0.25),
                             cornerSize: CGSize(width: 3, height: 3))
        }
        return p
    }
}
