const mongoose=require('mongoose')

const ImageSchema = mongoose.Schema({
    name:{
        type:String,
        require:true
    },
    image:{
        data:Buffer,
        contentType:String,
    },
    isPost:Boolean,
    by:{
        type: mongoose.Schema.Types.ObjectId,
        ref: "user",
        require:true
    },
    onPost:{
        type: mongoose.Schema.Types.ObjectId,
        ref: "post",
        require:false
    }
})

module.exports=ImageModel= mongoose.model('image',ImageSchema);