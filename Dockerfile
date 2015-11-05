FROM windowsservercore

# Set environment variables to work around issues
ENV USERPROFILE c:\\aspnetvnext
ENV DNX_PACKAGES c:\\aspnetvnext\\dnx

# Download and install dnvm and coreclr
RUN powershell -executionpolicy unrestricted -Command "&{$Branch='dev';iex ((new-object net.webclient).DownloadString('https://raw.githubusercontent.com/follesoe/Home/dev/dnvminstall.ps1'))}"
RUN dnvm upgrade -r coreclr

# Copy code across to app and restore dependencies
ADD . /app
WORKDIR /app
RUN dnu restore

# Start kestrel web server
ENTRYPOINT ["dnx", "kestrel"]
