FROM openresty/openresty:1.21.4.1-0-alpine

# Copy fallback nginx.conf (ConfigMap overrides this at runtime)
COPY nginx.conf /etc/openresty/nginx.conf

EXPOSE 80

CMD ["openresty", "-g", "daemon off;"]