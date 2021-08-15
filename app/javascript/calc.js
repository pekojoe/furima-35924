function calc (){
  const itemPrice = document.getElementById("item-price");

  itemPrice.addEventListener('input', function(){
    const itemPriceValue = itemPrice.value 
    const tax = 0.1;
    const taxFee = itemPriceValue * tax;
    const profit = itemPriceValue - taxFee;
    const taxFeeArea = document.getElementById("add-tax-price");
    const profitArea = document.getElementById("profit");
    taxFeeArea.innerHTML = taxFee;
    profitArea.innerHTML = profit;
  })
}

window.addEventListener('load', calc)