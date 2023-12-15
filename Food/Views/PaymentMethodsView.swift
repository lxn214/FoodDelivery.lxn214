import SwiftUI
import MapKit

struct DeliveryPendingView: View {
    var body: some View {
        VStack {
            Text("Delivery on the Way")
                .font(.title)
                .padding()
            
            Spacer()
        }
    }
}

struct PaymentMethodsView: View {
    @State private var fullName = ""
    @State private var address = ""
    @State private var creditCardNumber = ""
    @State private var cardExpiration = ""
    @State private var cvv = ""
    @State private var isCompleteOrderClicked = false
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Payment Methods")
                    .font(.title)
                    .padding()
                
                Form {
                    Section(header: Text("Billing Information")) {
                        TextField("Full Name", text: $fullName)
                        TextField("Address", text: $address)
                        TextField("Credit Card Number", text: $creditCardNumber)
                        HStack {
                            TextField("MM / YYYY", text: $cardExpiration)
                                .keyboardType(.numberPad)
                            TextField("CVV", text: $cvv)
                                .keyboardType(.numberPad)
                        }
                    }
                    
                    Section {
                        NavigationLink(destination: CheckOut(), isActive: $isCompleteOrderClicked) {
                            EmptyView()
                        }
                        
                        NavigationLink(destination: DeliveryPendingView(), isActive: $isCompleteOrderClicked) {
                            Text("Complete Order")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.purple)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                    }
                }
                .padding(.top, 20)
                
                // MapKit view added here
                MapView()
                    .frame(height: 200)
                
                // NavigationLink back to HomeView
                NavigationLink(destination: HomeView()) {
                    Text("Back to Home")
                        .font(.headline)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 20)
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .padding(.top, 20)
                }
            }
        }
    }
}

struct PaymentMethodsView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentMethodsView()
    }
}

struct MapView: UIViewRepresentable {
    func makeUIView(context: Context) -> MKMapView {
        MKMapView()
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        // Update the map view if needed
    }
}
