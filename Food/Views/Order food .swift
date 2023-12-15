import SwiftUI

struct OrderList: View {
    @State private var basket: [Card] = []

    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(TrendingCard) { card in
                        OrderRow(card: card, addToBasket: {
                            basket.append(card)
                        })
                    }
                    .onDelete { indexSet in
                        // Delete orders
                    }
                }
                .navigationBarTitle("Orders")
                
                if !basket.isEmpty {
                    CheckoutBox(basket: $basket)
                }
            }
        }
    }
}

struct OrderRow: View {
    @State private var quantity = 1
    var card: Card
    var addToBasket: () -> Void
    
    @State private var slidingButtonOffset: CGFloat = 0
    
    var body: some View {
        HStack {
            Image(card.image)
                .resizable()
                .frame(width: 80, height: 80)
                .cornerRadius(10)
            VStack(alignment: .leading, spacing: 8) {
                Text(card.title)
                    .font(.headline)
                Text(card.descrip)
                    .font(.caption)
                    .foregroundColor(.gray)
                HStack {
                    Stepper("", value: $quantity, in: 1...10)
                        .frame(width: 80)
                        .background(Color.white)
                    Text("Qty: \(quantity)")
                        .font(.subheadline)
                        .foregroundColor(.black)
                    Spacer()
                    Button(action: {
                        if quantity > 0 {
                            addToBasket() // Add to basket action
                        }
                    }) {
                        Text("Add to Basket")
                            .font(.callout)
                            .foregroundColor(.white)
                            .padding(.vertical, 8)
                            .background(quantity > 0 ? Color.green : Color.gray) // Set your preferred color
                            .cornerRadius(5)
                    }
                }
            }
            Spacer()
            Text(card.price)
                .font(.headline)
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 10)
        .background(Color.white)
        .cornerRadius(10)
        .contextMenu {
            Button(action: {
                // Action to delete order
            }) {
                Text("Delete")
                Image(systemName: "trash")
            }
        }
        .offset(x: slidingButtonOffset)
        .gesture(DragGesture(minimumDistance: 10)
                    .onChanged { value in
                        slidingButtonOffset = value.translation.width
                    }
                    .onEnded { value in
                        if value.translation.width < -50 {
                            slidingButtonOffset = -100
                        } else {
                            slidingButtonOffset = 0
                        }
                    }
        )
    }
}

struct CheckoutBox: View {
    @Binding var basket: [Card]
    @State private var isCheckoutClicked = false
    
    var body: some View {
        VStack {
            NavigationLink(destination: DroneDeliveryView(), isActive: $isCheckoutClicked) {
                EmptyView()
            }
            Button(action: {
                isCheckoutClicked.toggle() // This will trigger the navigation
            }) {
                HStack {
                    Text("Checkout Box")
                        .font(.headline)
                    Spacer()
                    Image(systemName: "creditcard")
                }
                .padding(.vertical, 10)
                .foregroundColor(.white)
                .background(Color.green)
                .cornerRadius(10)
            }
            
            // ...rest of your code
        }
        .padding(.horizontal)
        .padding(.top, 20)
    }
}


struct OrderList_Previews: PreviewProvider {
    static var previews: some View {
        OrderList()
    }
}
