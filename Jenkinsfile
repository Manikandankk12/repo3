pipeline {
    agent any

    stages {
        stage('Create Directory') {
            steps {
                sh '''
                    DIR_NAME="$WORKSPACE/myfolder"
                    mkdir -p "$DIR_NAME" || { echo "Failed to create directory"; exit 1; }
                    echo "Directory created: $DIR_NAME"
                '''
            }
        }

        stage('Create File') {
            steps {
                sh '''
                    FILE_NAME="$WORKSPACE/myfolder/hello.sh"
                    echo '#!/bin/bash' > "$FILE_NAME"
                    echo 'echo Hello from Jenkins!' >> "$FILE_NAME"
                    echo "File created: $FILE_NAME"
                '''
            }
        }

        stage('Execute File') {
            steps {
                sh '''
                    FILE_NAME="$WORKSPACE/myfolder/hello.sh"
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
                    DIR_NAME="$WORKSPACE/myfolder"
                    FILE_NAME="$DIR_NAME/hello.sh"
                    chmod 755 "$DIR_NAME"
                    chmod 744 "$FILE_NAME"
                    ls -l "$DIR_NAME"
                '''
            }
        }
    }
}

