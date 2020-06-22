FROM quay.io/vanessa/rse
COPY entrypoint.sh /entrypoint.sh
ENV RSE_PORT=5000
ENV RSE_DATABASE=filesystem
EXPOSE 5000
ENTRYPOINT ["/bin/bash"]
WORKDIR /github/workspace/
CMD ["/entrypoint.sh"]
