# microservice-post

### Design 
- https://www.figma.com/file/TylTzmD7w4muE6vvV3U1Sv/Social-media?type=design&node-id=0-1&t=wxWHnGoYCpnANoYv-0

### Table user
``` 
{
  name: 'Nguyen Van Dia',
  email: 'nguyenvandiatlvn3@gmail.com',
  password: '$2a$10$vVA4RGgUiSXFjXr41bqV4ehqBWk01uT1K0TNipTPD51pP1Zy4GJ7q',
  avatar: '//www.gravatar.com/avatar/a3db5c8c2f494ec997d78887e2cfd9e1? s=200&r=pg&d=mm',
  date: 2023-05-05T13:04:19.804Z
}
```

### Table profile
``` 
{
	user: {
		type: mongoose.Schema.Types.ObjectId,
		ref: "user",
	  },
	  phone:{
	  	type: String,
	  },
	  status: {
		type: String,
		required: true,
	  },
	  from:{
	    type: String,
		required: true,
	  },
	  education: [
	   {
		  school: {
			type: String,
			required: true,
		  },
		}
	  ],
	  social: {
		youtube: {
		  type: String,
		},
		twitter: {
		  type: String,
		},
		facebook: {
		  type: String,
		},
		linkedin: {
		  type: String,
		},
		instagram: {
		  type: String,
		},
	  },
	  date: {
		type: Date,
		default: Date.now(),
	  },
}
```

### Table post
``` 
user: {
    type: mongoose.Schema.Types.ObjectId,
    ref: "user",
  },
  text: {
    type: String,
    required: true,
  },
  image:{
    type: String,
  },
  name: { type: String },
  avatar: { type: String },
  likes: [
    {
      user: {
        type: mongoose.Schema.Types.ObjectId,
        ref: "user",
      },
    },
  ],
  comments: [
    {
      user: {
        type: mongoose.Schema.Types.ObjectId,
        ref: "user",
      },
      text: { type: String, required: true },
      avatar: { type: String },
      date: { type: Date, default: Date.now },
    },
  ],
  date: { type: Date, default: Date.now },
```
![1683858192446](https://github.com/Dia2001/architecture-microservice/assets/88370983/97e7a0fe-cdbe-41cf-89b4-1c5eb375ee1e)
![diem](https://github.com/Dia2001/architecture-microservice/assets/88370983/88745d2f-39c6-4a81-bb64-31b6645100e3)


