# Dockerfile
# Base image
FROM python:3.9
# Copy test project files to the image folder
COPY . /frontend-integration-tests
# Make the folder as a working directory
WORKDIR /frontend-integration-tests
# Install the test project libraries
RUN pip install -r requirements.txt
ENTRYPOINT ["/frontend-integration-tests/scripts/executeTest.sh"]
CMD ["suite","testTag","testCaseName"]

