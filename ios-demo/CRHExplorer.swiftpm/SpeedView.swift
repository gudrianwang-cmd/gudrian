import SwiftUI

/// 拖动油门，看看从北京到上海（约 1318 km）要跑多久
struct SpeedView: View {
    @State private var speed: Double = 200
    @State private var offset: CGFloat = 0

    private let distance = 1318.0

    private var hours: Double { distance / max(speed, 1) }

    var body: some View {
        NavigationStack {
            VStack(spacing: 28) {
                Gauge(value: speed, in: 0...250) {
                    Text("km/h")
                } currentValueLabel: {
                    Text("\(Int(speed))")
                        .monospacedDigit()
                }
                .gaugeStyle(.accessoryCircular)
                .scaleEffect(2.4)
                .tint(Gradient(colors: [.green, .yellow, .orange, .red]))
                .frame(height: 150)

                track

                VStack(alignment: .leading, spacing: 8) {
                    Text("油门").font(.headline)
                    Slider(value: $speed, in: 0...250, step: 10)
                    HStack {
                        Text("0")
                        Spacer()
                        Text("设计时速 250")
                    }
                    .font(.caption)
                    .foregroundStyle(.secondary)
                }

                VStack(spacing: 4) {
                    Text("北京 → 上海 约 \(Int(distance)) km")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                    Text(speed == 0 ? "列车停着呢" : String(format: "大约需要 %.1f 小时", hours))
                        .font(.title2.bold())
                        .monospacedDigit()
                }
                Spacer()
            }
            .padding()
            .navigationTitle("开动列车")
            .task { await run() }
        }
    }

    private var track: some View {
        GeometryReader { geo in
            ZStack(alignment: .leading) {
                Rectangle()
                    .fill(Color.secondary.opacity(0.3))
                    .frame(height: 3)
                    .offset(y: 18)
                TrainShape()
                    .fill(Color.crhBlue)
                    .frame(width: 120, height: 34)
                    .offset(x: offset.truncatingRemainder(dividingBy: geo.size.width + 120) - 120)
            }
        }
        .frame(height: 40)
        .clipped()
    }

    @MainActor
    private func run() async {
        while !Task.isCancelled {
            try? await Task.sleep(for: .milliseconds(16))
            offset += CGFloat(speed) / 25
        }
    }
}
