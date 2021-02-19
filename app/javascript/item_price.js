function item_price() {
  const priceInput = document.getElementById("item-price");
  const addTaxDom = document.getElementById("add-tax-price");
  const profitNumber = document.getElementById("profit");
  
  priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;

  addTaxDom.innerHTML = (Math.floor(inputValue * 0.1));

  const value_result = inputValue * 0.1
  profitNumber.innerHTML = (Math.floor(inputValue - value_result));
  });
}

window.addEventListener('load', item_price);