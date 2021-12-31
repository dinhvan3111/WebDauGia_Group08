




export default {


	getPagingInfo(limit, page, total){
		let nPages = Math.floor(total / limit);

	    if(total % limit > 0) {
	    	nPages++;
	    }

	    var nextPage, prePage, disableNext, disablePre;
	    if(+nPages === 0 || +nPages === 1){
	        disableNext = true;
	        disablePre = true;
	    }

	    else if(+page === 1){
	        prePage = +page;
	        nextPage = +page + 1;
	        disableNext = false;
	        disablePre = true;
	    }

	    else if(+page === nPages){
	        prePage = +page - 1;
	        nextPage = +page;
	        disableNext = true;
	        disablePre = false;
	    }

	    else{
	        nextPage = +page + 1;
	        prePage = +page - 1;
	        disableNext = false;
	        disablePre = false;
	    }


	    const pageNumber = [];
	    for(let i =1; i<= nPages; i++){
	        pageNumber.push({
	            value: i,
	            isCurrent: +page == i
	        });
	    }

	    return {
	    	nextPage: nextPage, 
	    	prePage: prePage, 
	    	disableNext: disableNext, 
	    	disablePre: disablePre,
	    	pageNumber: pageNumber,
			totalPage: nPages
	    }
	},




}