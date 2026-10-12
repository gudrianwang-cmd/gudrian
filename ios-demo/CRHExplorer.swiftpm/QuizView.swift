import SwiftUI

struct QuizView: View {
    @State private var index = 0
    @State private var picked: Int?
    @State private var score = 0
    @State private var finished = false

    private let questions = TrainData.questions

    var body: some View {
        NavigationStack {
            Group {
                if finished {
                    result
                } else {
                    question(questions[index])
                }
            }
            .padding()
            .navigationTitle("小测验")
            .animation(.default, value: picked)
            .animation(.default, value: index)
        }
    }

    private func question(_ q: Question) -> some View {
        VStack(alignment: .leading, spacing: 16) {
            ProgressView(value: Double(index), total: Double(questions.count))
            Text("第 \(index + 1) / \(questions.count) 题")
                .font(.caption)
                .foregroundStyle(.secondary)
            Text(q.text)
                .font(.title3.bold())

            ForEach(q.options.indices, id: \.self) { i in
                Button {
                    guard picked == nil else { return }
                    picked = i
                    if i == q.answer { score += 1 }
                } label: {
                    HStack {
                        Text(q.options[i])
                        Spacer()
                        if picked != nil, i == q.answer {
                            Image(systemName: "checkmark.circle.fill").foregroundStyle(.green)
                        } else if picked == i {
                            Image(systemName: "xmark.circle.fill").foregroundStyle(.red)
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(optionColor(i, answer: q.answer), in: RoundedRectangle(cornerRadius: 12))
                }
                .buttonStyle(.plain)
            }

            if picked != nil {
                Text(q.explain)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                Button(index + 1 < questions.count ? "下一题" : "查看成绩") {
                    if index + 1 < questions.count {
                        index += 1
                        picked = nil
                    } else {
                        finished = true
                    }
                }
                .buttonStyle(.borderedProminent)
                .frame(maxWidth: .infinity)
            }
            Spacer()
        }
    }

    private func optionColor(_ i: Int, answer: Int) -> Color {
        guard let picked else { return Color(.secondarySystemBackground) }
        if i == answer { return .green.opacity(0.18) }
        if i == picked { return .red.opacity(0.18) }
        return Color(.secondarySystemBackground)
    }

    private var result: some View {
        VStack(spacing: 16) {
            Image(systemName: score == questions.count ? "trophy.fill" : "tram.fill")
                .font(.system(size: 64))
                .foregroundStyle(score == questions.count ? .yellow : Color.crhBlue)
            Text("\(score) / \(questions.count)")
                .font(.system(size: 48, weight: .heavy, design: .rounded))
            Text(score == questions.count ? "满分！你是高铁小专家" : "再来一次，争取满分！")
                .font(.headline)
            Button("重新开始") {
                index = 0
                picked = nil
                score = 0
                finished = false
            }
            .buttonStyle(.borderedProminent)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
