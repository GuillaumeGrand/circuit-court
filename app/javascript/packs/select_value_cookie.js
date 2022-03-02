
let select_quantity = document.getElementsByName("cookie_quantity")

select_quantity.forEach( element => element.addEventListener('change', function() {
  quantity = String(this.value)
  let cook_div = element.closest("div");
  let str = cook_div.querySelector("a").href;
  let parts = str.split('/');
  let id = parts[parts.length - 1];
console.log(1)
  const csrfToken = document.querySelector("[name='csrf-token']").content

        let myInit = { method: 'PATCH',
                      headers: {
                        "X-CSRF-Token": csrfToken,
                        "Content-Type": "application/json"
                      },
                      body: JSON.stringify({ quantity: quantity }),
                    };

        fetch('cart_items/' + id,  myInit)
  
  
}
)
);
