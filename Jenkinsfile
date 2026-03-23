pipeline {
    agent any

    stages {
        stage('Create Directory') {
            steps {
                sh '''
                    #!/bin/bash
                    DIR_NAME="/home/administrator/myfolder"

                    # Try to create directory with sudo
                    sudo mkdir -p "$DIR_NAME"

                    # Check if directory exists
                    if [ -d "$DIR_NAME" ]; then
                        echo "Directory created: $DIR_NAME"
                    else
                        echo "Failed to create directory: $DIR_NAME"
                        exit 1
                    fi
                '''
            }
        }

        stage('Create File') {
            steps {
                sh '''
                    #!/bin/bash
                    FILE_NAME="/home/administrator/myfolder/hello.sh"

                    if [ -d "/home/administrator/myfolder" ]; then
                        echo '#!/bin/bash' > "$FILE_NAME"
                        echo 'echo Hello from Jenkins!' >> "$FILE_NAME"
                        echo "File created: $FILE_NAME"
                    else
                        echo "Directory not found, skipping file creation."
                        exit 1
                    fi
                '''
            }
        }

        stage('Execute File') {
            steps {
                sh '''
                    #!/bin/bash
                    FILE_NAME="/home/administrator/myfolder/hello.sh"

                    if [ -f "$FILE_NAME" ]; then
                        bash "$FILE_NAME"
                    else
                        echo "File not found: $FILE_NAME"
                        exit 1
                    fi
                '''
            }
        }

        stage('Change Permissions') {
            steps {
                sh '''
                    #!/bin/bash
                    DIR_NAME="/home/administrator/myfolder"
                    FILE_NAME="$DIR_NAME/hello.sh"

                    if [ -f "$FILE_NAME" ]; then
                        sudo chmod 755 "$DIR_NAME"
                        sudo chmod 744 "$FILE_NAME"
