# Dockerfile
# Base image
FROM python:3.9
# Copy test project files to the image folder
COPY . /robotFrameworkView
# Make the folder as a working directory
WORKDIR /robotFrameworkView
# Install the test project libraries
RUN pip install -r requirements.txt
#RUN chmod +x /frontend-integration-tests/scripts/executeTest.sh
ENTRYPOINT ["robotFrameworkView"]
#CMD ["suite","testTag","testCaseName"]

