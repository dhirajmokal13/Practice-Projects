document.getElementsByName("quantity").forEach(qua => {
    qua.addEventListener("change", e => {
        document.getElementById(`cart-price-${e.target.dataset.id}`).innerHTML = e.target.value * e.target.dataset.price;
        let finalPrice = 0;
        document.getElementsByName("cart-price").forEach(price => {
            finalPrice += Number(price.innerHTML);
        })
        document.getElementById("total-costs").innerHTML = finalPrice.toFixed(2);
        document.getElementById("subTotal").value = finalPrice.toFixed(2);
    })
})