const buyBtns=document.querySelectorAll('.js-buy-ticket');
        const modal=document.querySelector('.js-modal');
        const modalClose=document.querySelector('.js-modal-close');
        const modalContainer=document.querySelector('.js-modal-container');
        function showBuyTickets(){
            modal.classList.add("open");
        }
        function hiddenBuyTickets(){
            modal.classList.remove('open');
        }
        for(const buyBtn of buyBtns){
          buyBtn.addEventListener('click',showBuyTickets)  
        }
       
        modalClose.addEventListener('click',hiddenBuyTickets);
        modal.addEventListener('click',hiddenBuyTickets); 
        modalContainer.addEventListener('click',function(event){
                event.stopPropagation();
        })