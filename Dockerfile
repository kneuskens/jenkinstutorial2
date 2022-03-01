FROM https://hub.docker.com/r/rodolpheche/wiremock

COPY api_tests/stubs /home/wiremock
COPY api_tests/stubs/responses/pet-response.json /home/wiremock/__files/
COPY api_tests/stubs/responses/dog.json /home/wiremock/__files/
COPY api_tests/stubs/responses/cat.json /home/wiremock/__files/
COPY api_tests/stubs/responses/fish.json /home/wiremock/__files/