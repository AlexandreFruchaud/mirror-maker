FROM bitnami/kafka:2.6.0
USER root

ENV http_proxy="http://proxy-internet-aws-china-production.subsidia.org:3128"
ENV https_proxy="http://proxy-internet-aws-china-production.subsidia.org:3128"

RUN install_packages gettext

ADD ./mm2.template /opt/mirrormaker/mm2.template
ADD ./run.sh /opt/mirrormaker/run.sh
RUN chmod +x /opt/mirrormaker/run.sh

RUN mkdir -p /var/run/mirrormaker
RUN chown 1234 /var/run/mirrormaker

ENV TOPICS .*
ENV DESTINATION "source-cluster:9092"
ENV SOURCE "localhost:9092"
ENV TASKS_MAX 1
ENV REFRESH_TOPIC_INTERVAL_SECONDS 30

USER 1234
CMD /opt/mirrormaker/run.sh
