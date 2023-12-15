import SwiftUI

struct DroneDeliveryView: View {
    @State private var isPresentingPaymentMethods = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // ... Existing code ...

                Text("Types of Delivery Drones")
                    .font(.title)

                DroneTypeButton(type: "Magic DII Drone")
                    .onTapGesture {
                        isPresentingPaymentMethods.toggle()
                    }

                // ... Add other DroneTypeButtons ...

                Text("Subscription Plans")
                    .font(.title)

                SubscriptionPlanView(name: "Standard with Ads", price: "$6.99", description: "Due to licensing restrictions some titles are inaccessible")
                    .onTapGesture {
                        isPresentingPaymentMethods.toggle()
                    }

                // ... Add other SubscriptionPlanViews ...

            }
            .padding()
            .fullScreenCover(isPresented: $isPresentingPaymentMethods) {
                PaymentMethodsView()
            }
        }
    }
}

struct DroneTypeButton: View {
    var type: String

    var body: some View {
        HStack {
            Text(type)
                .font(.headline)
            Spacer()
            Text("Select")
        }
        .padding()
        .foregroundColor(.white)
        .background(Color.blue) // Customize the button color
        .cornerRadius(10)
    }
}

struct SubscriptionPlanView: View {
    var name: String
    var price: String
    var description: String

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(name)
                .font(.headline)
            HStack {
                Text("Monthly price: \(price)")
                Spacer()
                Text(description)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .background(Color.gray.opacity(0.2))
        .cornerRadius(10)
    }
}

// Rest of the code...

struct DroneDeliveryView_Previews: PreviewProvider {
    static var previews: some View {
        DroneDeliveryView()
    }
}
