FROM node:14

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

ENV PORT=5010
ENV jwtSecret=socialMedia
ENV mongoURI=mongodb://host.docker.internal:27017/Users
ENV DIA=https://scontent.fdad1-2.fna.fbcdn.net/v/t39.30808-1/340828585_896149781688942_1231794472383275711_n.jpg?stp=dst-jpg_p160x160&_nc_cat=106&ccb=1-7&_nc_sid=7206a8&_nc_ohc=waDYXHEFKPIAX85Uosj&_nc_ht=scontent.fdad1-2.fna&oh=00_AfAp5D9NUIhJu_q5OAnARl-U-7sxn0CeWf78sXth-0oKWg&oe=646D3589
ENV SANG=https://scontent.fdad1-2.fna.fbcdn.net/v/t39.30808-6/309555904_3345505282351225_2392889519684656326_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=bjdRbJlMFOcAX-bGL6P&_nc_ht=scontent.fdad1-2.fna&oh=00_AfCoHsqsrrTSEo8BLDlmCVhpyByYebBolm-ovG-uqpWoiQ&oe=646E4062
ENV TIEN=a
ENV THO=https://scontent.fdad2-1.fna.fbcdn.net/v/t1.6435-9/119600019_378825993110412_4141784903547007925_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=174925&_nc_ohc=PGQWekoK5qMAX86gOk6&_nc_ht=scontent.fdad2-1.fna&oh=00_AfCVQVoxJtnu3FT38amt-VVkSNDTAUCJ2uRloZbdeidM8g&oe=648FEF2A
ENV DIEM=https://scontent.fdad1-2.fna.fbcdn.net/v/t39.30808-6/340653862_948224682984665_9069403001137286093_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=n7LNUKVdJDcAX83HexB&_nc_ht=scontent.fdad1-2.fna&oh=00_AfD52IFZE4j8ViSrkR-rljO0CLzBSuzLiyrZB2TElWQerw&oe=646DF91F
ENV QUYEN=https://scontent.fdad2-1.fna.fbcdn.net/v/t39.30808-6/324017096_668001488393279_5952457942565797593_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=cNmtlN-1H98AX8Niym2&_nc_ht=scontent.fdad2-1.fna&oh=00_AfDfz84QAx4rZk72mFZAe49C9sWSxn1upghqzGEuwc1fNw&oe=646E462C
ENV OTHER=https://s.gravatar.com/avatar/e753f9af9008b724d5852cf5181999e9?s=100&r=x&d=retro

EXPOSE 5010

CMD [ "npm", "start" ]
