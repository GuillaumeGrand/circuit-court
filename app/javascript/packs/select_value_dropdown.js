

  let select_quantity = document.querySelectorAll('.select_quantity')

  for(const [key, value] of Object.entries(select_quantity)){

    value.addEventListener('change', function() {
      quantity = String(this.value)
      console.log(quantity)
      str = this.closest(".edit_cart_item").getAttribute("id");
      id = str.split('item_')[1];

        const csrfToken = document.querySelector("[name='csrf-token']").content

        let myInit = { method: 'PATCH',
                      headers: {
                        "X-CSRF-Token": csrfToken,
                        "Content-Type": "application/json"
                      },
                      body: JSON.stringify({ quantity: quantity }),
                    };

        quantity = String(this.value)
        fetch('cart_items/' + id,  myInit)
    });
  }

