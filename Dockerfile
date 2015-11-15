FROM         ubuntu:14.04.2
MAINTAINER   Thibault Deheurles <tdeheurles@gmail.com>

RUN apt-get update                                                                               && \
    apt-get install -y                                                                              \
            libunwind8                                                                              \
            libssl-dev                                                                              \
            unzip                                                                                   \
            libicu-dev                                                                              \
            curl                                                                                    \
            libcurl3-gnutls                                                                      && \
    curl -sSL https://raw.githubusercontent.com/aspnet/Home/dev/dnvminstall.sh                      \
    | DNX_BRANCH=dev sh                                                                          && \
    bash -c "source ~/.dnx/dnvm/dnvm.sh && dnvm install -r coreclr latest -u && dnvm upgrade -u"

ENV PATH /root/.dnx/runtimes/dnx-coreclr-linux-x64.1.0.0-rc2-16177/bin:$PATH

CMD /bin/bash
