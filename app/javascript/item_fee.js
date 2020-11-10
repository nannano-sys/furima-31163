window.addEventListener('load', ()=> {
  console.log("OK"); 

  const priceInput = document.getElementById("item-price")
  const salesProfit = document.getElementById("profit")
  priceInput.addEventListener("input", ()=>{
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById('add-tax-price')
    addTaxDom.innerHTML = Math.floor(inputValue * 1/10);
    salesProfit.innerHTML = Math.floor(inputValue * 9/10);
  })
})