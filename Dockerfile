# FROM openshift/nodejs-010-centos7
FROM nodeshift/centos7-s2i-web-app
COPY . /app/

EXPOSE 8080
CMD ["node", "/app/myapp.js"]
