import SwiftUI

struct FactsView: View {
    var body: some View {
        NavigationStack {
            List(TrainData.facts) { fact in
                NavigationLink {
                    FactDetailView(fact: fact)
                } label: {
                    HStack(spacing: 14) {
                        Image(systemName: fact.icon)
                            .font(.title3)
                            .foregroundStyle(Color.crhBlue)
                            .frame(width: 40, height: 40)
                            .background(Color.crhLight, in: RoundedRectangle(cornerRadius: 10))
                        VStack(alignment: .leading, spacing: 2) {
                            Text(fact.title).font(.body.weight(.semibold))
                            Text(fact.summary).font(.subheadline).foregroundStyle(.secondary)
                        }
                    }
                    .padding(.vertical, 4)
                }
            }
            .navigationTitle("知识卡")
        }
    }
}

struct FactDetailView: View {
    let fact: Fact

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Image(systemName: fact.icon)
                    .font(.system(size: 44))
                    .foregroundStyle(Color.crhBlue)
                Text(fact.summary)
                    .font(.title.bold())
                Text(fact.detail)
                    .font(.body)
                    .lineSpacing(6)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
        }
        .navigationTitle(fact.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}
