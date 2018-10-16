# Inherit from official Salus image.
FROM coinbase/salus

# Add custom scanners to the Salus application.
COPY scanners/* /home/lib/salus/scanners/
