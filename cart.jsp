<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/cart.css">
    <title>Your Cart</title>
</head>
<body>
    <!-- Cart Section -->
    <section class="cart" id="cart">
        <div class="heading">
            <a href="main.jsp"> <i class="fa fa-home"></i></a>
            <h1>Your Cart</h1>
        </div>
        <ul id="cart-items">
            <!-- Cart items will be dynamically inserted here -->
            <c:forEach var="item" items="${cartItems}">
                <li class="cart-item">
                    ${item.name} - Rs.${item.price}
                    <button class="remove-item" data-id="${item.id}">Remove</button>
                </li>
            </c:forEach>
        </ul>
        <div class="cart-summary">
            <p>Total: Rs. <span id="cart-total"><c:out value="${totalPrice}"/></span></p>
            <button id="checkout-button">Checkout</button>
        </div>
    </section>
    
    <script src="cart.js"></script>
</body>
</html>
