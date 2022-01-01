

function paging(total, current, pre, next){


    var sortElement = $('.sort-function-price');
    console.log(window.location.href);
    if(window.location.href.includes('?sort=1')){
        sortElement.parent().prev()[0].innerText = 'Thời gian kết thúc giảm dần';
    }
    if(window.location.href.includes('?sort=2')){
        sortElement.parent().prev()[0].innerText = 'Giá tăng dần';
    }
    // var total = Number.parseInt("{{this.totalPage}}");
    // var current = Number.parseInt("{{this.page}}");
    // var pre = Number.parseInt(("{{this.prePage}}"));
    // var next = Number.parseInt(("{{this.nextPage}}"));
    console.log(total, current)
    if(total < current){
        return;
    }
    $('#pagination').twbsPagination({
        startPage: current,
        totalPages: total,
        visiblePages: 5,
        onPageClick: function (event, page) {
            var allPageElements = $('.page-link');
            for(let i =0 ;i < allPageElements.length;i++) {
                if(allPageElements[i].innerText === 'First'){
                    allPageElements[i].href = "?page=1";
                }
                if(allPageElements[i].innerText === 'Last'){
                    allPageElements[i].href = "?page=" + total;
                }
                if(allPageElements[i].innerText === 'Previous'){
                    allPageElements[i].href = "?page=" + pre;
                }
                if(allPageElements[i].innerText === 'Next'){
                    allPageElements[i].href = "?page=" + next;
                }
            }
            var pageElements = ($('.page-link').slice(2,$('page-link').length -2));
            for(let i =0 ;i < pageElements.length;i++) {
                pageElements[i].href = "?page=" + pageElements[i].innerText;
            }
        }
    });
    var pageElements = $('.page-link');
    for(let i =0 ; i < pageElements.length;i++){
        pageElements[i].addEventListener('click',function (e){
            if(this.innerText == current){
                e.preventDefault();
            }
            else{
                location.href = this.href;
            }
        });
    }
}
