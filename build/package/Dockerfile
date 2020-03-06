# Pull from scratch golang packages (no OS-overhead)
FROM scratch

MAINTAINER {{maintainer_name}} <{{maintainer_email}}>

ADD {{linux_executable}} {{executable_name}}

EXPOSE {{healthcheck_port}}
EXPOSE {{tcp_port}}

ENTRYPOINT ["/{{executable_name}}"]