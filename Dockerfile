FROM nginx:latest
RUN sed -i 's/nginx/TimBernersLee/g' /usr/share/nginx/html/index.html #on remplace nginx par TimBernersLee sur la page par défaut
EXPOSE 80
