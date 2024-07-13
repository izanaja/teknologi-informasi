FROM node:20.11.1

# set Timezone
ENV TZ=Asia/Jakarta
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Setting working directory. All the path will be relative to WORKDIR
WORKDIR /user/src/chat-apps

#Instaling project files
COPY ./ ./
RUN npm install sqlite sqlite3
RUN npm install 

# Expose port
EXPOSE 3000

# Runing the app
CMD [ "node", "./index.js"]
