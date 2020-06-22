FROM quay.io/vanessa/rse
COPY entrypoint.sh /entrypoint.sh
ENV RSE_PORT=5000
EXPOSE 5000
ENTRYPOINT ["/bin/bash"]
CMD ["/entrypoint.sh"]
