import moment from 'moment';
import numeral from 'numeral';
import productModel from './product.model.js';
import accountModel from './account.model.js';
import mailing from './mailing.transaction.model.js';

async function checkExpiredProduct(domain){
    const expiredProducts = await productModel.findExpriredProduct();
    await productModel.endAuction();
    // console.log(expiredProducts);
    // console.log('in check func ', domain);
    if(expiredProducts !== null){
        for(let i = 0; i < expiredProducts.length; i++){
            let seller_name = expiredProducts[i].seller_name;
            // let id_seller = expiredProducts[i].id_seller;
            let seller_email = expiredProducts[i].seller_email;
            let product_name = expiredProducts[i].product_name;
            let link_product = domain + '/products/' + expiredProducts[i].product_id;
            let expired_date = moment(expiredProducts[i].expired_date, 
                            'YYYY/MM/DD HH:mm:ss').format('DD/MM/YYYY HH:mm:ss');


            if(expiredProducts[i].id_win_bidder !== null){
                let bidder_info = await accountModel.findID(expiredProducts[i].id_win_bidder);
                let link_bidder = domain + '/profile/' + bidder_info.id;
                let win_price = numeral(expiredProducts[i].price).format('0,0');
                await mailing.endBidding_sendSeller(seller_name, seller_email,
                            product_name, link_product,
                            bidder_info.name, 
                            link_bidder, win_price);

                await mailing.endBidding_sendBidder(bidder_info.name, 
                            bidder_info.email, product_name, 
                            link_product, win_price);
            }
            else{
                // Đấu giá kết thúc, không có người mua
                await mailing.endBidding_noOneBid(seller_name,
                    seller_email, product_name,
                    link_product, expired_date);
            }
        }
    }
}

export default {
    async run(domain){
        // console.log(domain);
        setInterval(async function() {
            await checkExpiredProduct(domain);

        }, 60 * 1000);
    }
}