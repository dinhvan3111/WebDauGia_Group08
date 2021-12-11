let getQueueLength = function() {
    return Math.round(12 * Math.random());
};

export default {
    async run(){
        setInterval(function() {
            let queueLength = getQueueLength();

            console.log(`The queue at the McDonald's drive-through is now ${queueLength} cars long.`);

            if (queueLength === 0) {
                console.log('Quick, grab your coat!');
            }

            if (queueLength > 8) {
                return console.log('This is beginning to look impossible!');
            }
        }, 3 * 1000);
    }
}