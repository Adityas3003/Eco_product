// js/cart.js
document.addEventListener('DOMContentLoaded', () => {
    const cartItemsList = document.getElementById('cart-items');
    const cartTotal = document.getElementById('cart-total');
    const cart = JSON.parse(localStorage.getItem('cart')) || [];

    function updateCart() {
        cartItemsList.innerHTML = '';
        let total = 0;

        cart.forEach(item => {
            const li = document.createElement('li');
            li.className = 'cart-item';
            li.innerHTML = `${item.name} - Rs.${item.price.toFixed(2)} <button class="remove-item" data-id="${item.id}">Remove</button>`;
            cartItemsList.appendChild(li);
            total += item.price;
        });

        cartTotal.textContent = total.toFixed(2);
        localStorage.setItem('cart', JSON.stringify(cart));
    }

    // Handle item removal
    cartItemsList.addEventListener('click', (event) => {
        if (event.target.classList.contains('remove-item')) {
            const id = event.target.getAttribute('data-id');
            const index = cart.findIndex(item => item.id === id);

            if (index !== -1) {
                cart.splice(index, 1);
                updateCart();
            }
        }
    });

    
    document.getElementById('checkout-button').addEventListener('click', () => {
        
        open('payment.html')
    });

    
    updateCart();
});
