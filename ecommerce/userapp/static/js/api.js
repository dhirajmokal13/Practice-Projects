document.getElementsByName("crtBtn").forEach((cart)=>{
    cart.addEventListener("click", e => {
        fetch(`/cart/${e.target.dataset.id}`).then(res => res.json())
        .then(res=>{
            if (res.success) alert(`${e.target.dataset.name} Successfully Added To Cart`)
        }).catch(err =>{
            console.error(err);
        })
    })
})
