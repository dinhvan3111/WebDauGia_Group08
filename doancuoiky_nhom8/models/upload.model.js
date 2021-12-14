import multer from 'multer';
import fs from 'fs';

function addDir(newDir){
	fs.mkdirSync(newDir, async function (err) {
		if(err){
			console.error(err);
		}
		else{
			console.log('Created');
		}
	});
};

function deleteDir(path){
	fs.rmdirSync(path, { recursive: true }, function (err) {
	    if (err) {
	        console.error(err);
	    }
	    else{
			console.log('Deleted');
		}
	});
};


export default{
	async uploadImg(path, fieldArray, req, res){
		// return new Promise( function (resolve,reject) {
			addDir(path);
			const storage = multer.diskStorage({
			destination: function(req, file, cb) {
				if (file.fieldname === "imgThumbnail") {
					addDir(path + '/thumb');
				  	cb(null, path + '/thumb');
				} else {
				    cb(null, path);
				}
			},
				filename: function(req, file, cb) {
				    cb(null, file.originalname);
			}
			});

			const upload = multer({ storage: storage });

			upload.fields(fieldArray) (req, res, function(err) {
				// console.log(req.body);
				if(err){
					console.error(err);
					return false;
				}
				else{
					return true;

				}
			});
		// });
	},

	getAllFileName(path, id_product){
		const entries = fs.readdirSync(path);
		const thumb = fs.readdirSync(path + '/thumb')[0];
		const imgsExtra = [];
		for(let i = 0; i < entries.length; i++){
			if(entries[i] != 'thumb'){
				imgsExtra.push(id_product + '/' + entries[i]);
			}
		}
		return {
			thumb: thumb,
			imgsExtra: imgsExtra
		};
	}
}