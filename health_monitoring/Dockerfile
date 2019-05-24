




FROM nginx:1.14-alpine

ARG author="kinzun <baolei@protonmail.com>"
LABEL maitainer=${author}

ENV NG_DOC_ROOT='/data/web/html/'

RUN mkdir -p $NG_DOC_ROOT
ADD index.html ${NG_DOC_ROOT}

ADD te.sh /bin/

#COPY yum.repos.d /etc/yum.repos.d/
#ONBUILD ADD 
EXPOSE 80/tcp
# 健康监测
HEALTHCHECK --start-period=3s CMD wget -o - -q http://${IP:-0.0.0.0}:${PORT:-8080}/

CMD ["/usr/sbin/nginx","-g","daemon off;    "]

ENTRYPOINT ["/bin/te.sh"]

