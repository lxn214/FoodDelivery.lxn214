import SwiftUI
import MapKit

struct FoodItem: Identifiable {
    let id = UUID()
    let name: String
}

struct CheckOut: View {
    @State private var selectedFoodItems: [FoodItem] = []
    
    var body: some View {
        ScrollView {
            ZStack {
                Color.purple
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                    .edgesIgnoringSafeArea(.all)
                    .cornerRadius(0)
                    .offset(y: -UIScreen.main.bounds.height * 0.25)
                
                VStack {
                    HStack {
                        Text("Order")
                            .bold()
                            .font(.title)
                        Spacer()
                        Text("")
                            .font(.title2)
                    }
                    .padding(.all, 20)
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width)
                    
                    RoundedMapView()
                        .frame(width: UIScreen.main.bounds.width - 40, height: 400)
                    
                    VStack {
                        Text("Food Items")
                            .font(.title)
                            .padding(.top, 20)
                        
                        ForEach(selectedFoodItems) { item in
                            Text(item.name)
                        }
                    }
                    .padding(.top, 20)
                    
                    DeliveryOptionsView()
                        .padding(.top, 20)
                }
                .padding(.top, UIScreen.main.bounds.height * 0.25)
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct DeliveryOptionsView: View {
    var body: some View {
        VStack {
            Text("Delivery Options")
                .font(.title)
            
            DeliveryPlanView(address: "22-24 Basil St, London SW3 1AT", duration: "9 min", distance: "1.0 mile")
            
            DeliveryPlanView(address: "Hertford St, London", duration: "12 min", distance: "1.5 miles")
            
            Button("Order") {
                // Perform order processing here
            }
            .padding()
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
    }
}

struct DeliveryPlanView: View {
    let address: String
    let duration: String
    let distance: String
    
    var body: some View {
        VStack {
            Text(address)
            Text("Duration: \(duration)")
            Text("Distance: \(distance)")
        }
        .padding()
        .background(Color.gray.opacity(0.2))
        .cornerRadius(10)
        .padding(.vertical, 5)
    }
}

struct RoundedMapView: UIViewRepresentable {
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView(frame: .zero)
        mapView.layer.cornerRadius = 15
        mapView.layer.borderWidth = 2
        mapView.layer.borderColor = UIColor.purple.cgColor
        mapView.showsUserLocation = true
        
        let location = CLLocationCoordinate2D(latitude: 51.5074, longitude: -0.1278)
        let region = MKCoordinateRegion(center: location, span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
        mapView.setRegion(region, animated: true)
        
        return mapView
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {
        // Update the map view here if needed
    }
}

struct CheckOut_Previews: PreviewProvider {
    static var previews: some View {
        CheckOut()
    }
}
